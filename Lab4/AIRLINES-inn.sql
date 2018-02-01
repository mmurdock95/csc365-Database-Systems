use airlines;

SELECT DISTINCT aline.Name, aline.Abbr FROM airlines aline
   INNER JOIN flights f ON f.Airline = aline.Id
   WHERE f.Source = 'AXX' OR f.Destination = 'AXX'
   ORDER BY aline.Name;

SELECT DISTINCT f.FlightNo, f.Destination, port.Name FROM flights f
   INNER JOIN airports port ON port.Code = f.Destination
      INNER JOIN airlines aline ON aline.Id = f.Airline
   WHERE f.Source = 'AXX' AND aline.Abbr = 'Northwest'
   ORDER BY f.flightNo;

--NEED TO DO #3

SELECT fJet.Destination, fJet.Source FROM airlines aFront, airlines aJet, flights fFront, flights fJet
   WHERE aJet.Abbr = "JetBlue" && aFront.Abbr = "Frontier"
         && fJet.Airline = aJet.Id && fFront.Airline = aFront.Id
         && fJet.Source = fFront.Source && fJet.Destination = fFront.Destination
         && fJet.Source < fFront.Destination && fFront.Source < fJet.Destination
   ORDER BY fFront.Destination;

   SELECT DISTINCT fFront.Source AS "Airport Codes"
      FROM airlines aDelta, airlines aFront, airlines aUS, airlines aUAL, airlines aSouth,
                  flights fDelta, flights fFront, flights fUS, flights fUAL,flights fSouth
      WHERE aDelta.Abbr = "Delta" && aFront.Abbr = "Frontier" && aUS.Abbr = "USAir" 
            && aUAL.Abbr = "UAL" && aSouth.Abbr = "Southwest"
            && fDelta.Airline = aDelta.Id && fFront.Airline = aFront.Id && fUS.Airline = aUS.Id
            && fUAL.Airline = aUAL.Id && fSouth.Airline = aSouth.Id
            && fDelta.Source = fFront.Source && fFront.Source = fUS.Source 
            && fUS.Source = fUAL.Source && fUAL.Source = fSouth.Source
      ORDER BY fFront.Source;

   SELECT DISTINCT f1.Source FROM airlines a, flights f1, flights f2, flights f3
      WHERE a.Abbr = "Southwest" && f1.Airline = a.Id && f2.Airline = a.Id && f3.Airline = a.Id
               && f1.FlightNo != f2.FlightNo && f2.FlightNo != f3.FlightNo && f1.FlightNo != f3.FlightNo
               && f1.Source = f2.Source && f2.Source = f3.Source
      ORDER BY f1.Source;