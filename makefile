TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error -output-directory ./out/
PROJECT = lambda

UNAME := $(shell uname)
ifeq ($(UNAME), windows32) #set windows REMOVE and REMOVE_DIR
REMOVE = del
REMOVE_DIR = rd /s /q
OUT_PATH = .\out\\
endif

ifeq ($(UNAME), CYGWIN_NT-10.0-WOW) # test case
REMOVE = rm
REMOVE_DIR = rm -r
OUT_PATH = ./out/
endif

ifeq ($(UNAME), Linux)
REMOVE = rm
REMOVE_DIR = rm -r
OUT_PATH = ./out/
endif

all: delprev $(PROJECT).pdf delprevpresent presentation.pdf

presentation.pdf:
	$(TEX) presentation.tex

delprevpresent:
	$(REMOVE) $(OUT_PATH)presentation.pdf

$(PROJECT).pdf: $(PROJECT).tex
	$(TEX) $(PROJECT).tex

delprev:
	$(REMOVE) $(OUT_PATH)$(PROJECT).pdf

nice: all clean

clean:
	$(REMOVE) $(OUT_PATH)*.aux
	$(REMOVE) *.aux
	$(REMOVE) $(OUT_PATH)*.log
	$(REMOVE) *.log
	$(REMOVE) $(OUT_PATH)*.dvi
	$(REMOVE) *.dvi
	$(REMOVE) $(OUT_PATH)*.fdb_latexmk
	$(REMOVE) *.fdb_latexmk
	$(REMOVE) $(OUT_PATH)*.fls
	$(REMOVE) *.fls
	$(REMOVE_DIR) _minted-lambda
