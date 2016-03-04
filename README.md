# Static API
Creates a static API from a CSV file (Work in progress).
Inspired by @waldoj's [instant-api](https://github.com/waldoj/instant-api).

Animals.csv
```csv
Name, Animal, Color
Fido, Dog, Brown
Whiskers, Cat, Black
Mini, Elephant, Grey
```
becomes
```
/animals.json
[
  {"Name": "Fido", "Animal": "Dog", ...},
  {"Name": "Whiskers", ...}
  ...
]

/animals/fido.json
{"Name": "Fido", "Animal": "Dog", ...}

/animals/whiskers.json
{"Name": "Whiskers", ...}
```

# Installation
1. Clone this repository
2. run `bundle install` to install dependencies

# Usage
```bash
PRIMARY_KEY=<key> ruby static-api.rb
```
