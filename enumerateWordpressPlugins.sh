#!/bin/bash

function ctrl_c(){
  echo -e "[!] Saliendo..."
  exit 1
}


#Ctrl + C
trap ctrl_c INT

declare -i parameter_counter=0

function readPlugins(){

  url=$1
  echo -e "\n[!] Estos son los plugins de $1:\n"
  echo -n "[+] "; curl -s -X GET "$url" | grep -oP '/plugins/\K[^.*/]+' | sort -u 
}

function helPanel(){
  echo -e "\n[i] Uso\n"
  echo -e "\nh) Mostrar este panel\n"
  echo -e "\nf) Proporcionar ruta del archivo a leer\n"
}

while getopts "hf:" arg; do
  case $arg in
    h) ;;
    f) url=$OPTARG; let parameter_counter+=1;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  readPlugins "$url"
else
  helPanel
fi


