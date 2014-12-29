cd /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system
if { [xload new system.xmp] != 0 } {
  exit -1
}
xset arch zynq
xset dev xc7z020
xset package clg400
xset speedgrade -1
xset simulator isim
if { [xset hier sub] != 0 } {
  exit -1
}
set bMisMatch false
set xpsArch [xget arch]
if { ! [ string equal -nocase $xpsArch "zynq" ] } {
   set bMisMatch true
}
set xpsDev [xget dev]
if { ! [ string equal -nocase $xpsDev "xc7z020" ] } {
   set bMisMatch true
}
set xpsPkg [xget package]
if { ! [ string equal -nocase $xpsPkg "clg400" ] } {
   set bMisMatch true
}
set xpsSpd [xget speedgrade]
if { ! [ string equal -nocase $xpsSpd "-1" ] } {
   set bMisMatch true
}
if { $bMisMatch == true } {
   puts "Settings Mismatch:"
   puts "Current Project:"
   puts "	Family: zynq"
   puts "	Device: xc7z020"
   puts "	Package: clg400"
   puts "	Speed: -1"
   puts "XPS File: "
   puts "	Family: $xpsArch"
   puts "	Device: $xpsDev"
   puts "	Package: $xpsPkg"
   puts "	Speed: $xpsSpd"
   exit 11
}
#default language
xset hdl vhdl
xset intstyle ise
save proj
exit
