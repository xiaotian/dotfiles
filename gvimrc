" .gvimrc is not read until all plugins have been loaded, by which time all the mappings
" have already been created with the default map leader.  .gvimrc is intended only for
" GUI-specific options, everything else should be in .vimrc

if has("win32")
    set guifont=monaco:h10
elseif has("mac")
    set guifont=Anonymous\ Pro:h12
    " set guifont=menlo:h11
endif

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

  " Command-Shift-F for Ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>

endif

" Start without the toolbar
set guioptions=aAce
set guioptions-=Tm
set guioptions+=r
set cpoptions+=$

set columns=120
set lines=36

map <Leader>y "*y
map <Leader>p "*p

" Default gui color scheme
color colorsponge


" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
