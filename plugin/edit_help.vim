if exists('g:loaded_edit_help')
  finish
endif
let g:loaded_edit_help = 1

let s:save_cpo = &cpo
set cpo&vim

command! EditHelp call s:edit_help()
command! NoEditHelp call s:no_edit_help()
command! EditHelpToggle call s:edit_help_toggle()

let &cpo = s:save_cpo
unlet s:save_cpo
