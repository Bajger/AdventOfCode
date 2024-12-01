# AdventOfCode
My own implemented solutions using [Pharo](https://pharo.org) Smalltalk for [Advent of Code](https://adventofcode.com) coding challenge.

## How to load
You can load this project into [Pharo 12.0](https://pharo.org/download) (older versions might work as well) image using: 
```
Metacello new
	repository: 'github://Bajger/AdventOfCode/src';
	baseline: 'AdventOfCode';
	load
```

## Currently implemented
AoC2019 - day 1 to 7 (part 1)  
AoC2021 - day 1 to 3  
AoC2022 - day 9  
AoC2024 - day 1 part 1


## How to execute
Each year is represented by `AoC<year nr.>` class, like this: `AoC2019`.  
To get result for given day and part of Advent of Code, just simply execute (inspect/print it) in Pharo Playground:  
```
AoC2019 day: 1 part: 1
```
and you get result (based on input associated with my AoC account).  
Not yet implemented/completed solutions will throw error, e.g.: `"AoC 2019 - solution not found for day: 20 part: 2." `

## Completed Exercises
Just look at class determining given year, complete solutions can be found by evaluating e.g.: `AoC2019 aocSolutionClasses`  
Each class represents one concrete solution for given day and part (order in array gives concecutive days).

Solutions are tested by adequate test classes, for example: `PasswordCombinationsTest` represents unit tests for `PasswordCombinations` solution.
