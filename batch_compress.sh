#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "You did not supply the required number of arguments. Please input the path to your project. e.g. ./batch_compress.sh .../osu\!/Songs/ExampleProject"
	exit 1
fi

mkdir -p "osu-compressed"
for f in $1/*.osu; do
	file=$(echo "$f" | rev | cut -d "/" -f 1 | rev)
	./osu-compress "$f" "./osu-compressed/$file"
done
