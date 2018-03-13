#!/bin/bash

if [ ! $# -eq 2 ]; then
    echo; echo "Usage: prepare_raw_data.sh [input_path] [output_path]"; echo
elif [ ! -d $1 ]; then
    echo; echo "$1 is not a directory."; echo
else
    input_PATH=$1
    output_PATH=$2

    if [ ! -d $output_PATH ]; then
	mkdir $output_PATH
    fi

    #
    # Put code for GDAL conversion of txt to geoTiff files here ...
    #

    cd $input_PATH/GTiff
    tiffs=$( ls *.tif )
    # echo "Tiffs: ${tiffs[@]}"

    max_filename_length=0
    
    for tiff in ${tiffs[@]}; do
	filename_length=${#tiff}
	if [ $filename_length -gt $max_filename_length ]; then
	    max_filename_length=$filename_length
	fi
    done

    # if [ -d "$input_PATH/temp" ]; then rm -r $input_PATH/temp; fi
    # mkdir $input_PATH/temp
    
    for tiff in ${tiffs[@]}; do
	filename_length=${#tiff}
	if [ $filename_length -le $max_filename_length ]; then
	    filename_length_diff=$( echo "$max_filename_length - $filename_length" | bc )
	    echo "Filename is too short ($filename_length chars), adding zeros ..."
	    time_id=${tiff:9:-4}
	    new_filename=${tiff:0:8}
	    i=0
	    while [ "$i" -lt "$filename_length_diff" ]; do
		new_filename="${new_filename}0"
		((i++))
	    done
	    new_filename="${new_filename}${time_id}.tif"
	    echo "New filename: $new_filename"
	    mv $tiff $new_filename
	else
	    echo "Filename is long enough ..."
	    # cp $input_PATH/GTiff/$tiff $input_PATH/temp/$tiff
	fi   	
    done
    rm -f filelist.txt
    new_tiffs=$( ls *.tif )
    for tiff in ${new_tiffs[@]}; do
	echo "$tiff" >> filelist.txt
    done

    gdalbuildvrt -vrtnodata "-9999" -input_file_list filelist.txt -overwrite ${output_PATH}/CAESAR.vrt

fi
