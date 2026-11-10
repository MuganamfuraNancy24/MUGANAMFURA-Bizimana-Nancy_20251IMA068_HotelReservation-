
CREATE OR REPLACE VIEW VW_PAYMENT_SUMMARY AS
SELECT
    p.payment_id,
    p.reservation_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.amount,
    p.payment_method,
    p.payment_status,
    p.payment_date,
    p.transaction_reference
FROM PAYMENTS p
JOIN RESERVATIONS r
    ON p.reservation_id = r.reservation_id
JOIN CUSTOMERS c
    ON r.customer_id = c.customer_id;
