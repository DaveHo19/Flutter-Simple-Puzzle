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
![main](https://user-images.githubusercontent.com/100736557/161002183-2ace141c-5e65-4e6b-8fee-3ff1d154052d.PNG)
* The first scene open the application.
* Player able to enter the game by click on the button.

![main-button-dialog](https://user-images.githubusercontent.com/100736557/161002407-6cbf79e7-8a65-4765-95be-056615f951a9.PNG)
* The difficulty dialog layout.
* It appear when player click on the button in the main scene.
* Player able to select one of the difficulty and begin the game.

![sample-game-play-1](https://user-images.githubusercontent.com/100736557/161002500-bef2e307-3a20-43a8-8462-bd26133ebb27.PNG)
* Sample view of the game difficulty Easy.
* Player able to click on the puzzle block in the scene.
* The puzzle block will move if there is any empty space around it.
* When the puzzle are located in its expected locations, it will display green border.

![sample-game-play-2](https://user-images.githubusercontent.com/100736557/161002707-9f567f2d-c7a9-4d13-8d1d-35d391ba6d55.PNG)
* When player successfully locate all puzzle, it will display a success dialog and a back button.

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

