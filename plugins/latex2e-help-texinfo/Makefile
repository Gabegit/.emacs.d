# Public domain.  Originally written 2006, Karl Berry.
# Makefile for latexrefman.

texi2dvi = texi2dvi --batch --tidy --build-dir=$*.t2dvi
texi2pdf = texi2pdf --batch --tidy --build-dir=$*.t2pdf
#
makeinfo = makeinfo
texi2docbook = $(makeinfo) --docbook
texi2html = $(makeinfo) --html --no-split
texi2info = $(makeinfo) --no-split
texi2txt = $(makeinfo) --plaintext --no-split -o $@
texi2xml = $(makeinfo) --xml

%.pdf: %.texi
	$(texi2pdf) $<
%.dvi: %.texi
	$(texi2dvi) $<
%.dbk: %.texi
	$(texi2docbook) -o $@ $<
%.html: %.texi
	$(texi2html) $<
%.info: %.texi
	$(texi2info) $<
%.txt: %.texi
	$(texi2txt) $<
%.xml: %.texi
	$(texi2xml) $<

en_tex_output = latex2e.dvi latex2e.pdf
es_tex_output = latex2e-es.dvi latex2e-es.pdf
tex_output = $(en_tex_output) $(es_tex_output)
#
en_makeinfo_output = latex2e.info latex2e.html latex2e.txt \
                     latex2e.xml  latex2e.dbk
es_makeinfo_output = latex2e-es.info latex2e-es.html latex2e-es.txt \
                     latex2e-es.xml  latex2e-es.dbk
makeinfo_output = $(en_makeinfo_output) $(es_makeinfo_output)

all: makeinfo_output tex_output
makeinfo_output: $(makeinfo_output)
tex_output: $(tex_output)

mostlyclean clean:
	rm -rf latex2e.t2*

realclean distclean: clean
	rm -f $(all)

dist: 
	@rm -f spanish; ln -s . spanish
	tar cvzf latex2e-help-texinfo.tgz \
	  ChangeLog Makefile NEWS README ltx-help.el \
	  latex2e.texi $(en_makeinfo_output) latex2e.pdf \
    $(addprefix spanish/, latex2e-es.texi $(es_makeinfo_output) latex2e-es.pdf)
	@rm -f spanish
	@ls -l latex2e-help-texinfo.tgz
