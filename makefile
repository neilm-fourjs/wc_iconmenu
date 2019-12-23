
PROJ=wc_iconMenu
PROG=wc_iconMenu_main
BASE=$(PWD)
TRG=bin

export FGLIMAGEPATH=$(BASE)/pics:$(FGLDIR)/lib/image2font.txt
export FGLRESOURCEPATH=$(BASE)/etc

all: $(TRG)/$(PROG).42r

$(TRG)/$(PROG).42r: src/*.4gl src/*.per
	gsmake -t $(PROG) $(PROJ).4pw

update:
	git pull

run: $(TRG)/$(PROG).42r
	cd $(TRG) && fglrun $(PROG).42r

clean:
	gsmake -c $(PROG).4pw
