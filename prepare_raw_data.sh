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

    # Read txt files
    cd $input_PATH
    input_files=$( ls elev.dat*.txt )
    max_filename_length=0

    for file in ${input_files[@]}; do
	filename_length=${#file}
	if [ $filename_length -gt $max_filename_length ]; then
	    max_filename_length=$filename_length
	fi
    done
    
    #input_files=$( ls elev.dat*.txt )

    for file in ${input_files[@]}; do
	filename_length=${#file}
	if [ $filename_length -le $max_filename_length ]; then
	    filename_length_diff=$( echo "$max_filename_length - $filename_length" | bc )
	    echo "Filename $file is too short ($filename_length chars), adding zeros ..."
	    time_id=${file:9:-4}
	    new_filename=${file:0:8}
	    i=0
	    while [ "$i" -lt "$filename_length_diff" ]; do
		new_filename="${new_filename}0"
		((i++))
	    done
	    new_filename="${new_filename}${time_id}.txt"
	    echo "New filename: $new_filename"
	    mv $file $new_filename
	else
	    echo "Filename is long enough ..."
	    # cp $input_PATH/GTiff/$tiff $input_PATH/temp/$tiff
	fi   	
    done

    input_files=$( ls elev.dat*.txt )
    mkdir $output_PATH/Diff
    
    for file in ${input_files[@]}; do
        gdal_translate -of GTiff $input_PATH/$file $output_PATH/${file::-4}.tif
        # gdal_calc.py -A $output_PATH/${file::-4}.tif --outfile=$output_PATH/${file::-4}.tif --calc="A*(A>0)" --NoDataValue=-9999 --overwrite
	if [ ! -z $prev_file ]; then
	    echo "Calculating Diff for ${prev_file} ${file}"
 	    # set -x 
	    gdal_calc.py -A $output_PATH/${file::-4}.tif -B $output_PATH/${prev_file::-4}.tif --outfile=$output_PATH/Diff/${prev_file::-4}--${file::-4}.tif --calc="B-A" --NoDataValue=-9999 --overwrite
	    
	fi
	prev_file=$file
    done

    cd $output_PATH
    tiffs=$( ls *.tif )
    # echo "Tiffs: ${tiffs[@]}"

    


    # if [ -d "$input_PATH/temp" ]; then rm -r $input_PATH/temp; fi
    # mkdir $input_PATH/temp
    
    rm -f filelist.txt
    new_tiffs=$( ls *.tif )
    for tiff in ${new_tiffs[@]}; do
	echo "$tiff" >> filelist.txt
    done

    # gdalbuildvrt -vrtnodata "-9999" -input_file_list filelist.txt -overwrite ${output_PATH}/CAESAR.vrt

fi
