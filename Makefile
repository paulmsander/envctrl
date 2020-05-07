PREFIX = /usr/local
MANDIR = $(PREFIX)/share/man
MANSECT = 1

all:
	@echo Nothing to be done for $@

empty =
FILES = \
	$(PREFIX)/bin/envctrl \
	$(PREFIX)/bin/envclean \
	$(PREFIX)/lib/env.cron \
	$(MANDIR)/man1/envctrl.1 \
	$(MANDIR)/man1/envclean.1 \
	$(MANDIR)/man1/env.cron.1 \
	$(empty)

$(PREFIX)/bin/%: %
	mkdir -p $(@D)
	cp $< $@
	chmod 755 $@

$(PREFIX)/lib/%:%
	mkdir -p $(@D)
	cp $< $@
	chmod 755 $@

$(MANDIR)/man$(MANSECT)/%.$(MANSECT): %.man
	mkdir -p $(@D)
	cp $< $@
	chmod 644 $@

install: $(FILES)
	@echo Installation complete.


