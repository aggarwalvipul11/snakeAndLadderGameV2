#!/bin/bash

echo "================ Welcome to SNAKES AND LADDERS ================"

#Apply values to variables
singlePlayer=1;
positionOfPlayer=0;
goalOfTheGame=100;

playerLivePosition=0;
zeroN=0;

playerGetsNoPlay=0;
playerGetsLadder=1;
playerGetsSnake=2;

function playerThrowsDice() {
	echo $((RANDOM%6+1))
}

function playerPostionTrack() {
	playerOptions=$((RANDOM%3))
	randomDiceNumber=$((playerThrowDice))
	case $playerOptions in
		$playerGetsNoPlay)
			playerLivePosition=$((playerLivePosition+zeroN))
			;;
		$playerGetsLadder)
			playerLivePosition=$((playerLivePosition+randomDiceNumber))
			;;
		$playerGetsSnake)			
			if [[ $playerLivePosition -lt $randomDiceNumber ]]
			then
				playerLivePosition=$((playerLivePosition+zeroN));
			else
				playerLivePosition=$((playerLivePosition-randomDiceNumber))
			fi
			;;
	esac
}

while [[ positionOfPlayer -le goalOfTheGame ]]
do
	playerPositionTrack
done

#End of Use Case 04
