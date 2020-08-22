# edit-help.vim
Vim plugin to support editing help file of plugins

## Installation

Use your favorite plugin manager like:

* [vim-plug](https://github.com/junegunn/vim-plug):

    Plug 'rcmdnk/edit-help.vim'

* [dein.vim](https://github.com/Shougo/dein.vim):

    dein#add('rcmdnk/edit-help.vim')

## Usage

When you are writing a help file for Vim plugins,
you may write a line like:

    vim:tw=78:ts=8:ft=help:norl:noet

then the file is recognized as `help` type.

By default, Vim set environments for `help` type file as readonly and nomodifiable.

To edit it by Vim, you need to change some settings.

To make it easy, use `:EditHelp`.
Then you can modify and save the changes.
In addition, concealed characters will be shown.

To check **help view**, use `:NoEditHelp` to restore settings.

Or you can use `:EditHelpToggle` to toggle edit mode and **help view** mode.

## Options

* `g:edit_help_textwidth`

`textwidth` value when editing help type files.

Default value is: `78`

* `g:edit_help_tabwidth`

Tab width when editing help type files.

Default value is: `8`
