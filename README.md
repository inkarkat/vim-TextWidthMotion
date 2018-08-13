TEXT WIDTH MOTION   
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

Many coding styles advocate a maximum line length; ASCII art uses a fixed text
width to represent diagrams and drawings with text. Vim has the 'textwidth'
setting, and can display a column guide with 'colorcolumn' to support that.
However, in order to locate lines that do not adhere to some width
requirements, one has to visually look out for them while scrolling, or use
searches with special width atoms.

This plugin provides mappings to jump to the next line that is shorter or
longer than a certain width. The base width is conveniently taken from Vim
options like 'colorcolumn' or 'textwidth', but can also be custom set, or even
passed as a [count].

USAGE
------------------------------------------------------------------------------

    ]>                      Go to [count] next line that is longer than ...
    [>                      Go to [count] previous line that is longer than ...
    ]<                      Go to [count] next line that is shorter than ...
    [<                      Go to [count] previous line that is shorter than ...
                            ... the virtual column from one of the following
                            sources, taking the first that is defined / larger
                            than zero:
                            - a [count] >= g:TextWidth_CountThreshold
                            - b:TextWidthMotion_Width
                            - g:TextWidthMotion_Width
                            - 'colorcolumn' (first value if multiple are defined)
                            - 'textwidth'

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-TextWidthMotion
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim TextWidthMotion*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the CountJump plugin ([vimscript #3130](http://www.vim.org/scripts/script.php?script_id=3130)), version 1.91 or higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

Overrides the default base width determined from either 'colorcolumn' or
'textwidth', either globally or just for the current buffer:

    let g:TextWidthMotion_Width = 42

Can still be overridden with a [count].

A [count] given before the motion that is equal or larger than the threshold
is interpreted as a custom width to search for, instead of jumping to the
[count]'th next occurrence.

    let g:TextWidthMotion_CountThreshold = 10

To change the default motion mappings, use:

    let g:TextWidthMotion_LongerMapping = '>'
    let g:TextWidthMotion_ShorterMapping = '<'

To also change the [ / ] prefix to something else, follow the instructions for
CountJump-remap-motions.

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-TextWidthMotion/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### GOAL
First published version.

##### 0.01    24-Mar-2018
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2018 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat <ingo@karkat.de>
