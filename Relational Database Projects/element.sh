#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"

FIND_BY_NUMBER() {
	ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1;")
}

FIND_BY_SYMBOL() {
	ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1';")
}

FIND_BY_NAME() {
	ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1';")
}

RUN_QUERIES() {
	SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
	NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
	TYPE=$($PSQL "SELECT t.type FROM properties p LEFT JOIN types t USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER;")
	ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
	MELTING_POINT=$($PSQL "SELECT  melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
	BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
}

PRINT_OUTPUT() {
	if [[ -z $ATOMIC_NUMBER ]]
	then
		echo "I could not find that element in the database."
	else
		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
	fi
}

MAIN() {
	if [[ -z $1 ]]
	then
		echo -e  "Please provide an element as an argument."
	else
		if [[ "$1" =~ ^[0-9]+$ ]]; 
		then
			FIND_BY_NUMBER $1
		else
				if [[ ${#1} -le 2 ]]; 
				then
					FIND_BY_SYMBOL "$1"
				else
					FIND_BY_NAME "$1"
				fi
		fi

		RUN_QUERIES
		PRINT_OUTPUT
	fi
}

MAIN "$@"
