#!/bin/bash
url="http://delphi.unx.sas.com/conaryrc"
# Must be outside of config.d because otherwise conary might try to read the
# temp file
tmpfile=/etc/conaryrc.tmp
dest=/etc/conary/config.d/repomaps
echo "# Periodically fetched from $url, do not edit" >$tmpfile
if curl -kfs "$url" >>$tmpfile
then
    mv $tmpfile $dest
    exit 0
else
    rm -f $tmpfile
    echo Failed to update conaryrc from delphi
    exit 1
fi
