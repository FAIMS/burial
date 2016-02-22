#!/usr/bin/env bash

cd module

string="<input ref=\"Table\">"
replacement="<input ref=\"Table\" faims_table=\"true\">"
perl -0777 -i.original -pe "s/\\Q$string/$replacement/igs" ui_schema.xml

string="
newBurialMound(){
  String tabgroup = \"Burial_Mound\";

  String autoNumSource = \"\";
  autoNumSource = getFieldValue(\"Control\/Main\/Next_Object_ID\");
  if (isNull(autoNumSource)) {
    showWarning(\"{Alert}\",\"{A_next_ID_has_not_been_entered_please_provide_one}\");
    return;
  }

  setUuid(tabgroup, null);
  newTabGroup(tabgroup);

  String autoNumDest = \"\";
  autoNumDest = \"Burial_Mound\/General\/Object_ID\";
  incAutoNum(autoNumDest);
}"
replacement="
newBurialMound(){
  String tabgroup = \"Burial_Mound\";

  String autoNumSource = \"\";
  autoNumSource = getFieldValue(\"Control\/Main\/Next_Object_ID\");
  if (isNull(autoNumSource)) {
    showWarning(\"{Alert}\",\"{A_next_ID_has_not_been_entered_please_provide_one}\");
    return;
  }

  setUuid(tabgroup, null);
  newTabGroup(tabgroup);
  setDayMonth();

  String autoNumDest = \"\";
  autoNumDest = \"Burial_Mound\/General\/Object_ID\";
  incAutoNum(autoNumDest);
}"
perl -0777 -i.original -pe "s/\\Q$string/$replacement/igs" ui_logic.bsh

rm ui_schema.xml.original
rm ui_logic.bsh.original
