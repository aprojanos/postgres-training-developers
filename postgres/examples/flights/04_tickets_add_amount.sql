ALTER TABLE tickets ADD amount NUMERIC(10,2);
WITH ticket_amounts AS (
    SELECT
        SUM(amount) AS sum_amount,
        ticket_no 
    FROM 
        ticket_flights 
    GROUP BY ticket_no
)
UPDATE tickets t SET amount = ta.sum_amount 
FROM ticket_amounts ta
WHERE t.ticket_no = ta.ticket_no;