VERSION = 00
DOCNAME = draft-ietf-ntp-implementation-guidance
TARGETS = $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html
MMARK = mmark # Version 1.3.6
MMARK_OPTIONS = --xml2 --page
#MMARK = /home/willem/bin/mmark # Version 2.0.46
#MMARK_OPTIONS = -2

all: $(TARGETS)

$(DOCNAME)-$(VERSION).txt: $(DOCNAME).xml
	xml2rfc --text -o $@ $<

$(DOCNAME)-$(VERSION).html: $(DOCNAME).xml
	xml2rfc --html -o $@ $<

$(DOCNAME).xml: $(DOCNAME).md
	sed 's/@DOCNAME@/$(DOCNAME)-$(VERSION)/g' $< \
	| $(MMARK) $(MMARK_OPTIONS) \
	| sed 's/ion>Phys/ion abbrev="PTB">Phys/g' > $@

clean:
	rm -f $(TARGETS) $(DOCNAME).xml

