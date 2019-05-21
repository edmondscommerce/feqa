# FrontEnd Quality Assurance
## By [Edmonds Commerce](https://www.edmondscommerce.co.uk)
## Inspired by [PHP QA](https://github.com/edmondscommerce/phpqa/)

## Introduction

FEQA is a quality assurance pipeline written in BASH that can be run both on the desktop as part of your development 
process and then also as part of a continuous integration (CI) pipeline.

It runs tools in a logical order and will fail as quickly as possible.

FEQA has only been tested on Linux.

## Installing

Install with either `npm` or `yarn`

```bash
# Yarn
yarn add  @edmondscommerce/feqa

# NPM
npm install --save-dev @edmondscommerce/feqa
```

If you want to keep with the bleeding edge - install directly from Github

```bash
npm install --save-dev github:edmondscommerce/feqa#master
```


## Running

To run the full pipline, simply execute in your BASH terminal: 
```bash
./node_modules/.bin/feqa

# Or
npx feqa 
```

### Usage:

```
$ ./node_modules/.bin/feqa -h

Usage:
npx feqa [-t tool to run ] [ -p path to scan ]

Defaults to using all tools and scanning whole project based on platform

 - use -h to see this help

 - use -p to specify a specific path to scan

 - use -t to specify a single tool:
     lint|eslint                   ES Linting and fixing
     jest|jest                     Jest testing framework
```

By default, FEQA will run against the entire project root.

### Single Tool:

If you want to run a single tool, use the `-t` option. See the usage above to get the shortcuts for the tools

```bash
npx feqa -t jest
```
