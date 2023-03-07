#!/bin/bash

# Manual Fan control to PH315-54 - RTX 3070
# After boot values (silent cooler, Not stopped but silent)
# 0x21: 0x10, 0x22:0x54, 0x37: 0x32, 0x3a: 0x32, 0x14: 05, 0x15: FA

ecw() {
  sudo ec_probe write $1 $2
}

ecr() {
  #ec1=`sudo ec_probe read 0x21` # | cut -d '(' -f2 | grep -Po '[0-9]+'`
  ec=`sudo ec_probe read $1 | cut -d '(' -f2 | grep -Po '[A-F0-9]+'`  
  echo "${ec}"
}

cdh() {
  printf -v r1 "0x%02X" "$1"
  echo $r1
}

ecm() {
  echo "ecm $1 $2"
  $(ecw "0x21" $1)
  $(ecw "0x22" $2)  
}

c=$1
[ -z "$c" ] && c=a
case $c in 
  a) # Auto Mode
    ecm "0x10" "0x54"
    ;;
  t) # Turbo Mode or Max
    ecm "0x20" "0xA8"
    ;;
  m) # Manual Mode
    ecm "0x30" "0x0c"
    ecw "0x37" $(cdh $2) #CPU Fan Speed
    ecw "0x3a" $(cdh $2) #GPU Fan Speed
    ;;
  *)
    ;;
esac

echo "Command: $c"

r1=$(ecr "0x21")
r2=$(ecr "0x22")
echo "Read Mode: 0x21: $r1, 0x22: $r2"

a1="0x37"
a2="0x3a"
r1=$(ecr $a1)
r2=$(ecr $a2)
echo "Read FanSpeed Set: $a1: $r1, $a2: $r2"

a1="0x14"
a2="0x15"
r1=$(ecr $a1)
r2=$(ecr $a2)
echo "Read FanSpeed Read: $a1: $r1, $a2: $r2"