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
	echo $(($((RANDOM %6))+1))
}


function playerPositionTrack() {
	playerOptions=$((RANDOM %3))
	randomDiceNumber=$(playerThrowsDice )
	case $playerOptions in
		$playerGetsNoPlay)
			playerLivePosition=$((playerLivePosition+zeroN))
			;;
		$playerGetsLadder)
			checksPlayerPositionInCaseOfLadder
			;;
		$playerGetsSnake)			
			checksPlayerPositionInCaseOfSnake
			;;
	esac
}

function checksPlayerPositionInCaseOfLadder() {
	if [[ $(( $playerLivePosition + $randomDiceNumber )) -gt $goalOfTheGame ]]
	then
		playerLivePosition=$((playerLivePosition+zeroN));
	else
		playerLivePosition=$((playerLivePosition+randomDiceNumber));
	fi
}

function checksPlayerPositionInCaseOfSnake() {
	if [[ $playerLivePosition -lt $randomDiceNumber ]]
	then
		playerLivePosition=$((playerLivePosition+zeroN));
	else
		playerLivePosition=$((playerLivePosition-randomDiceNumber));
	fi
}

function gameSnakeNLadderControlPanel() {
	while [[ $playerLivePosition -ne $goalOfTheGame ]]
	do
		playerPositionTrack
	done
}

gameSnakeNLadderControlPanel
#End of Use Case 05
