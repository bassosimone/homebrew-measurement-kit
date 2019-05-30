# MeasurementKit Homebrew Tap

Formulae that you can install using this tap:

- `generic-assets`: generic assets used by MK;

- `ios-<package>`: cross built packages for iOS systems;

- `libndt`: header-only C++11 library for running ndt5/ndt7 tests;

- `measurement-kit`: Measurement Kit binary, libraries and headers;

- `mingw-w64-<package>`: cross build of package using brew's
default `mingw-w64` package suitable for being included in the
binary distrbution of OONI for Windows systems.

## Build and install instructions

- add the tap

```
brew tap measurement-kit/measurement-kit
```

- install the latest stable

```
brew install <formula>
```

- remove the installed version

```
brew rm <formula>
```

- compile and install the `master` branch (may not work for all formulae)

```
brew install --verbose --HEAD <formula>
```

- build a bottle

```
brew install --build-bottle <formula>
brew bottle --force-core-tap <formula>
```

Bottles are published in [dl.bintray.com/measurement-kit/homebrew](
https://dl.bintray.com/measurement-kit/homebrew/). For some reasons, the
bottles produced with the above procedure contains two dashes between
the name and the version; this should be changed to a single dash in order
for the bottle to be correctly installed.
