autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" JenkinsFile
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

autocmd BufWritePre *.js :Prettier
autocmd BufWritePre *.jsx :Prettier
autocmd BufWritePre *.ts :Prettier
autocmd BufWritePre *.tsx :Prettier
