TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error -output-directory ./out/
PROJECT = lambda

UNAME := $(shell uname)
ifeq ($(UNAME), windows32) #set windows REMOVE and REMOVE_DIR
REMOVE = del
REMOVE_DIR = rd /s /q
endif
ifeq ($(UNAME), CYGWIN_NT-10.0-WOW) # test case
REMOVE = rm
REMOVE_DIR = rm -r
endif
ifeq ($(UNAME), Linux)
REMOVE = rm
REMOVE_DIR = rm -r
endif

.PHONY: all clean

all: delprev $(PROJECT).pdf

delprev:
	$(REMOVE) $(PROJECT).pdf

$(PROJECT).pdf: $(PROJECT).tex
	$(TEX) $(PROJECT).tex

nice: all clean

clean:
	$(REMOVE) *.aux
	$(REMOVE) *.log
	$(REMOVE) *.dvi
	$(REMOVE) *.fdb_latexmk
	$(REMOVE) *.fls
	$(REMOVE_DIR) _minted-lambda
