autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" JenkinsFile
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

" Formatting
autocmd BufWritePre *.lua lua vim.lsp.buf.format()
autocmd BufWritePre *.js lua vim.lsp.buf.format()
autocmd BufWritePre *.jsx lua vim.lsp.buf.format()
autocmd BufWritePre *.ts lua vim.lsp.buf.format()
autocmd BufWritePre *.tsx lua vim.lsp.buf.format()

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
