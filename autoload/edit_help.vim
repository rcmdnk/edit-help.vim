let s:save_cpo = &cpo
set cpo&vim

function! edit_help#edit_help()
  let w:edit_help = 1
  let w:save_list = &list
  let w:save_expandtab = &expandtab
  let w:save_modifiable = &modifiable
  let w:save_readonly = &readonly
  let w:save_tabstop = &tabstop
  let w:save_shiftwidth = &shiftwidth
  let w:save_softtabstop = &softtabstop
  let w:save_textwidth = &textwidth
  setlocal list noexpandtab modifiable noreadonly
  setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=78
  if exists('+colorcolumn')
    let w:save_colorcolumn = &colorcolumn
    setlocal colorcolumn=78
  endif
  if has('conceal')
    let w:save_conceallevel = &conceallevel
    setlocal conceallevel=0
    highlight link helpIgnore Conceal
    highlight link helpBar Conceal
    highlight link helpStar Conceal
    highlight link helpBacktick Conceal
  endif
endfunction

function! edit_help#no_edit_help()
  if !exists('w:edit_help')
    echo "edit_help was not executed, skipping..."
    return
  endif
  let w:edit_help = 0
  if w:save_list
    setlocal list
  else
    setlocal nolist
  endif
  if w:save_expandtab
    setlocal expandtab
  else
    setlocal noexpandtab
  endif
  if w:save_modifiable
    setlocal modifiable
  else
    setlocal nomodifiable
  endif
  if w:save_readonly
    setlocal readonly
  else
    setlocal noreadonly
  endif
  let &l:tabstop = w:save_tabstop
  let &l:shiftwidth = w:save_shiftwidth
  let &l:softtabstop = w:save_softtabstop
  let &l:textwidth = w:save_textwidth
  if exists('+colorcolumn')
    let &l:colorcolumn = w:save_colorcolumn
  endif
  if has('conceal')
    let &l:conceallevel = w:save_conceallevel
    highlight link helpIgnore Ignore
    highlight link helpBar Ignore
    highlight link helpStar Ignore
    highlight link helpBacktick Ignore
  endif
endfunction

function! edit_help#edit_help_toggle()
  if !exists('w:edit_help') || !w:edit_help
    edit_help#no_edit_help()
  else
    edit_help#edit_help()
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
