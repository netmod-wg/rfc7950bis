#!/bin/bash
#
# enter directory
cd mysite/

# sort by last-update
for d in */; do
  DATE=`grep 'DATE:' $d/metadata.txt | sed 's/^DATE: //'`
  dd=`echo $d | sed 's#/$##'`
  echo "$dd $DATE" >> sort.txt
done
SORTED=`sort -r -k 1 sort.txt | awk '{print $1}'`

# create the index.html file
echo "<html>" > index.html
echo "<head>" >> index.html
echo "  <style>" >> index.html
echo "    table { border-collapse: collapse; width: 100%; }" >> index.html
echo "    tr:nth-child(odd){background-color: #f2f2f2}" >> index.html
echo "    tr:nth-child(even){background-color: white}" >> index.html
echo "    th    {background-color: #A0A0A0; color: white;}" >> index.html
echo "    th,td {padding: 15px; text-align: left; vertical-align: top;}" >> index.html
echo "  </style>" >> index.html
echo "  <base target=\"_blank\">" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "<h1>Build Artifacts for rfc7950bis</h1>" >> index.html
echo "<i>Most recent first</i>" >> index.html
echo "<br><br>" >> index.html
echo "<table>" >> index.html
echo "  <tr>" >> index.html
echo "    <th><b>Updated</b></th>" >> index.html
echo "    <th><b>Pull Request</b></th>" >> index.html
echo "    <th><b>Branch Name</b></th>" >> index.html
echo "    <th><b>Formats</b></th>" >> index.html
echo "    <th><b>Actions</b></th>" >> index.html
echo "  </tr>" >> index.html
for d in $SORTED; do
  echo "  <tr>" >> index.html
  NUMBER=`grep NUMBER $d/metadata.txt | awk '{print $2}'`
  TITLE=`grep TITLE $d/metadata.txt | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'`
  DATE=`grep DATE $d/metadata.txt | awk '{print $2}'`
  echo "    <td>$DATE</td>" >> index.html
  echo "    <td><a href=\"https://github.com/netmod-wg/rfc7950bis/pull/$NUMBER\">$TITLE (#$NUMBER)</a></td>" >> index.html
  echo "    <td><a href=\"https://github.com/netmod-wg/rfc7950bis/tree/$d\">$d</a></td>" >> index.html

  echo "    <td>rfc7950bis: <a href=\"$d/draft-yn-netmod-rfc7950bis-00.html\">html</a> / <a href=\"$d/draft-yn-netmod-rfc7950bis-00.txt\">text</a> / <a href=\"$d/draft-yn-netmod-rfc7950bis-00.xml\">xml</a><br>yang-xml: <a href=\"$d/draft-yn-netmod-yang-xml-00.html\">html</a> / <a href=\"$d/draft-yn-netmod-yang-xml-00.txt\">text</a> / <a href=\"$d/draft-yn-netmod-yang-xml-00.xml\">xml</a><br>yang-proto: <a href=\"$d/draft-yn-netmod-yang-proto-00.html\">html</a> / <a href=\"$d/draft-yn-netmod-yang-proto-00.txt\">text</a> / <a href=\"$d/draft-yn-netmod-yang-proto-00.xml\">xml</a></td>" >> index.html

  if [ $d = "main" ]; then
    echo "    <td>rfc7950bis: <a href=\"https://author-tools.ietf.org/diff?doc_1=rfc7950&url_2=https://netmod-wg.github.io/rfc7950bis/main/draft-yn-netmod-rfc7950bis-00.txt\">Diff with RFC7950</a><br><a href=\"https://author-tools.ietf.org/api/iddiff?doc_1=draft-yn-netmod-rfc7950bis&url_2=https://netmod-wg.github.io/rfc7950bis/main/draft-yn-netmod-rfc7950bis-00.txt\">Diff with Datatracker</a><br>Upload to Datatracker (TBD)<br>yang-xml: ???<br>yang-proto: ???<br></td>" >> index.html
  else
    echo "    <td>
    rfc7950bis: <a href=\"https://author-tools.ietf.org/api/iddiff?url_1=https://netmod-wg.github.io/rfc7950bis/main/draft-yn-netmod-rfc7950bis-00.txt&url_2=https://netmod-wg.github.io/rfc7950bis/$d/draft-yn-netmod-rfc7950bis-00.txt\">Diff with Main</a><br>yang-xml: ???<br>yang-proto: ???<br></td>" >> index.html
  fi
  echo "  </tr>" >> index.html
done
echo "</table>" >> index.html
echo "</body>" >> index.html
