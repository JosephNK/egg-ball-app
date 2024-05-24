# EggBall-app

## Required

- Install melos 
  - https://github.com/invertase/melos

```bash
$ dart pub global activate melos 6.0.0
```

## Getting started

```bash
$ git clone https://github.com/.../egg-ball-app.git
$ cd egg-ball-app
$ git checkout develop
$ melos bootstrap
```

## Usage

- Directory 
```bash
$ cd egg-ball-app/app
```
- Run Production
```bash
$ flutter run --flavor production 
```
- Run Staging
```bash
$ flutter run --flavor staging 
```
- Run Development
```bash
$ flutter run --flavor development 
```
- Run Mock Test
```bash
$ flutter run --flavor mocktest 
```

## Directory Structure

```
.
├── app
├── packages
│   ├── commons
│   ├── components
│   ├── models
│   ├── repositories
│   ├── resource
│   └── services
└── scripts
```