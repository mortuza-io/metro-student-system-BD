INSERT INTO Institutions VALUES
('University of Asia Pacific', 'University', 'Dhaka', 'info@uap.edu.bd', '01700000001', 'Active'),
('Dhaka College', 'College', 'Dhaka', 'info@dc.edu', '01700000002', 'Active');

INSERT INTO Students (InstitutionID, FullName, StudentRoll, Department, Email, Phone, DateOfBirth, VerificationStatus)
VALUES
(1, 'Mortuza', 'CSE-221', 'CSE', 'mortuza@email.com', '01811111111', '2003-05-10', 'Verified'),
(2, 'Rahim', 'DC-101', 'Science', 'rahim@email.com', '01822222222', '2002-03-15', 'Pending');

INSERT INTO Admins VALUES
('Admin One', 'admin@metro.com', 'pass', 'SuperAdmin', 'Active');

INSERT INTO MetroCards VALUES
(1, 'CARD1001', 500, '2024-01-01', '2026-01-01', 'Active'),
(2, 'CARD1002', 200, '2024-02-01', '2026-02-01', 'Active');

INSERT INTO Stations VALUES
('Uttara North', 'Dhaka', 'Zone 1', 'Active'),
('Motijheel', 'Dhaka', 'Zone 3', 'Active'),
('Farmgate', 'Dhaka', 'Zone 2', 'Active');

INSERT INTO Routes VALUES
(1, 2, 20.5, 60, 30, 'Active'),
(1, 3, 10.0, 40, 20, 'Active');

INSERT INTO Trips VALUES
(1, 1, 1, 2, '2026-04-20 08:00', '2026-04-20 08:45', 30, 'Completed'),
(2, 2, 1, 3, '2026-04-21 09:00', '2026-04-21 09:25', 20, 'Completed');
