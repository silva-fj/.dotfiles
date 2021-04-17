autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" JenkinsFile
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

" Lua formatting
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting()
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting()
