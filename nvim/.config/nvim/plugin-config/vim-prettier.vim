" Key Mappings
nmap ff :Prettier<CR>

" Auto commands 
autocmd BufWritePre *.js :Prettier
autocmd BufWritePre *.jsx :Prettier
autocmd BufWritePre *.ts :Prettier
autocmd BufWritePre *.tsx :Prettier
