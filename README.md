# dict.sh
Pure shell script that curls results for your search query from [https://www.dict.cc/](https://www.dict.cc/).

__Currently only English <--> German translations are supported!__


## Installation

```
git clone https://github.com/fwege/dict.sh path/to/dir
cd path/to/dir
chmod +x dict.sh

# (Optional) Make script globally available

ln -s $(pwd)/dict.sh /usr/bin/dict.sh
```

## Usage

Simply use `dict.sh <search_query>`, with either German or English words or short sentences.

__Examples:__

```
> dict.sh translation

   English    -    German
============================
"translation" - "Übersetzung"
"translation" - "Umsetzung"
"translation" - "Translation"
"translation" - "Umwandlung"
"translation" - "Parallelverschiebung"

```

```
> dict.sh Kaffee trinken

   English    -    German
============================
"to take coffee" - "Kaffee trinken"
"to have a cup of coffee" - "einen Kaffee trinken"
"to have a cup of coffee" - "eine Tasse Kaffee trinken"
"coffee" - "Kaffee"
"java" - "Kaffee"
```

__Per default only the first five results are printed!__ But you can specifiy the number of shown entries by defining the environment variable `NUM_DICT_ENTRIES`, e.g. `echo "export NUM_DICT_ENTRIES=10" >> ~/.bashrc`