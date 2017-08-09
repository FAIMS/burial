#!/usr/bin/env bash

cd module

string="<input ref=\"Table\">"
replacement="<input ref=\"Table\" faims_table=\"true\">"
perl -0777 -i.original -pe "s/\\Q$string/$replacement/igs" ui_schema.xml

string="
        <select1 ref=\"Entity_Types\">
          <label>{Entity_Types}<\/label>
          <item>
            <label>Options not loaded<\/label>
            <value>Options not loaded<\/value>
          <\/item>
        <\/select1>"
replacement="
        <group ref=\"Colgroup_1\" faims_style=\"orientation\">
          <label\/>
          <group ref=\"Col_0\" faims_style=\"even\">
            <label\/>
            <select1 ref=\"Entity_Types\">
              <label>{Entity_Types}<\/label>
              <item>
                <label>Options not loaded<\/label>
                <value>Options not loaded<\/value>
              <\/item>
            <\/select1>
          <\/group>
          <group ref=\"Col_1\" faims_style=\"even\">
            <label\/>
            <select1 ref=\"Select_Author\">
              <label>{Select_Author}<\/label>
              <item>
                <label>Options not loaded<\/label>
                <value>Options not loaded<\/value>
              <\/item>
            <\/select1>
          <\/group>
        <\/group>"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="
              <Entity_Types\/>"
replacement="
              <Colgroup_1>
                <Col_0>
                  <Entity_Types\/>
                <\/Col_0>
                <Col_1>
                  <Select_Author\/>
                <\/Col_1>
              <\/Colgroup_1>"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="
        <trigger ref=\"Center_Me_1\">
          <label>{Center_Me}<\/label>
        <\/trigger>
        <trigger ref=\"Create_Shape\">
          <label>{Create_Shape}<\/label>
        <\/trigger>"
replacement="
        <group ref=\"Colgroup_1\" faims_style=\"orientation\">
          <label\/>
          <group ref=\"Col_1\" faims_style=\"even\">
            <label\/>
            <trigger ref=\"Center_Me_1\">
            <label>{Center_Me}<\/label>
            <\/trigger>
          <\/group>
          <group ref=\"Col_2\" faims_style=\"even\">
            <label\/>
            <trigger ref=\"Create_Shape\">
              <label>{Create_Shape}<\/label>
            <\/trigger>
          <\/group>
        <\/group>"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="
              <Center_Me_1\/>
              <Create_Shape\/>"
replacement="
              <Colgroup_1>
                <Col_1>
                  <Center_Me_1\/>
                <\/Col_1>
                <Col_2>
                  <Create_Shape\/>
                <\/Col_2>
              <\/Colgroup_1>"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="
              <Center_Me_1\/>
              <Create_Shape\/>"
replacement="
              <Colgroup_1>
                <Col_1>
                  <Center_Me_1\/>
                <\/Col_1>
                <Col_2>
                  <Create_Shape\/>
                <\/Col_2>
              <\/Colgroup_1>"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml


string="
        <trigger ref=\"Center_Me_1\">
          <label>{Center_Me}<\/label>
        <\/trigger>
        <trigger ref=\"Create_Shape\">
          <label>{Create_Shape}<\/label>
        <\/trigger>"
replacement="
        <group ref=\"Colgroup_1\" faims_style=\"orientation\">
          <label\/>
          <group ref=\"Col_1\" faims_style=\"even\">
            <label\/>
            <trigger ref=\"Center_Me_1\">
            <label>{Center_Me}<\/label>
            <\/trigger>
          <\/group>
          <group ref=\"Col_2\" faims_style=\"even\">
            <label\/>
            <trigger ref=\"Create_Shape\">
              <label>{Create_Shape}<\/label>
            <\/trigger>
          <\/group>
        <\/group>"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="            <input faims_attribute_name=\"Latitude\" faims_attribute_type=\"measure\" ref=\"Latitude\" faims_read_only=\"true\">"
replacement="            <input faims_attribute_name=\"Latitude\" faims_attribute_type=\"measure\" ref=\"Latitude\" faims_read_only=\"true\" faims_style_class=\"required\">"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="            <input faims_attribute_name=\"Longitude\" faims_attribute_type=\"measure\" ref=\"Longitude\" faims_read_only=\"true\">"
replacement="            <input faims_attribute_name=\"Longitude\" faims_attribute_type=\"measure\" ref=\"Longitude\" faims_read_only=\"true\" faims_style_class=\"required\">"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="<input faims_attribute_name=\"Mound ID\" faims_attribute_type=\"measure\" ref=\"Mound_ID\" faims_style_class=\"required\">"

replacement="<input faims_attribute_name=\"Mound ID\" faims_attribute_type=\"measure\" ref=\"Mound_ID\" faims_style_class=\"moundID\">"
perl -0777 -i.original -pe "s/$string/$replacement/igs" ui_schema.xml

string="
  <\/ArchaeologicalElement>
<\/ValidationSchema>"
replacement="
  <property name=\"Latitude\">
    <validator type=\"blankchecker\">
      <param type=\"field\" value=\"measure\"\/>
    <\/validator>
  <\/property>
  <property name=\"Longitude\">
    <validator type=\"blankchecker\">
      <param type=\"field\" value=\"measure\"\/>
    <\/validator>
  <\/property>
  <\/ArchaeologicalElement>
<\/ValidationSchema>"
perl -0777 -i.original -pe "s/$string/$replacement/igs" validation.xml



cat << EOF >> english.0.properties
Select_Author=Select Author
EOF

cat << EOF >> ui_styling.css
.moundID {
  color: #B2B2B2;
}
.moundID-label {
  color: red;
}
EOF

rm ui_schema.xml.original
rm validation.xml.original
