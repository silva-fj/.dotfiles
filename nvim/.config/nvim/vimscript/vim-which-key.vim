" Key Mappings
nnoremap <silent> <Leader> :WhichKey '<Space>'<CR>

" WhichKey Configuration
set timeoutlen=500
let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
let g:which_key_map.f = {
      \ 'name' : '+Flutter Commands' ,
      \ 'r' : [':CocCommand flutter.run', 'Run Flutter'],
      \ 'a' : [':CocCommand flutter.attach', 'Attach running app'],
      \ 'u' : [':CocCommand flutter.pub.get', 'Update dependencies (pub get)'],
      \ 'o' : [':CocCommand flutter.devices', 'Open devices list'],
      \ 'e' : [':CocCommand flutter.emulators', 'Open emulators list'],
      \ 'R' : [':CocCommand flutter.dev.hotRestart', 'Hot restart'],
      \ 'l' : [':CocCommand flutter.dev.openDevLog', 'Open flutter dev log server'],
      \ 'd' : [':CocCommand flutter.dev.openDevToolsProfiler', 'Open devtools debugger'],
      \ 's' : [':CocCommand flutter.dev.screenshot', 'To save a screenshot to flutter.png'],
      \ 'q' : [':CocCommand flutter.dev.quit', 'Quit server'],
      \ 'p' : [':CocCommand flutter.dev.openProfiler', 'Open observatory debugger and profiler web page'],
      \ }
call which_key#register('<Space>', "g:which_key_map")
