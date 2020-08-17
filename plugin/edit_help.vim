if exists('g:loaded_edit_help')
  finish
endif
let g:loaded_edit_help = 1

let s:save_cpo = &cpo
set cpo&vim

let g:edit_help_textwidth = get(g:, 'edit_help_textwidth', 78)
let g:edit_help_tabwidth = get(g:, 'edit_help_tabwidth', 8)

command! EditHelp call edit_help#edit_help()
command! NoEditHelp call edit_help#no_edit_help()
command! EditHelpToggle call edit_help#edit_help_toggle()

let &cpo = s:save_cpo
unlet s:save_cpo
