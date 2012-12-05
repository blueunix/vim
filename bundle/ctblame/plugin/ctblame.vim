
if exists("g:loaded_ctblame")
  finish
endif

function! CtBlame() range
  let tmpfile = tempname()
  let vbegin = line("'<")
  let vend = line("'>")
  let content = getbufline("", vbegin, vend)
  call writefile(content, tmpfile)
  echo tmpfile
  let cmd = ":!ctblame " . expand('%:p') . " " . tmpfile
  exec cmd
endfunction

vnoremap <silent> ;s :call CtBlame()<CR>
