if !exists("g:karma_command")
    let g:karma_command = "karma run spec/javascripts/karma.conf.coffee"
endif
if !exists("g:karma_filter")
    let g:karma_filter = " | sed 's/[^/]* <- //'"
endif

"function! RunKarma()
    "silent !clear
    "call Dispatch()
"endfunction

let &makeprg = g:karma_command . " " . g:karma_filter

" Match first error line
let &errorformat = '%+E%.%#Error: %m' . ','

" Match Chrome format
let &errorformat .= '%Z%.%#at%.%#(%f:%l:%c%.%#)' . ','

" Match PhantomJS format
let &errorformat .= '%Z%.%#at %f:%l:%c' . ','

" Ignore everything else
let &errorformat .= '%-G%.%#'

"nnoremap <buffer> <localleader>t :call RunKarma()<cr>
nnoremap <buffer> <localleader>t :Dispatch<CR>
