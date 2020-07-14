#!/bin/bash 

echo "================ Welcome to SNAKES AND LADDERS ================"

#Apply values to variables
<<<<<<< HEAD
singlePlayer=1;
positionOfPlayer=0;
goalOfTheGame=100;
=======
SINGLE_PLAYER=1;
POSITION_OF_PLAYER=0;
>>>>>>> UseCase01_snakeAndLadderPlayerIntialization

playerLivePosition=0;
zeroN=0;
collectDiceRollsWinGame=0;

playerOneGameTrack=0;
playerTwoGameTrack=0;
playerOneLivePosition=0;
playerTwoLivePosition=0;
tryAgain=0;

playerGetsNoPlay=0;
playerGetsLadder=1;
playerGetsSnake=2;

function playerThrowsDice() {
	echo $(($((RANDOM %6))+1))
}


function playerPositionTrack() {
	playerOptions=$((RANDOM %3))
	selectionOfPlayer=$1;
	randomDiceNumber=$(playerThrowsDice )
	playersGetChanceToWin
	case $playerOptions in
		$playerGetsNoPlay)
			playerLivePosition=$((playerLivePosition+zeroN))
			;;
		$playerGetsLadder)
			checksPlayerPositionInCaseOfLadder
			((collectDiceRollsWinGame++))
			;;
		$playerGetsSnake)			
			checksPlayerPositionInCaseOfSnake
			;;
	esac

}

function playersGetChanceToWin() {
	if [[ $playerOneGameTrack -eq '1' && $tryAgain -eq '0' ]]
	then
		playerLivePosition=$((playerOneLivePosition));
		playerOneGameTrack=0;
		playerTwoGameTrack=1;
		playerWhoPlayes="Player1"
	elif [[ $playerTwoLivePosition -eq '1' && $tryAgain -eq '0' ]]
	then	
		playerLivePosition=$((playerTwoLivePosition));
		playerOneGameTrack=1;
		playerTwoGameTrack=0;
		playerWhoPlayes="Player2"
	elif [[ $playerTwoGameTrack -eq '1' && $tryAgain -eq '1' ]]
	then
		playerLivePosition=$((playerOneLivePosition));
		playerOneGameTrack=0;
		playerTwoGameTrack=1;
		tryAgain=0;
		playerWhoPlayes="Player1"
	else	
		playerLivePosition=$((playerTwoLivePosition));
		playerOneGameTrack=1;
		playerTwoGameTrack=0;	
		tryAgain=0;
		playerWhoPlayes="Player2"
	fi
}

function checksPlayerPositionInCaseOfLadder() {
	if [[ $(( $playerLivePosition + $randomDiceNumber )) -gt $goalOfTheGame ]]
	then
		playerLivePosition=$((playerLivePosition+zeroN));
		tryAgain=1;
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

function findPlayerPosition() {
	if [[ $playerWhoPlayes == "Player1" ]]
		then
			playerOneLivePosition=$playerLivePosition;
		else
			playerTwoLivePosition=$playerLivePosition;
		fi
}

function gameSnakeNLadderControlPanel() {
	while [[ $playerLivePosition -lt $goalOfTheGame ]]
	do
		playerPositionTrack
		findPlayerPosition
	done
	echo "Player Who Wins the Game is: $playerWhoPlayes"
	echo "Report the dice was played by player to win is: $collectDiceRollsWinGame"
}

gameSnakeNLadderControlPanel
#End of Use Case 07
