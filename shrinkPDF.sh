#/bin/bash
# Adonis Elfakih 2020
# required ghostscript
# sudo apt-get install ghostscript

#check for file to convert
if [[ -z "$1" && -z "$2" ]]
then
  echo "shrinkPDF: Shrink PDF so it can be emailed or shared"
  echo "Usage $0 <INPUT-FILE> <OUT-DIRECTORY>"
  echo "Example: $0 $HOME/adonis.psf ./Desktop"
else
  fullfile=$1
  fname=$(basename $fullfile)
  fbname=${fname%}
  saveTo=$2/shrunk-$fbname
  echo "Shrinking: '$1'"
  echo "Saving to: $saveTo"
  echo -n "Please wait!.."
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS=/screen \
  -dNOPAUSE -dQUIET -dBATCH \
  -sOutputFile=$saveTo  $1
  echo "Done!"
fi
