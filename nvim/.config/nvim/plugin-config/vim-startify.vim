" Startify configuration
function! s:list_commits()
  let git = 'git -C '. getcwd()
  let commits = systemlist(git .' log --pretty=format:"%h %ad %an%d %Creset%s" --date=short -n10')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_lists = [
    \ { 'type': 'dir', 'header': ['   MUR '. getcwd()] },
    \ { 'type': function('s:list_commits'), 'header': ['   Commits'] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
    \ ]

let g:startify_bookmarks = [ 
    \ {'c': '~/.dotfiles/nvim/.config/nvim/init.vim'}, 
    \ {'s': '~/.dotfiles/nvim/.config/nvim/coc-settings.json'}, 
    \ {'t': '~/.zshrc'},
    \ ]
