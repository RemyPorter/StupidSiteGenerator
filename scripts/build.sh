#!/usr/bin/env bash
rm -rf temp 2> /dev/null
rm -rf output 2> /dev/null
mkdir temp 2> /dev/null
mkdir output 2> /dev/null
cp -R ./pages ./temp
cp -R ./pages/* ./output
find ./temp -iname '*.md' -exec sed -i.bak -Ee 's/\[(.+)\]\((.+).md\)/[\1](\2.html)/gi' '{}' \;
for f in $(find ./temp -iname '*.md');
do
	dest=$(sed -Ee s_temp/pages/__i <<< $f)
	echo $dest
	pandoc --template templates/default.html ${f} -o output/${dest%.*}.html
done;