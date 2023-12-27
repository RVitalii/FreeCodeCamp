#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

PICK_SERVICE() {
        SERVICES=$($PSQL "SELECT * FROM services;")
        echo "$SERVICES" | while read SERVICE_ID SEP SERVICE_NAME 
        do
                echo -e "$SERVICE_ID) $SERVICE_NAME"
        done

        read SERVICE_ID_SELECTED
        VALIDATE_SERVICE
}

VALIDATE_SERVICE() {
        CHECK_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id='$SERVICE_ID_SELECTED';")
        if [[ -z $CHECK_SERVICE ]]
        then
                echo -e "\nI could not find that service. What would you like today?"
                PICK_SERVICE
        fi
}

GET_NUMBER() {
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CHECK_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE';")
        if [[ -z $CHECK_NUMBER ]]
        then
                echo -e "\nI don't have a record for that phone number, what's your name?"
                read CUSTOMER_NAME
                SETUP_NEW_ACCOUNT
        fi    
}

SETUP_NEW_ACCOUNT() {
        NEW_ACCOUNT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
}

MAKE_APPOINTMENT() {
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED';")

        echo -e "\nWhat time would you like your$SERVICE_NAME,$CUSTOMER_NAME?"
        read SERVICE_TIME

        NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
        echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
}

MAIN() {
        echo -e "\n~~~~~ MY SALON ~~~~~\n"
        echo -e "Welcome to My Salon, how can I help you?\n"

        PICK_SERVICE
        GET_NUMBER
        MAKE_APPOINTMENT 
}

MAIN
