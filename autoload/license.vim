" Copyright (c) 2021, Ace <teapot@aceforeverd.com>
"
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:
"     * Redistributions of source code must retain the above copyright
"       notice, this list of conditions and the following disclaimer.
"     * Redistributions in binary form must reproduce the above copyright
"       notice, this list of conditions and the following disclaimer in the
"       documentation and/or other materials provided with the distribution.
"     * Neither the name of the <organization> nor the
"       names of its contributors may be used to endorse or promote products
"       derived from this software without specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
" DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
" DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
" (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
" ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
" (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
" SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

function! license#substituteCopyrightHolder(oldHolder, newHolder) abort
    let holderLine = search('copyright.*' . a:oldHolder)
    if holderLine > 0
        call setline(holderLine, substitute(getline(holderLine), a:oldHolder, a:newHolder, ''))
    else
        echomsg a:oldHolder . 'not found'
    endif
endfunction

function! license#rmFileName(holderName) abort
    let holderLine = search('copyright.*' . a:holderName)
    if holderLine > 2
        " avoid delete first line
        execute (holderLine - 1) . 'delete'
    else
        echomsg a:holderName . ' not found or copyright is the first line'
    endif
endfunction

" replace copyright line totally with newLine
" from 'Copyright.*a:holderName' -> a:newLine
function! license#substituteCopyrightLine(holderName, newLine) abort
    let holderLine = search('copyright.*' . a:holderName)
    if holderLine >= 1
        call setline(holderLine, substitute(getline(holderLine), 'copyright.*', a:newLine, ''))
    endif
endfunction
