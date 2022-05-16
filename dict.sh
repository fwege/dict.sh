# Copyright (C) 2022 Felix Wege
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

QUERY=""

if [ -z "$NUM_DICT_ENTRIES" ]
then
    NUM_DICT_ENTRIES=5
fi

for word in "$@"
do
    QUERY=$QUERY+$word
done

LANG1=$(curl -s https://www.dict.cc/\?s\=$QUERY | sed -n -e '/^var c1Arr/p')
LANG2=$(curl -s https://www.dict.cc/\?s\=$QUERY | sed -n -e '/^var c2Arr/p')


RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "${RED}   English   ${BLUE} - ${GREEN}   German  ${NC}"
echo "============================"

VAR=2
while :
do
    WORD1=$(echo $LANG1 | cut -d\, -f$VAR)
    WORD2=$(echo $LANG2 | cut -d\, -f$VAR)

    if [ $VAR -ge $(($NUM_DICT_ENTRIES+2)) ]
    then
        break
    fi
    VAR=$((VAR+1))

    if [ -z "$WORD1" ]
    then
        break
    else
        echo "${RED}$WORD1 ${BLUE}- ${GREEN}$WORD2 ${NC}"
    fi
done