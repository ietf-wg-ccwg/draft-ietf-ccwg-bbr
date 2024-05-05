LIBDIR := lib
include $(LIBDIR)/main.mk

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update $(CLONE_ARGS) --init
else
	git clone -q --depth 10 $(CLONE_ARGS) \
	    -b main https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

quickhtml:
	xml2rfc -q --rfc-base-url https://www.rfc-editor.org/rfc/ --id-base-url https://datatracker.ietf.org/doc/html/ --cache=.xmlrfc2cache --html --css=lib/v3.css --metadata-js-url=/dev/null draft-cardwell-ccwg-bbr.xml -o draft-cardwell-ccwg-bbr.html

quicktxt:
	xml2rfc -q --rfc-base-url https://www.rfc-editor.org/rfc/ --id-base-url https://datatracker.ietf.org/doc/html/ --cache=.xmlrfc2cache --text --no-pagination draft-cardwell-ccwg-bbr.xml -o draft-cardwell-ccwg-bbr.txt
