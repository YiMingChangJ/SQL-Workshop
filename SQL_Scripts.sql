SELECT * 
FROM users_data;

SELECT AVG(yearly_income) AS average_income, SUM(yearly_income)/count(*) AS Average_yearly_income 
FROM users_data;

SELECT * 
FROM transactions_data;


SELECT *
FROM transactions_data
WHERE merchant_city = "Toronto";

SELECT *
FROM transactions_data
WHERE merchant_city LIKE 'T*';

PRAGMA case_sensitive_like = off;

-- Now LIKE will be case-sensitive
SELECT *
FROM transactions_data
WHERE merchant_city LIKE 'T%';

SELECT *
FROM transactions_data
WHERE merchant_city LIKE "T%" AND merchant_city LIKE "%oro%"

SELECT *
FROM transactions_data
WHERE merchant_city GLOB '*T*';

SELECT *
FROM transactions_data
WHERE merchant_city LIKE "T%" AND merchant_city LIKE "%oro%"
AND (merchant_state = 'Canada' or merchant_state = 'NJ');

SELECT id, total_debt/yearly_income ncome FROM users_data;

SELECT id, (total_debt / yearly_income) AS debt_to_income_ratio from users_data;

SELECT per_capita_income
FROM users_data;

SELECT *
FROM users_data;

SELECT DISTINCT current_age
from users_data;

SELECT count(DISTINCT id)
FROM users_data;

SELECT id, MAX(current_age)
FROM users_data;

SELECT *
FROM (SELECT DISTINCT gender FROM users_data);

SELECT count(total_debt)
FROM users_data
WHERE total_debt != 0;

SELECT count(*)
FROM users_data
WHERE current_age < 20 and yearly_income > 60000;

SELECT count(*) FROM users_data
WHERE id <> 1556;

SELECT *
FROM users_data
ORDER BY id;

SELECT *
FROM users_data
ORDER BY id, gender;

SELECT AVG(credit_score) as average_credit_score, MAX(total_debt) as Maximium_total_debt
FROM users_data;

SELECT gender, AVG(credit_score)
FROM users_data
GROUP BY gender;

SELECT *
FROM transactions_data
WHERE strftime('%Y', date) = '2010';

SELECT *
FROM transactions_data
ORDER BY merchant_city, id;

SELECT *
FROM transactions_data
ORDER BY merchant_city ASC, id DESC;

SELECT *
FROM Track
LIMIT 12 offset 3493;

INSERT INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, UnitPrice)
VALUES (3505, 'hahaha', 350, 3, 1, 'haha', 200000, 0.99);

UPDATE track
SET Name = 'xixi', AlbumId = 520
WHERE trackid = 3505;

DELETE FROM track
where TrackId= 3505;

SELECT *
FROM transactions_data;

SELECT *
FROM users_data;

SELECT 
    id, 
    COALESCE(address, 'Address Unknown') AS Mailing_Address
FROM users_data
WHERE address = 'Address Unknown';

SELECT ABS(Longitude)
FROM users_data;

SELECT CEILING(Longitude)
FROM users_data;

SELECT first(use_chip)
FROM transactions_data;


SELECT *
FROM users_data; 

PRAGMA table_info(users_data);

SELECT TRIM(per_capita_income,1)
FROM users_data;

SELECT 
    date, 
    amount,
    FIRST_VALUE(amount) OVER (
        PARTITION BY client_id   -- Group by User
        ORDER BY date            -- Sort by Date
    ) AS First_Purchase_Amount
FROM transactions_data;

SELECT CONCAT(address,' ,', latitude, ' ,', longitude) AS 'address with latitude longitude'
FROM users_data;


SELECT length(CONCAT(address,' ,', latitude, ' ,', longitude))AS 'address with latitude longitude'
FROM users_data;

SELECT UPPER(address)
from users_data;


SELECT LOWER(CONCAT(address,' ,', latitude, ' ,', longitude)) AS 'address with latitude longitude'
FROM users_data;

SELECT substr(address, -1, 100)
FROM users_data;

SELECT REPLACE(per_capita_income, '$', '')
FROM users_data;

SELECT sum(CAST(REPLACE(per_capita_income, '$', '') AS Floor))
FROM users_data;

SELECT REPLACE(REPLACE(per_capita_income, '$', ''), ',', '')
FROM users_data;

SELECT sum(CAST(REPLACE(REPLACE(per_capita_income, '$', ''), ',', '') AS S int))
FROM users_data;


SELECT total_debt + 500 FROM users_data;
SELECT COALESCE(total_debt, 0) + 500 FROM users_data;

SELECT 
	concat(address, ','),
	TRIM(concat(address, ','), ',')
from users_data;


SELECT *
FROM transactions_data
WHERE merchant_city LIKE "T%" AND merchant_city LIKE "%oro%"
AND (merchant_state = 'Canada' or merchant_state = 'NJ'); 

SELECT merchant_city 
FROM transactions_data
WHERE merchant_city LIKE "_oronto"; 

SELECT merchant_city 
FROM transactions_data
WHERE merchant_city LIKE "T____to"; 


SELECT * FROM users_data ud ;
PRAGMA table_info(users_data); 

SELECT UPPER('address')

PRAGMA table_info('users_data');
PRAGMA table_info('cards_data');
PRAGMA table_info('transactions_data');
PRAGMA table_info('Album');


SELECT 
    date, 
    amount,
    FIRST_VALUE(amount) OVER (
        PARTITION BY client_id   -- Group by User
        ORDER BY date            -- Sort by Date
    ) AS First_Purchase_Amount
FROM transactions_data;

-- Step 1: Create a temporary "virtual table" (CTE) that ranks the purchases
WITH RankedPurchases AS (
    SELECT 
        client_id,
        date, 
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY client_id 
            ORDER BY date
        ) AS purchase_rank
    FROM transactions_data
)
SELECT 
    client_id, 
    date AS First_Purchase_Date, 
    amount AS First_Purchase_Amount
FROM RankedPurchases
WHERE purchase_rank = 1;


SELECT id, amount, CAST(REPLACE(amount, '$', '') AS DECIMAL) AS Transaction_amount
FROM transactions_data
WHERE Transaction_amount BETWEEN 10 AND 12
AND id in (7475337, 7475353, 7475377);


INSERT INTO transactions_data (id, date, client_id, amount, merchant_city)
VALUES (900001, '2026-02-23 08:30:00', 1556, '$4.50', 'Toronto');

DELETE FROM transactions_data
WHERE id = 900001;


SELECT *
FROM transactions_data t
FULL OUTER JOIN users_data u ON u.id = t.client_id
ORDER BY u.id;

SELECT count(*)
FROM users_data u
LEFT JOIN cards_data c ON u.id = c.client_id;


SELECT count(*)
FROM users_data u
FULL OUTER JOIN cards_data c ON u.id = c.client_id;

SELECT *
FROM users_data u
JOIN cards_data c ON u.id = c.client_id
WHERE current_age > 35
GROUP BY c.card_number
HAVING COUNT(u.id) > 1
ORDER BY u.id ASC
LIMIT 100
OFFSET 0;




SELECT *
FROM transactions_data T
JOIN cards_data C ON T.card_id = C.id
JOIN users_data U ON C.client_id = U.id
WHERE U.address LIKE 'T%'; -- Or use latitude/longitude logic if available

SELECT COUNT(1) 
FROM users_data;

SELECT *
FROM transactions_data T
JOIN cards_data C ON T.card_id = C.id
JOIN users_data U ON C.client_id = U.id;


SELECT address AS city 
FROM users_data
UNION 
SELECT merchant_city AS city 
FROM transactions_data;

SELECT 
	client_id,
	amount,
    CAST(REPLACE(amount, '$', '') AS DECIMAL) AS transaction_amount, 
    CASE
        WHEN CAST(REPLACE(amount, '$', '') AS DECIMAL) < 10 THEN 'Small Trade'
        WHEN CAST(REPLACE(amount, '$', '') AS DECIMAL) > 100 THEN 'Large Trade'
        ELSE 'Medium Trade'
    END AS Trade_Size
FROM transactions_data;

SELECT id, credit_limit,
  CASE
    WHEN credit_limit > 20000 THEN 'Platinum'
    WHEN credit_limit > 10000 THEN 'Gold'
    ELSE 'Standard'
  END AS Card_Tier
FROM cards_data;



SELECT
    CASE WHEN U.current_age < 30 THEN 'Young' ELSE 'Older' END as Age_Group,
    AVG(T.amount) as Avg_Transaction_Size,
    SUM(T.amount) as Total_Volume
FROM transactions_data T
JOIN cards_data C ON T.card_id = C.id
JOIN users_data U ON C.client_id = U.id
WHERE C.card_brand = 'Visa' AND C.card_type = 'Credit'
GROUP BY Age_Group;


-- Using IIF() in SQL Server 
-- Syntax: IIF(condition, value_if_true, value_if_false)

SELECT 
    id, 
    credit_limit,
    IF(credit_limit > 20000, 'Platinum', 
        IF(credit_limit > 10000, 'Gold', 'Standard')
    ) AS Card_Tier
FROM cards_data;

PRAGMA table_info(users_data);

SELECT gender
FROM users_data
ORDER BY RIGHT(gender, 3);


PRAGMA table_info(users_data); 


CREATE TABLE TradeOrders (
    OrderID INT,
    StockTicker VARCHAR(10),
    Quantity INT,
    Price DECIMAL(10, 2)
);

PRAGMA table_info(tradeOrders); 

ALTER TABLE TradeOrders
ADD CommissionFee DECIMAL(5, 2);

DROP TABLE TradeOrders;

PRAGMA table_info(cards_data);

PRAGMA table_info(Album);

SELECT * FROM cards_data;

SELECT id, (total_debt / yearly_income) AS debt_to_income_ratio
FROM users_data;

SELECT AVG(yearly_income)
FROM users_data; 

SELECT 
    u.id, 
    u.current_age, 
    COUNT(c.card_number) AS total_cards
FROM users_data u
JOIN cards_data c ON u.id = c.client_id
WHERE u.current_age > 35
GROUP BY u.id, u.current_age
HAVING COUNT(c.card_number) > 1
ORDER BY total_cards DESC;


SELECT * FROM users_data;

SELECT id, Address
FROM users_data 
WHERE Address IS NOT NULL;

SELECT count(Address)
FROM users_data 
WHERE Address IS NOT "" AND Address IS NOT NULL;


SELECT SUBSTR(address, 1, 5) 
FROM users_data;

PRAGMA table_info(users_data);

SELECT per_capita_income, SUM(CAST(REPLACE(REPLACE(per_capita_income, '$', ''), ',', '') AS REAL)) AS total_capita_income_of_all_customers
FROM users_data;

SELECT ' hello ', RTRIM(' hello ')

SELECT
	CONCAT(address, ','),
	TRIM(CONCAT(address, ','), ',') AS clean_address
FROM users_data;

SELECT * 
FROM users_data 
WHERE current_age >= retirement_age;

SELECT *
FROM users_data
WHERE current_age < 30 AND yearly_income > 80000;

SELECT *
FROM users_data
WHERE id = 1556;

PRAGMA table_info(transactions_data);

SELECT * 
FROM transactions_data;

SELECT * 
FROM transactions_data
WHERE merchant_city = 'Toronto';

SELECT *
FROM transactions_data
WHERE merchant_city LIKE '%T%';

SELECT *
FROM transactions_data
WHERE merchant_city LIKE 'T%' AND merchant_city LIKE '%roo%';

SELECT *
FROM transactions_data
WHERE merchant_city LIKE 'T%' AND merchant_city LIKE '%oro%' 
AND (merchant_state = 'Canada' OR merchant_state = 'NJ');

SELECT *
FROM transactions_data
WHERE merchant_city IN ('Toronto', 'Mexico', 'Vancouver');

SELECT *
FROM transactions_data
WHERE merchant_city = 'Toronto' OR merchant_city = 'Mexico' OR merchant_city = 'Vancouver';

SELECT *
FROM transactions_data
WHERE merchant_city IN (SELECT merchant_city FROM transactions_data);

SELECT id, amount, CAST(REPLACE(amount, '$', '') AS DECIMAL) AS Transaction_amount
FROM transactions_data
WHERE Transaction_amount BETWEEN 10 and 12;

SELECT id, amount, CAST(REPLACE(amount, '$', '') AS DECIMAL) AS Transaction_amount
FROM transactions_data
WHERE Transaction_amount > 10 and Transaction_amount < 12
AND id IN (7475337, 7475353, 7475377);

SELECT merchant_city 
FROM transactions_data
WHERE merchant_city BETWEEN 'A' AND 'C' AND merchant_city LIKE 'B%';

SELECT *
FROM transactions_data
WHERE date BETWEEN '2010-07-01' AND '2010-08-01'

SELECT merchant_city
FROM transactions_data
WHERE merchant_city GLOB '*t*';

SELECT * 
FROM transactions_data
WHERE merchant_city LIKE 'T____to'

SELECT *
FROM users_data 
ORDER BY id DESC;

SELECT *
FROM transactions_data
ORDER BY merchant_city ASC, id DESC;

SELECT COUNT(merchant_city)
FROM transactions_data;

SELECT merchant_city, COUNT(merchant_city) AS total_transactions
FROM transactions_data
GROUP BY merchant_city
ORDER BY total_transactions DESC;

SELECT client_id, SUM(CAST(REPLACE(amount, '$', '') AS DECIMAL)) AS total_amount
FROM transactions_data
GROUP BY client_id
ORDER BY total_amount DESC;

SELECT merchant_city, COUNT(merchant_city) AS city_number_appearance
FROM transactions_data
GROUP BY merchant_city 
HAVING city_number_appearance < 5
ORDER BY city_number_appearance DESC;

SELECT column_name(s)
FROM table1
INNER JOIN table2 ON table1.column_name = table2.column_name;


SELECT * FROM users_data; 
SELECT * FROM cards_data;

SELECT COUNT(*) 
FROM cards_data;

SELECT *
FROM users_data 
INNER JOIN cards_data ON users_data.id = cards_data.client_id;

SELECT *
FROM users_data ud
JOIN cards_data cd ON ud.id = cd.client_id;

SELECT SUM(num_credit_cards)
FROM users_data;

SELECT COUNT(DISTINCT id)
FROM cards_data;

SELECT ud.id AS client_id, cd.id AS card_id, ud.current_age, ud.birth_year, ud.address, ud.per_capita_income, cd.card_brand, cd.card_type, cd.card_number
FROM users_data ud
INNER JOIN cards_data cd ON ud.id = cd.client_id;

SELECT *
FROM users_data ud 
JOIN cards_data cd ON ud.id = cd.client_id
JOIN transactions_data td ON cd.id = td.card_id;

SELECT t.client_id, t.card_id, SUM(CAST(REPLACE(t.amount, '$', '') AS DECIMAL)) AS total_amount, c.card_number, COUNT(c.card_number) AS number_of_transactions
FROM transactions_data t
RIGHT JOIN cards_data c ON c.id = t.card_id
GROUP BY c.card_number
ORDER BY number_of_transactions DESC;



SELECT
	u.id,
	u.current_age,
	COUNT(c.card_number) AS total_holding_cards
FROM users_data u
JOIN cards_data c ON u.id = c.client_id
WHERE u.current_age > 35
GROUP BY u.id
HAVING total_holding_cards > 1
ORDER BY total_holding_cards DESC;

CASE
	WHEN condition1 is TRUE THEN result1
	WHEN condition2 is TRUE THEN result2
	ELSE result3
END

SELECT 
	client_id,
	amount,
	CAST(REPLACE(amount, '$', '') AS DECIMAL) AS transaction_amount,
	CASE
		WHEN CAST(REPLACE(amount, '$', '') AS DECIMAL) < 10 THEN 'Small Trade'
		WHEN CAST(REPLACE(amount, '$', '') AS DECIMAL) > 100 THEN 'Large Trade'
		ELSE 'Medium Trade'
	END AS Trade_Size
FROM transactions_data;

SELECT id, credit_limit,
	CASE
		WHEN CAST(REPLACE(credit_limit, '$', '') AS DECIMAL) > 20000 THEN 'Platinum'
		WHEN CAST(REPLACE(credit_limit, '$', '') AS DECIMAL) > 10000 THEN 'Gold'
		ELSE 'Standard'
	END AS Card_Tier
FROM cards_data;
	
IF(Condition, return value if true, value_if_false)

SELECT
	id,
	credit_limit,
	IF(CAST(REPLACE(credit_limit, '$', '') AS DECIMAL) > 20000, 'Platinum',
		IF(CAST(REPLACE(credit_limit, '$', '') AS DECIMAL) > 10000, 'Gold', 'Standard')
	) AS Card_Tier
FROM cards_data;
	

SELECT COUNT(1)
FROM users_data;

































