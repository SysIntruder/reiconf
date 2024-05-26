#!/bin/sh

awk -F/ '{t=substr($(NF-2),1,1); s=substr($(NF-1),1,1); if(t==".") t=substr($(NF-2),1,2); if(s==".") s=substr($(NF-1),1,2); print t"/"s"/"$(NF)}' < /dev/stdin
