default:
	mdbook serve

rust:
	make -C ugo-rust-book

build:
	-rm -rf book docs
	mdbook build
	-rm book/.gitignore
	-rm book/.nojekyll
	-rm -rf book/.git
	-rm -rf book/talks
	-rm -rf book/ugo-rust-book

	make -C ugo-rust-book build
	make build-talks

	mv book docs
	mv ugo-rust-book/book docs/ugo-rust-book

build-talks:
	mkdir -p ./book/talks
	cp -r ./talks/static-fix-prefix ./book/talks/static
	cp -r ./talks/go-compiler-intro ./book/talks/go-compiler-intro
	cp ./talks/go-compiler-intro.html ./book/talks/go-compiler-intro.html

clean:
