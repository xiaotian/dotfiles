set cpoptions+=$

" turn off autoclose '<' for these file types
autocmd FileType typoscript,zsh,sh,ruby,cpp,c,java
  \ let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "<")
