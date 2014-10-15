" misc plugins from misc sources

" Select surrounding text with the same indentation as current line
" http://vim.wikia.com/wiki/Visual_selection_of_indent_block
function SelectIndent()
	let cur_line = line(".")
	let cur_ind = indent(cur_line)
	let line = cur_line
	while indent(line - 1) >= cur_ind
		let line = line - 1
	endw
	exe "normal " . line . "G"
	exe "normal V"
	let line = cur_line
	while indent(line + 1) >= cur_ind
		let line = line + 1
	endw
	exe "normal " . line . "G"
endfunction
nnoremap <leader>vi :call SelectIndent()<CR>
