" Neovim Terminal Configuration
if has('nvim')
    tnoremap <Space><Esc> <C-\><C-n>
endif
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
