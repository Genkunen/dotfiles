#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define BUF_LEN 512

void WriteCommandImpl(const char* cmd, int shouldFilter) {
    static char buff[BUF_LEN] = { 0 };
    static const char* filter = " | grep -oE '\[0-9]+\\.[0-9]+\\.[0-9]+\\b'";
    static const char* redirect = " >> vergen.txt 2>> vergenerr.txt";

    size_t append_len = strlen(filter) + strlen(redirect) + 1;
    if(BUF_LEN < append_len) {
        exit(1);
    }
    size_t available_len = BUF_LEN - append_len;

    const char* src = cmd;
    const char* src_end = src + strlen(cmd);
    char* it = buff;
    while(available_len && src != src_end) {
        *it++ = *src++;
        --available_len;
    }

    if(!available_len) {
        exit(1);
    }

    if(shouldFilter) {
        strcat(it, filter);
    }
    strcat(it, redirect);

    int res = system(buff);
    if(res) {
        char errbuff[BUF_LEN + 10] = {0};
        strcat(strcat(strcat(errbuff, "echo \""), buff), "\" >> vergenerr.txt");
        system(errbuff);
    }
    memset(buff, 0, BUF_LEN);
}

#define WriteCommand(cmd) WriteCommandImpl(cmd, 1);
#define WriteCommandUnfiltered(cmd) WriteCommandImpl(cmd, 0);

int main(void) {
    FILE* gen = fopen("vergen.txt", "w"); fclose(gen);
    FILE* err = fopen("vergenerr.txt", "w"); fclose(err);

    if(!gen || !err) {
        return 1;
    }

    WriteCommand("gcc --version | head -n 1");
    WriteCommand("clang --version | head -n 1");
    WriteCommand("dart --version");
    WriteCommand("elixir --version | tail -n 1");
    WriteCommandUnfiltered("erl -noshell -eval 'io:fwrite(\"~s\\n\", [erlang:system_info(otp_release)]).' -s erlang halt");
    WriteCommand("gfortran --version | head -n 1");
    WriteCommand("go version");
    WriteCommand("ghc --version");
    WriteCommand("java --version | head -n 1");
    WriteCommand("node --version");
    WriteCommand("julia -v");
    WriteCommand("lua -v");
    WriteCommand("ocaml --version");
    WriteCommandUnfiltered("odin version | awk '{print $3}'");
    WriteCommand("perl -v | head -n 1");
    WriteCommand("php -v | head -n 1");
    WriteCommand("python --version");
    WriteCommand("Rscript --version");
    WriteCommand("ruby -v");
    WriteCommand("rustc -V");
    WriteCommand("zig version");

    return 0;
}
