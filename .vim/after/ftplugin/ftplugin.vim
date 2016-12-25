augroup ftplugin-settings
	au BufNewFile,BufRead *py setfiletype python
	au BufRead,BufNewFile *.cpp setfiletype cpp
	au BufRead,BufNewFile *.c setfiletype cpp
	au BufRead,BufNewFile *.tex setfiletype tex
	au BufRead,BufNewFile *.md setfiletype markdown
	au BufRead,BufNewFile *.mkd setfiletype markdown
augroup END
