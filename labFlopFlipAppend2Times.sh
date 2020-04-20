#!/bin/bash
CNT=0
rm res*.jpg
for i in $(ls ./)
do
  let CNT=$CNT+1
  echo $i $CNT
  convert "$i" -crop 640x360+0+0 res_"$CNT".jpg
  convert res_"$CNT".jpg -flop res_flop_"$CNT".jpg
  convert +append res_"$CNT".jpg res_flop_"$CNT".jpg res_append_flop_"$CNT".jpg
  convert res_append_flop_"$CNT".jpg -flip res_flip_"$CNT".jpg
  convert -append res_append_flop_"$CNT".jpg res_flip_"$CNT".jpg res_out_"$CNT".jpg
done
