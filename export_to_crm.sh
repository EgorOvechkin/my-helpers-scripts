#!/bin/bash
svg_name=$1
mixin_name=$2
path_to_svg="$HOME/svg/$svg_name"
path_to_project="$HOME/projects/crm_tulip"
path_to_icons="$path_to_project/app/assets/stylesheets/scss/icons.scss.erb"

svgo $path_to_svg
svg_string=`cat $path_to_svg`

echo $'\n'"@mixin $mixin_name() {" >> $path_to_icons
echo $'  $svg-string:' "'""$svg_string""';" >> $path_to_icons
echo '  background: url("data:image/svg+xml;utf-8,#{$svg-string}") 0 no-repeat / contain;' >> $path_to_icons
echo '}' >> $path_to_icons
exit 0