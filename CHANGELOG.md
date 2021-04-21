# Changelog

## 1.0.6

* Migrate to null safety version

## 1.0.5+1

* Update example

## 1.0.5

* Bug fixing on widget type cast. Thanks to Hoffmann Daniel (https://github.com/hdani9307)

## 1.0.4

* Bug fixing on AppLifecycleState case clause

## 1.0.3+2

* Update test

## 1.0.3+1

* Update README.md

## 1.0.3

* Add `onPause()` and `onReady()` methods
* `NeedResume` class is now deprecated, replaced with `ResumableState<T>` abstract class, see example for detail

## 1.0.2

* Simplify onResume implementation
* Now, all you have to do is just replace `Navigator.push()` or `Navigator.pushNamed()` with `push()` or `pushNamed()`
* Add `resume.data` and `resume.source` to store data from a screen you have pushed

## 1.0.1+1

* Update README.md

## 1.0.1

* Add github link

## 1.0.0

* Initial release
* Basic functionality
