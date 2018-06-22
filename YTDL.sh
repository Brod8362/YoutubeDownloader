#!/bin/bash
echo Input a youtube link:
read url

cd YTOutput
echo "Do you want (A)udio, (V)ideo, or a whole (P)laylist?"
read choice
if [ $choice == "a" ]
then
        echo Audio only download
        youtube-dl $url -x --audio-format ogg
elif [ $choice == "v" ]
then
        echo Video and audio download
        youtube-dl $url --audio-format best --audio-quality 96K --write-sub --no-playlist
elif [ $choice == "p" ]
then
        echo "(A)udio or (V)ideo?"
        read choice2
                if [ $choice2 = "a" ]
                then
                        youtube-dl $url --audio-format mp3 --audio-quality 96K --yes-playlist -x
                elif [ $choice2 = "v" ]
                then
                        youtube-dl $url --audio-format best --audio-quality 96K --yes-playlist --write-sub
                else
                        echo Pick a valid choice.
                fi
else
        echo Please pick a valid choice.
fi

