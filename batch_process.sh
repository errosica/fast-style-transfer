#!/usr/bin/env bash
#Evan Russenberger-Rosica

#run from fast-style-transfer repo directory
cd /home/ubuntu/fast-style-transfer

#path to folder of images to be processed. I call this folder Style_References. Dont end with /
#we process every image im all subfolders
REF=/home/ubuntu/data/FSTData/Style_References

shopt -s globstar
for FILE in "$REF"/**/*.jpg; do # Whitespace-safe and recursive
    NAME=$(basename "$FILE" .jpg)
    echo "Running on $NAME"
    echo "style is at $FILE"
    echo "writing results to ~/data/results/FSTcheckpoint/$NAME"
    mkdir -p ~/data/results/FSTcheckpoint/"$NAME"
    python ./style.py --style "$FILE" \
  --checkpoint-dir ~/data/results/FSTcheckpoint/"$NAME" \
  --test ~/data/FSTData/Testing_Examples/Cityscapes/_DSC3110.jpg \
  --test-dir ~/data/results/FSTcheckpoint/"$NAME" \
  --content-weight 1.5e1 \
  --checkpoint-iterations 1000 \
  --batch-size 20
done
