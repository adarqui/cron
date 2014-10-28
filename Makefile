all: sandbox
	cabal install

meta: sandbox
	cabal-meta install

sandbox:
	cabal sandbox init
