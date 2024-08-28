#!/bin/sh

#for f in $(<listNCT.txt)
for f in /data/trials/*.full.ndjson
do
#mongoimport --db aci --collection ClinicalTrials --type json --file /path/to/trialsfolder/$f --jsonArray
mongoimport --db aci --collection ClinicalTrials --type json --file $f --jsonArray
done

exit 0
