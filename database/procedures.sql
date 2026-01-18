USE LittleLemonDB;

DELIMITER $$

-- =========================
-- GetMaxQuantity
-- =========================
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END$$

-- =========================
-- AddBooking
-- =========================
CREATE PROCEDURE AddBooking(
    IN booking_date DATE,
    IN table_no INT,
    IN customer_id INT
)
BEGIN
    INSERT INTO Bookings (BookingDate, TableNo, CustomerID)
    VALUES (booking_date, table_no, customer_id);

    SELECT 'Booking added successfully' AS Status;
END$$

-- =========================
-- UpdateBooking
-- =========================
CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_date DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = new_date
    WHERE BookingID = booking_id;

    SELECT 'Booking updated successfully' AS Status;
END$$

-- =========================
-- CancelBooking
-- =========================
CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;

    SELECT 'Booking cancelled successfully' AS Status;
END$$

-- =========================
-- ManageBooking
-- =========================
CREATE PROCEDURE ManageBooking(
    IN booking_date DATE,
    IN table_no INT
)
BEGIN
    DECLARE booking_count INT;

    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date
      AND TableNo = table_no;

    IF booking_count > 0 THEN
        SELECT 'Table already booked' AS Status;
    ELSE
        SELECT 'Table available' AS Status;
    END IF;
END$$

DELIMITER ;
