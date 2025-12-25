module Main where

import System.Process (readProcessWithExitCode)
import System.Exit (ExitCode(..))
import System.Environment (getArgs)
import System.IO (hPutStrLn, stderr)
import Data.Char (isDigit)
import Text.Printf (printf)

main :: IO ()
main = do
    args <- getArgs
    case args of 
        ["data"] -> getBatteryPercentage >>= putStr
        ["color"]      -> getBatteryPercentage >>= putStrLn . getBatteryColor
        []             -> putStrLn "[data, color]"
        (cmd:_)        -> putStrLn "unknown command"
    
getBatteryPercentage :: IO String
getBatteryPercentage = do 
    let cmd = "upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}'" 
    (exitCode, out, err) <- readProcessWithExitCode "bash" ["-c", cmd] ""
    case exitCode of 
        ExitSuccess   -> return out 
        ExitFailure _ -> do 
            hPutStrLn stderr err 
            fail "Command failed"

getBatteryColor :: String -> String
getBatteryColor str = 
    let numStr = filter isDigit str
        percentage = read numStr :: Double 
        clamped = max 0 (min 100 percentage)
        red = round $ 255 * (1 - clamped / 100) :: Int
        green = round $ 255 * (clamped / 100) :: Int
        blue = 0 :: Int
    in printf "#%02x%02x%02x" red green blue

