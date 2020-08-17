# sfdc-merge-workflow

Salesforce \*.workflow merger

## Getting Started

Works in Unix like system.
Windows is not tested.

### Installing

```
npm install -g sfdc-merge-workflow
```

or

```
yarn globally add sfdc-merge-workflow
```

## Usage

### Command Line

```
$ smwf -h

  Usage: smwf [options]

  Merge \*.worflow

  Options:

    -h, --help                   output usage information
    -V, --version                output the version number
    -w, --workflows              path to the \*.workflow
    -o, --output                 path where to output the merged workflow file
```

### Module

```
  var smwf = require('sfdc-merge-workflow');

  smwf({
    'workflows':'./src/workflows/Account.workflow' // path to the \*.workflow file
  }, console.log);
```


## Built With

* [commander](https://github.com/tj/commander.js/) - The complete solution for node.js command-line interfaces, inspired by Ruby's commander.
* [extendify](https://github.com/bigShai/extendify) - Deep extend with customizable behavior.
* [xml2js](https://github.com/Leonidas-from-XIV/node-xml2js) - XML to JavaScript object converter.

## Versioning

[SemVer](http://semver.org/) is used for versioning.

## Authors

* **Baptiste BIEBER** - *Initial work* - [baptistebieber](https://github.com/baptistebieber)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details