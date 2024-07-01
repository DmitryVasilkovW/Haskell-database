run:
	stack exec Haskell-database-exe

build:
	stack build

clean:
	stack clean

up:
	stack setup
	stack build
