#!/bin/bash -x

site=$1

wget --no-check-certificate http://$site/favicon.ico 
base=`echo $site |sed -e "s/www.//; s/.edu//; s/.com//; s/.org//;"`
mv favicon.ico $base.ico
