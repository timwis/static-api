# Static API
Creates a static API from a CSV file (Work in progress)

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
PRIMARY_KEY=<key> ruby build.rb
```
