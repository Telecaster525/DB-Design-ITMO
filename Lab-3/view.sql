CREATE VIEW product_info AS
SELECT p.name AS product_name, c.name AS category_name, p.price, p.rating
FROM products p JOIN categories c ON p.category_id = c.id;