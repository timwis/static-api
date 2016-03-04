# Static API
Creates a static API from a CSV file and publishes it to a static web server.
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

# Example
The example file in this repository, [sample_data.csv](sample_data.csv), is automatically
published to the [gh-pages branch](https://github.com/timwis/static-api/tree/gh-pages)
by [Travis CI](https://travis-ci.org/timwis/static-api) and can thus be viewed at
[timwis.github.io/static-api/sample_data.json](http://timwis.github.io/static-api/sample_data.json)
(pardon the redirect to `timwis.com`, it's because of my [personal repo](https://github.com/timwis/timwis.github.io/blob/master/CNAME)).

# Manual Usage
1. Clone this repository
2. run `bundle install` to install dependencies
3. Execute via command line using an environment variable
```bash
PRIMARY_KEY=<key> ruby static-api.rb
```

# Automated Usage via Travis CI
1. Fork this repository
2. Enable Travis CI integration for your fork on the [travis dashboard](https://travis-ci.org/profile)
3. Generate a new GitHub [personal access token](https://github.com/settings/tokens/new) (with `public_repo` access)
4. On the Travis CI settings page for your fork (travis-ci.org/your-username/static-api/settings),
add your new personal access token as an environment variable with the name `GITHUB_TOKEN`.
Do **not** enable the "Display value in build log" toggle (it's disabled by default).
5. Add another environment variable called `PRIMARY_KEY` set to the field name to use as the CSV file's primary key.
6. Add your `.csv` file to your fork by [drag-and-dropping](https://github.com/blog/2105-upload-files-to-your-repositories),
using [prose.io](http://prose.io)'s [CSV editor](https://github.com/prose/prose/pull/911), or using
traiditional git and push your changes to the `master` branch (default).

Travis CI will be triggered by a push to the `master` branch, build your Static API, and push it
to the `gh-pages` branch, allowing you to view it at `username.github.io/repo-name/file_name.json`
