all:
	cp ../plotly_book/images/* ./images/
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
	#Rscript -e "rmarkdown::render('index.Rmd', 'rmarkdown::pdf_document', clean = FALSE)"