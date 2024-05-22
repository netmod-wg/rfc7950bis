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
echo "    table.bg { border-collapse: collapse; width: 100%; }" >> index.html
echo "    tr.bg:nth-child(odd) {background-color: #f2f2f2}" >> index.html
echo "    tr.bg:nth-child(even) {background-color: white}" >> index.html
echo "    th.bg    {background-color: #A0A0A0; color: white;}" >> index.html
echo "    th.bg,td.bg {padding: 15px; text-align: left; vertical-align: top;}" >> index.html
echo "    td.fg {text-align: right; vertical-align: bottom; white-space: nowrap;}" >> index.html
echo "  </style>" >> index.html
echo "  <base target=\"_blank\">" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "<h1>Build artifacts for rfc7950bis and friends</h1>" >> index.html
echo "<i>Most recent first</i>" >> index.html
echo "<br><br>" >> index.html
echo "<table class=\"bg\">" >> index.html
echo "  <tr class=\"bg\">" >> index.html
echo "    <th class=\"bg\"><b>Updated</b></th>" >> index.html
echo "    <th class=\"bg\"><b>Pull Request</b></th>" >> index.html
echo "    <th class=\"bg\"><b>Branch Name</b></th>" >> index.html
echo "    <th class=\"bg\"><b>Formats</b></th>" >> index.html
echo "    <th class=\"bg\"><b>Actions</b></th>" >> index.html
echo "  </tr>" >> index.html
for d in $SORTED; do
  echo "  <tr class=\"bg\">" >> index.html
  NUMBER=`grep NUMBER $d/metadata.txt | awk '{print $2}'`
  TITLE=`grep TITLE $d/metadata.txt | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'`
  DATE=`grep DATE $d/metadata.txt | awk '{print $2}'`
  echo "    <td class=\"bg\">$DATE</td>" >> index.html
  echo "    <td class=\"bg\"><a href=\"https://github.com/netmod-wg/rfc7950bis-and-friends/pull/$NUMBER\">$TITLE (#$NUMBER)</a></td>" >> index.html
  echo "    <td class=\"bg\"><a href=\"https://github.com/netmod-wg/rfc7950bis-and-friends/tree/$d\">$d</a></td>" >> index.html

  echo "    <td nowrap class=\"bg\"> <table> <tr> <td class=\"fg\">rfc7950bis:</td> <td nowrap><a href=\"$d/draft-yn-netmod-rfc7950bis-00.html\">html</a> / <a href=\"$d/draft-yn-netmod-rfc7950bis-00.txt\">text</a> / <a href=\"$d/draft-yn-netmod-rfc7950bis-00.xml\">xml</a></td> </tr> <tr> <td class=\"fg\">yang-xml:</td> <td nowrap><a href=\"$d/draft-yn-netmod-yang-xml-00.html\">html</a> / <a href=\"$d/draft-yn-netmod-yang-xml-00.txt\">text</a> / <a href=\"$d/draft-yn-netmod-yang-xml-00.xml\">xml</a></td> </tr> <tr> <td class=\"fg\">yang-proto:</td> <td nowrap><a href=\"$d/draft-yn-netmod-yang-proto-00.html\">html</a> / <a href=\"$d/draft-yn-netmod-yang-proto-00.txt\">text</a> / <a href=\"$d/draft-yn-netmod-yang-proto-00.proto\">xml</a></td> </tr> </table> </td>" >> index.html

  if [ $d = "main" ]; then
    echo "    <td nowrap class=\"bg\"><table> <tr> <td class=\"fg\">rfc7950bis:</td> <td nowrap><a href=\"https://author-tools.ietf.org/diff?doc_1=rfc7950&url_2=https://netmod-wg.github.io/rfc7950bis-and-friends/main/draft-yn-netmod-rfc7950bis-00.txt\">Diff with RFC7950</a><br><a href=\"https://author-tools.ietf.org/api/iddiff?doc_1=draft-yn-netmod-rfc7950bis&url_2=https://netmod-wg.github.io/rfc7950bis-and-friends/main/draft-yn-netmod-rfc7950bis-00.txt\"><s>Diff with Datatracker</s></a></td>  </tr> <tr><td class=\"fg\">yang-xml:</td><td nowrap><a href=\"https://author-tools.ietf.org/api/iddiff?doc_1=draft-yn-netmod-yang-xml&url_2=https://netmod-wg.github.io/yang-xml/main/draft-yn-netmod-yang-xml-00.txt\"><s>Diff with Datatracker</s></a></td></tr> <tr><td class=\"fg\">yang-proto:</td><td nowrap><a href=\"https://author-tools.ietf.org/api/iddiff?doc_1=draft-yn-netmod-yang-xml&url_2=https://netmod-wg.github.io/yang-xml/main/draft-yn-netmod-yang-proto-00.txt\"><s>Diff with Datatracker</s></a></td></tr></table> </td>" >> index.html
  else
    echo "    <td nowrap class=\"bg\"> <table> <tr> <td class=\"fg\">rfc7950bis:</td> <td nowrap><a href=\"https://author-tools.ietf.org/api/iddiff?url_1=https://netmod-wg.github.io/rfc7950bis-and-friends/main/draft-yn-netmod-rfc7950bis-00.txt&url_2=https://netmod-wg.github.io/rfc7950bis-and-friends/$d/draft-yn-netmod-rfc7950bis-00.txt\">Diff with Main</a></td> </tr> <tr> <td class=\"fg\">yang-xml:</td> <td nowrap><a href=\"https://author-tools.ietf.org/api/iddiff?url_1=https://netmod-wg.github.io/rfc7950bis-and-friends/main/draft-yn-netmod-yang-xml-00.txt&url_2=https://netmod-wg.github.io/rfc7950bis-and-friends/$d/draft-yn-netmod-yang-xml-00.txt\">Diff with Main</a></td> </tr> <tr> <td class=\"fg\">yang-proto:</td> <td nowrap><a href=\"https://author-tools.ietf.org/api/iddiff?url_1=https://netmod-wg.github.io/rfc7950bis-and-friends/main/draft-yn-netmod-yang-proto-00.txt&url_2=https://netmod-wg.github.io/rfc7950bis-and-friends/$d/draft-yn-netmod-yang-proto-00.txt\">Diff with Main</a></td> </tr> </table> </td>" >> index.html
  fi
  echo "  </tr>" >> index.html
done
echo "</table>" >> index.html
echo "</body>" >> index.html
