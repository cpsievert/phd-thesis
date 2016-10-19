all:
	cp ../plotly_book/images/* ./images/
	# apparently webshot/phantomjs can't render some plots...
	cp ../plotly_book/screenshots/* ./screenshots
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', clean_envir = T)"
	# convert manual png screenshots to pdf and replace the blank ones
	# mogrify -format pdf -density 150 -- *.png

clean:
	rm -r _bookdown_files/
	