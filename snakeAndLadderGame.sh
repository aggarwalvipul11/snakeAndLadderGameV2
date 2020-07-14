#!/bin/bash

echo "================ Welcome to SNAKES AND LADDERS ================"

#Apply values to variables
singlePlayer=1;
positionOfPlayer=0;

function playerThrowsDice() {
	randomDiceRolls=$((RANDOM%6+1))
	echo $randomDiceRolls
}

playerThrowDice
#End of Use Case 02
