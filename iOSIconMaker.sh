#!bin/bash
# author: Haocold
# date: 2018-11-05 14:40:29

echo "\n"
echo "============================"
echo "=                          ="
echo "=     iOS Icon Maker       ="
echo "=      Made by Haocold     ="
echo "=    2018-11-05 14:40:29   ="
echo "=                          ="
echo "============================"

echo "\n"
echo "Drag Icon png file into termimal...\n..."
echo "And then press Enter..."
echo ".\n..\n..."
echo "File path is:"
read input
echo ".\n..\n..."

# Create iPhone folder.
# %/* : is delete the last path component of 'input'
echo "mkdir 'iPhone' folder..."
cd ${input%/*}
mkdir iPhone
echo ".\n..\n..."

# Copy file to iPhone
echo "copy file..."
icon_file=${input##*/} # icon.png
cp -rf ${icon_file} iPhone
cd iPhone

# 1024 for App Store
cp ${icon_file} "1024x1024.png"
sips -z 1024 1024 "1024x1024.png"

# Icons for iPhone iPad
cp ${icon_file} "83.5x83.5@2x.png"
sips -z 167 167 "83.5x83.5@2x.png"

for name in 20 29 40 57 60 76
do
	for scale in 2 3
	do
		new_name=${name}"x"${name}"@"${scale}"x.png"
		echo $new_name
		cp ${icon_file} $new_name
		width=$[name * scale]
		echo width is $width
		sips -z $width $width $new_name
	done
done

rm ${icon_file}

