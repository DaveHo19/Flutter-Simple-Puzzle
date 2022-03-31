# Simple Puzzle
## Description 
* A simple puzzle solving game implemented using Flutter!
* Contains a simple UI for player to play it.
* Contains differences level for player to select.

## Table of Contents
* [Preview](#Preview)
* [Installation](#Installation)
* [About The Application](#About-The-Application)
* [Development Procedure](#Development-Procedure)

## Preview

## Installation
* You can download the file using ```git clone``` with HTTPS or 
```https://github.com/DaveHo19/flutter_simple_puzzle.git```
* The required ibrary will be :
  * dart:math

## About The Application
The puzzle application is developed using flutter/dart programming language in Visual Studio Code. The main component applied is ```Coordinate``` for each block, and use ```Coordinate``` for comparing the game process.

## Development Procedure
The procedure of develop the 'Puzzle' application is based on the step below:
* Create Coordinate class.
* Create Block Class to contains 2 differences coordinate, and the name value.
* Generate list of block based on ```maxItems```, and each of the block will container 2 coordinate, and 1 name value.
* Arrange and display the block list using ```GridView.count```.
* Add events when player click on block component.
* Check 4 directions of block component to identity moveable or not. 
* If moveable,
  * Swap the position between tapped block and space block.
  * Check results if all block are arranges in expected position.
  * If all block are arranged in expected position, prompt a message dialog. 
* If not moveable, 
  * Ignore the events.
* Each tap on the block will increment a counter, which applied to identity how many move have done by player.

