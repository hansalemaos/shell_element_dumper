adb push "C:\Users\hansc\Documents\XuanZhi9\Pictures\u.sh" /sdcard/
adb push "C:\Users\hansc\Documents\XuanZhi9\Pictures\s.sh" /sdcard/
adb push "C:\Users\hansc\Documents\XuanZhi9\Pictures\a.sh" /sdcard/

sh /sdcard/u.sh
awk -f /sdcard/awk_pretty_print.awk /sdcard/u.txt

sh /sdcard/s.sh
awk -f /sdcard/awk_pretty_print.awk /sdcard/s.txt

sh /sdcard/a.sh
awk -f /sdcard/awk_pretty_print.awk /sdcard/a.txt

