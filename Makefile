all:
	-isabelle build -d . DPO-Formal
	find . -type f -name "*.tex" -exec sed -n '/DefineSnippet/,/EndSnippet/p' {} + > ../snippet.tex
