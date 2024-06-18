CREATE OR REPLACE FUNCTION insert_product_partition()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.price >= 0 AND NEW.price <= 100 THEN
        INSERT INTO products_under_100 (id, name, description, price, rating, rating_votes, category_id)
        VALUES (NEW.id, NEW.name, NEW.description, NEW.price, NEW.rating, NEW.rating_votes, NEW.category_id);
    ELSIF NEW.price > 100 AND NEW.price <= 500 THEN
        INSERT INTO products_101_to_500 (id, name, description, price, rating, rating_votes, category_id)
        VALUES (NEW.id, NEW.name, NEW.description, NEW.price, NEW.rating, NEW.rating_votes, NEW.category_id);
    ELSE
        INSERT INTO products_above_500 (id, name, description, price, rating, rating_votes, category_id)
        VALUES (NEW.id, NEW.name, NEW.description, NEW.price, NEW.rating, NEW.rating_votes, NEW.category_id);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER products_partition_trigger
    BEFORE INSERT
    ON products
    FOR EACH ROW
EXECUTE FUNCTION insert_product_partition();