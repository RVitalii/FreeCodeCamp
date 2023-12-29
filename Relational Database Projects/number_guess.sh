#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

GET_USER_ID() {
	USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")
}

SETUP_NEW_USER() {
	NEW_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
}

GET_USER_STATS() {
	GAME_COUNT=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID;")
	BEST_SCORE=$($PSQL "SELECT MIN(score) FROM games WHERE user_id = $USER_ID;")
}

LOGIN() {
	echo -e "Enter your username:"
	read USERNAME
	GET_USER_ID
	if [[ -z $USER_ID ]]
	then
		echo -e "Welcome, $USERNAME! It looks like this is your first time here."
		SETUP_NEW_USER
		GET_USER_ID
	else
		GET_USER_STATS
		echo -e "Welcome back, $USERNAME! You have played $GAME_COUNT games, and your best game took $BEST_SCORE guesses."
	fi
}

GET_SECRET_NUMBER() {
	SECRET_NUMBER=$(($RANDOM % 1000 + 1))
}

GET_USER_INPUT(){
	read GUESSED_NUMBER
	if ! [[ $GUESSED_NUMBER =~ ^[0-9]+$ ]]
	then
		echo -e "That is not an integer, guess again:"
		GET_USER_INPUT
	fi
}

UPDATE_DATABASE() {
	DB_UPDATE=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $GUESS_COUNT);")
}

NUMBER_GUESSING_GAME() {
	echo -e "Guess the secret number between 1 and 1000:"
	GET_USER_INPUT
	GET_SECRET_NUMBER

	GUESS_COUNT=1
	while [[ $GUESSED_NUMBER != $SECRET_NUMBER ]]
	do
		((GUESS_COUNT++))
		if [[ $GUESSED_NUMBER -lt $SECRET_NUMBER ]]
		then
			echo -e "It's lower than that, guess again:"
			GET_USER_INPUT
		else
			echo -e "It's higher than that, guess again:"
			GET_USER_INPUT
		fi
	done

	UPDATE_DATABASE
	echo -e "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
}

MAIN() {
	LOGIN
	NUMBER_GUESSING_GAME
}

MAIN
