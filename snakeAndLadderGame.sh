#!/bin/bash

echo "================ Welcome to SNAKES AND LADDERS ================"

#Apply values to variables
singlePlayer=1;
positionOfPlayer=0;

playerLivePosition=0;

playerGetsNoPlay=0;
playerGetsLadder=1;
playerGetsSnake=2;

function playerThrowsDice() {
	echo $((RANDOM%6+1))
}

function playerPostionTrack() {
	playerOptions=$((RANDOM%3))
	randomDiceNumber=$(playerThrowDice)
	case $playerOptions in
		$playerGetsNoPlay)
			playerLivePosition=$((playerLivePosition+0))
			;;
		$playerGetsLadder)
			playerLivePosition=$(($playerLivePosition+$randomDiceNumber))
			;;
		$playerGetsSnake)
			playerLivePosition=$(($playerLivePosition-$randomDiceNumber))
			;;
		*)
			echo "Game Error, Please try again"
			;;
	esac
}

playerPositionTrack
#End of Use Case 03
