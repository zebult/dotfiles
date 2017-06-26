" let g:c_no_reserved_identifiers_start_underbar_lower_case=0

if !exists("c_no_reserved_identifiers_start_underbar_lower_case")
	syntax match cReservedIdentifiers /[^[:alnum:]]\zs_\w\k*/ containedin=cPreCondit
	syntax match cReservedIdentifiers /^\zs_\w*/
else
	syntax match cReservedIdentifiers /[^[:alnum:]]\zs_\u\k*/ containedin=cPreCondit
	syntax match cReservedIdentifiers /^\zs_\u\k*/
endif
syntax match cReservedIdentifiers /\w*__\w*/ containedin=cPreCondit

highlight default link cReservedIdentifiers ReservedIdentifiers
highlight default link ReservedIdentifiers WarningMsg

highlight link cReservedIdentifiers cType
