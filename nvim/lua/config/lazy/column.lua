local chars = { '░','░' }
for i = 121, 999 do
    table.insert(chars, '▒')
end

return {
    'lukas-reineke/virt-column.nvim',
    opts = {
        char = chars,
        virtcolumn = '80, 120, ' .. table.concat(vim.fn.range(121, 999), ',')  
    },
}
