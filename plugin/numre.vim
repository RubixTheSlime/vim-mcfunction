function! Numre(a,b,c,d)
        return s:numre(a:a,a:b,a:c,a:d)
endfunction

function! s:numre(minn,maxn,mind,maxd)
        if a:mind > a:maxd
                return s:numre(a:minn,a:maxn,a:mind,a:mind)
        elseif a:mind < 1
                return s:numre(a:minn,a:maxn,1,a:maxd)
        elseif a:maxn=='-'
                " 123-999
        elseif a:maxn=='inf'
                if empty(a:maxd)
                        if a:mind <= 1
                                return '\d*'.s:numre(a:minn,'-',0,0)
                        else
                                return '\d\{'.(a:mind-len(a:minn)).',}'.s:numre(a:minn,'-',a:mind,0)
                        endif
                else
                        if a:maxd==a:mind
                                return '\d\{'.(a:mind-len(a:minn)).'}'.s:numre(a:minn,'-',a:mind,a:maxd)
                        else
                                return '\d\{'.(a:mind-len(a:minn)).','.(a:maxd-len(a:minn)).'}'.s:numre(a:minn,'-',a:mind,a:maxd)
                        endif
                endif
        elseif a:maxn < 0
                return '-'.s:numre(-a:maxn,-a:minn,a:mind,a:maxd)
        elseif a:minn < 0
                if abs(a:minn) == a:maxn
                        return '-\?\<'.s:numre(0,a:maxn,a:mind,a:maxd)
                elseif abs(a:minn) > a:maxn
                        return '-\?\<'.s:numre(0,a:maxn,a:mind,a:maxd).'\|-'.s:numre(a:maxn+1,abs(a:minn),a:mind,a:maxd)
                else
                        return '-\?\<'.s:numre(0,abs(a:minn),a:mind,a:maxd).'|'.s:numre(abs(a:minn)+1,a:maxn,a:mind,a:maxd)
                endif
        elseif a:minn > a:maxn
                return s:numre(a:maxn,a:minn,a:mind,a:maxd)
        elseif a:maxd == -1
                return '0*'.s:numre(a:minn,a:maxn,a:mind,len(a:maxn))
        elseif a:minn == 0
                if a:maxd > len(a:maxn)
                        " Keep adding zeros until they're equal
                        return s:numre(0,'0'.a:maxn,a:mind,a:maxd)
                elseif len(a:maxn)==1
                        " last digit
                        " optimize later
                        if a:maxn==0
                                return 0
                        elseif a:maxn==9
                                return '\d'
                        else
                                return '[0-'.a:maxn.']'
                        endif
                elseif a:maxd < len(a:maxn)
                        return s:numre(0,a:maxn,a:mind,len(a:maxn))
                elseif a:mind == a:maxd
                        " Return the number with the exact number of digits
                        if a:maxn =~ '^9*$'
                                " All nines left
                                return '\d\{'.len(a:maxn).'}'
                        else
                                let l:first = matchstr(a:maxn,'^.')
                                let l:rest = s:numre(0,matchstr(a:maxn,'^.\zs.*$'),a:maxd-1,a:maxd-1)
                                let l:tail = '\d'
                                let l:range = ''
                                if l:first == 1
                                        let l:range = '0'
                                elseif l:first == 2
                                        let l:range = '[01]'
                                else
                                        let l:range = '[0-'.(l:first-1).']'
                                endif
                                if a:maxd > 2
                                        let l:tail='\d\{'.(a:maxd-1).'}'
                                endif
                                if l:first == 0
                                        return '0'.l:rest
                                else
                                        return '\%('.l:range.l:tail.'\|'.l:first.l:rest.'\)'
                                endif
                        endif
                else
                        " Return the number with at least a:mind digits
                        let l:first = matchstr(a:maxn,'^.')
                        let l:tail = '\d'
                        let l:range = '1'
                        let l:under = ''
                        if a:mind == a:maxd-1
                                let l:under='\d\{'.a:mind.'}'
                        else
                                let l:under='\d\{'.a:mind.','.(a:maxd-1).'}'
                        endif
                        if l:first == 3
                                let l:range = '[12]'
                        elseif l:first > 3
                                let l:range = '[1-'.(l:first-1).']'
                        endif
                        if a:maxd > 2
                                if a:mind == a:maxd-1
                                        let l:tail='\d\{'.a:mind.'}'
                                else
                                        let l:tail='\d\{'.a:mind.','.(a:maxd-1).'}'
                                endif
                        endif
                        let l:rest = s:numre(0,matchstr(a:maxn,'^.\zs.*$'),a:maxd-1,a:maxd-1)
                        if l:first == 0
                                return l:rest
                        elseif l:first == 1
                                return '\%('.l:under.'\|1'.l:rest.'\)'
                        elseif a:mind <= 1
                                return '\%('.l:range.'\?'.l:tail.'\|'.l:first.l:rest.'\)'
                        else
                                return '\%('.l:under.'\|'.l:range.l:tail.'\|'.l:first.l:rest.'\)'
                        endif

                endif
        elseif a:maxn == a:minn
                " quick fix for now
                return a:maxn
        endif
        " WIP
        "        if empty(a:maxn)
        "                return '\d*'.s:numre(a:minn,'-',a:mind,a:maxd)
        "        elseif len(a:maxn) > len(a:minn)
        "                if len(a:maxn) > a:maxd
        "                        return matchstr(a:maxn,'^.').s:numre(0,matchstr(a:maxn,'^.\zs.*$'),a:mind,a:maxd).'\|'.s:numre(a:minn,'-',a:mind,a:maxd)
        "                return matchstr(a:maxn,'^.').s:numre(0,matchstr(a:maxn,'^.\zs.*$'),a:mind,a:maxd).'\|'.s:numre(a:minn,'-',a:mind,a:maxd)
        "        else
        "                " At this point they should be equal length
        "                let l:maxfirst=matchstr(a:maxn,'^.')
        "                let l:minfirst=matchstr(a:minn,'^.')
        "                let l:rest=s:numre(matchstr(a:minn,'^.\zs.*$'),matchstr(a:maxn,'^.\zs.*$'),a:mind,a:maxd)
        "                if l:maxfirst == l:minfirst
        "                        return l:maxfirst.
        "                elseif len(a:maxn) > a:maxd
        "
        "                        
        "                                
        "        elseif 
        "        endif
endfunction
