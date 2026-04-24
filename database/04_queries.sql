-- Students with institutions
SELECT s.FullName, i.InstitutionName
FROM Students s
JOIN Institutions i ON s.InstitutionID = i.InstitutionID;

-- Trip history
SELECT t.TripID, s.FullName, t.FareDeducted
FROM Trips t
JOIN MetroCards mc ON t.CardID = mc.CardID
JOIN Students s ON mc.StudentID = s.StudentID;

-- Total revenue
SELECT SUM(FareDeducted) AS TotalRevenue
FROM Trips;

-- Low balance cards
SELECT CardNumber, Balance
FROM MetroCards
WHERE Balance < 100;
