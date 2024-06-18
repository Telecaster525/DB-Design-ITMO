CREATE EXTENSION IF NOT EXISTS anon;

CREATE OR REPLACE VIEW anon_users AS
SELECT
    ID,
    anon.fake_first_name() AS Name,
    anon.fake_last_name() AS Surname,
    anon.fake_postcode() AS Postcode
FROM users;

CREATE MATERIALIZED VIEW mv_users_generalized AS
SELECT
    id,
    username,
    SUBSTRING(name, 1, 1) || '****' AS generalized_name,
    SUBSTRING(surname, 1, 1) || '****' AS generalized_surname,
    '***-***-' || SUBSTRING(phone_number, -4) AS generalized_phone,
    '*****' AS generalized_address,
    plus_subscriber
FROM
    users;

CREATE MATERIALIZED VIEW mv_orders_pseudonymized AS
SELECT
    o.id AS order_id,
    CONCAT('User', SUBSTRING(u.id::text FROM 1 FOR 4)) AS pseudonymized_username,
    p.name AS product_name,
    s.name AS shop_name
FROM
    orders o
JOIN
    users u ON o.user_id = u.id
JOIN
    order_units ou ON o.order_unit_id = ou.id
JOIN
    products p ON ou.product_id = p.id
JOIN
    shops s ON o.shop_id = s.id;


CREATE MATERIALIZED VIEW mv_shops_randomized AS
SELECT
    id,
    md5(random()::text) AS randomized_name,
    md5(random()::text) AS randomized_address,
    md5(random()::text) AS randomized_email,
    '***-***-' || SUBSTRING(phone_number, -4) AS randomized_phone,
    rating,
    rating_votes
FROM
    shops;

