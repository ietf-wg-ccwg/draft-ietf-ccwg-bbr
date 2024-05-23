#!/bin/bash
# A script to run locally to generate HTML and TXT from the draft XML.
# Useful for quick checks before checking in changes.

# generate .html:
xml2rfc -q --rfc-base-url https://www.rfc-editor.org/rfc/ --id-base-url https://datatracker.ietf.org/doc/html/ --cache=.xmlrfc2cache --html --css=lib/v3.css --metadata-js-url=/dev/null draft-cardwell-ccwg-bbr.xml -o draft-cardwell-ccwg-bbr.html

# generate .txt:
xml2rfc -q --rfc-base-url https://www.rfc-editor.org/rfc/ --id-base-url https://datatracker.ietf.org/doc/html/ --cache=.xmlrfc2cache --text --no-pagination draft-cardwell-ccwg-bbr.xml -o draft-cardwell-ccwg-bbr.txt
