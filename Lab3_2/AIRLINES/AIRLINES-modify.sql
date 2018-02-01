#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3

DELETE FROM flights
   WHERE (sourceAirport != 'AKI' AND destAirport != 'AKI');

UPDATE flights
   INNER JOIN airlines ON flights.airline = airlines.id
   SET flights.flightNumber = flights.flightNumber + 10001
   WHERE (airlines.abbreviation != 'Continental' AND airlines.abbreviation != 'AirTran' AND airlines.abbreviation != 'Virgin')
         AND flights.flightNumber % 2 = 0;

UPDATE flights
   INNER JOIN airlines ON flights.airline = airlines.id
   SET flights.flightNumber = flights.flightNumber - 1
   WHERE (airlines.abbreviation != 'Continental' AND airlines.abbreviation != 'AirTran' AND airlines.abbreviation != 'Virgin')
         AND flights.flightNumber % 2 = 1 AND flights.flightNumber < 10000;

UPDATE flights
   SET flights.flightNumber = flights.flightNumber - 10000
   WHERE flights.flightNumber > 10000;

UPDATE flights
   INNER JOIN airlines ON flights.airline = airlines.id
   SET airlines.name = 'Continental Airlines',
       airlines.abbreviation = 'Continental',
       flights.airline = 7
   WHERE (airlines.abbreviation != 'Continental' AND airlines.abbreviation != 'AirTran' AND airlines.abbreviation != 'Virgin');

   SELECT * FROM flights
    ORDER BY airline, flightNumber;