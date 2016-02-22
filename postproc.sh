#!/usr/bin/env bash

cd module

string="<input ref=\"Table\">"
replacement="<input ref=\"Table\" faims_table=\"true\">"
perl -0777 -i.original -pe "s/\\Q$string/$replacement/igs" ui_schema.xml

rm ui_schema.xml.original
