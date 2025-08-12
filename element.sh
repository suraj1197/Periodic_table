#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
echo "Please provide an element as an argument."

argument=$1 # taking the first argument 

TABLE=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass,p.melting_point_celsius,p.boiling_point_celsius from elements e JOIN properties p ON e.atomic_number= p.atomic_number JOIN types t ON p.type_id= t.type_id
          WHERE e.atomic_number= $1")

IFS="|" read atomic_number name symbol type atomic_mass metling_point_celcius boiling_point_celsius <<< "$TABLE"

echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $metling_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."




