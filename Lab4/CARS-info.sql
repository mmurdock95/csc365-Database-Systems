use cars;

SELECT m.Make, d.Year FROM makes m
   INNER JOIN cardata d ON d.Id = m.Id
   WHERE m.Model = 'renault'
   ORDER BY d.Year;

SELECT m.Make, d.Year FROM makes m
   INNER JOIN cardata d ON d.Id = m.Id
   WHERE d.Year <= 1981 AND d.Year >= 1977 AND m.Model = 'volvo'
   ORDER BY d.year;

SELECT cm.FullName, cu.Name FROM carmakers cm
   INNER JOIN countries cu ON cu.Id = cm.Country
      INNER JOIN continents co ON co.Id = cu.Continent
   WHERE co.Name = 'asia'
   ORDER BY cm.FullName;

SELECT m.Make, m.Model FROM makes m
   INNER JOIN cardata d ON d.Id = m.Id
   WHERE d.Cylinders != 4 AND d.Year = 1980 AND d.MPG > 20 AND d.Accelerate < 15;

SELECT DISTINCT cm.FullName, cu.Name FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
      INNER JOIN cardata d on d.Id = m.Id
   INNER JOIN countries cu ON cu.Id = cm.Country
      INNER JOIN continents co ON co.Id = cu.Continent
   WHERE co.Name != "europe" AND d.Weight < 2000 AND d.Year <=1981 AND d.Year >= 1979;

SELECT DISTINCT cm.FullName, d.Year, d.Weight/d.Horsepower FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
      INNER JOIN cardata d on d.Id = m.Id
   WHERE m.Model = 'saab'  AND d.Year > 1978 ;