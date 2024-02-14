#!/bin/bash
uiautomator dump
sed -i 's/><node/\n/g' /sdcard/window_dump.xml
cat /sdcard/window_dump.xml | grep -E 'index="[0-9]+"' >/sdcard/goodelements.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "NAF=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/NAF.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "index=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/index.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "text=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/text.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "resource-id=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/resource-id.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "class=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/class.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "package=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/package.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "content-desc=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/content-desc.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "checkable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/checkable.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "checked=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/checked.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "clickable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/clickable.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "enabled=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/enabled.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "focusable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/focusable.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "focused=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/focused.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "scrollable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/scrollable.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "long-clickable=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/long-clickable.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "password=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/password.txt
cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "selected=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' > /sdcard/selected.txt
lxa2y=$(cat /sdcard/goodelements.txt | awk 'BEGIN { FS = "bounds=\"" }; { print $2 }' | awk 'BEGIN { FS = "\" [a-z-]+=" }; { print $1 }' | sed -n -E 's/[^0-9]*\[([0-9]+),([0-9]+)\]\[([0-9]+),([0-9]+)\][^0-9]*/\1 \2 \3 \4/p' || echo "0 0 0 0")
echo "$lxa2y" > /sdcard/bounds.txt
awk '{sum = $3 - $1; print sum}' /sdcard/bounds.txt >/sdcard/widthx.txt
awk '{sum = $4 - $2; print sum}' /sdcard/bounds.txt >/sdcard/heighty.txt
awk '{sum = ($3 - $1) * ($4 - $2); print sum}' /sdcard/bounds.txt >/sdcard/area.txt
awk '{sum = ($3 - $1)/2 + $1; print sum}' /sdcard/bounds.txt >/sdcard/centerx.txt
awk '{sum = ($4 - $2)/2 + $2; print sum}' /sdcard/bounds.txt >/sdcard/centery.txt
awk '{print $1}' /sdcard/bounds.txt >/sdcard/startx.txt
awk '{print $3}' /sdcard/bounds.txt >/sdcard/endx.txt
awk '{print $2}' /sdcard/bounds.txt >/sdcard/starty.txt
awk '{print $4}' /sdcard/bounds.txt >/sdcard/endy.txt
printf "%s\t" "index" "text" "resource-id" "class" "package" "content-desc" "checkable" "checked" "clickable" "enabled" "focusable" "focused" "scrollable" "long-clickable" "password" "selected" "startx" "endx" "starty" "endy" "centerx" "centery" "area" "widthx" "heighty" | echo "$(cat)" > /sdcard/u.txt
paste "/sdcard/index.txt" "/sdcard/text.txt" "/sdcard/resource-id.txt" "/sdcard/class.txt" "/sdcard/package.txt" "/sdcard/content-desc.txt" "/sdcard/checkable.txt" "/sdcard/checked.txt" "/sdcard/clickable.txt" "/sdcard/enabled.txt" "/sdcard/focusable.txt" "/sdcard/focused.txt" "/sdcard/scrollable.txt" "/sdcard/long-clickable.txt" "/sdcard/password.txt" "/sdcard/selected.txt" "/sdcard/startx.txt" "/sdcard/endx.txt" "/sdcard/starty.txt" "/sdcard/endy.txt" "/sdcard/centerx.txt" "/sdcard/centery.txt" "/sdcard/area.txt" "/sdcard/widthx.txt" "/sdcard/heighty.txt" >> "/sdcard/u.txt"
rm -f /sdcard/index.txt
rm -f /sdcard/text.txt
rm -f /sdcard/resource-id.txt
rm -f /sdcard/class.txt
rm -f /sdcard/package.txt
rm -f /sdcard/content-desc.txt
rm -f /sdcard/checkable.txt
rm -f /sdcard/checked.txt
rm -f /sdcard/clickable.txt
rm -f /sdcard/enabled.txt
rm -f /sdcard/focusable.txt
rm -f /sdcard/focused.txt
rm -f /sdcard/scrollable.txt
rm -f /sdcard/long-clickable.txt
rm -f /sdcard/password.txt
rm -f /sdcard/selected.txt
rm -f /sdcard/startx.txt
rm -f /sdcard/endx.txt
rm -f /sdcard/starty.txt
rm -f /sdcard/endy.txt
rm -f /sdcard/centerx.txt
rm -f /sdcard/centery.txt
rm -f /sdcard/area.txt
rm -f /sdcard/widthx.txt
rm -f /sdcard/heighty.txt
rm -f /sdcard/NAF.txt
rm -f /sdcard/goodelements.txt
rm -f /sdcard/bounds.txt
rm -f /sdcard/window_dump.xml