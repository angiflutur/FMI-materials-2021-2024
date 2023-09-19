UPDATE order_master
SET price = CASE
    WHEN user_id IN (SELECT user_id FROM user_profile WHERE first_name = 'Mary' AND last_name = 'Fox') THEN 1.99
    ELSE 10.99
END
WHERE price IS NULL;