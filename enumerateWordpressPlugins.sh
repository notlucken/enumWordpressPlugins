#!/bin/bash

function ctrl_c(){
  echo -e "[!] Exiting..."
  exit 1
}


#Ctrl + C
trap ctrl_c INT

declare -i c=0

function readPlugins(){

  url=$1
  echo -e "\n[!] These are the plugins of $1:\n"
  echo -n "[+] "; curl -s -X GET "$url" | grep -oP '/plugins/\K[^.*/]+' | sort -u 
}

function helPanel(){
  echo -e "\n[i] Use\n"
  echo -e "\nh) Show this panel\n"
  echo -e "\nf) URL\n"
}

while getopts "hf:" arg; do
  case $arg in
    h) ;;
    f) url=$OPTARG; let c+=1;;
  esac
done

if [ $c -eq 1 ]; then
  readPlugins "$url"
else
  helPanel
fi


