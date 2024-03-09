CREATE INDEX IF NOT EXISTS product_category_name_idx ON products (category_id, name COLLATE "C");

CREATE INDEX IF NOT EXISTS user_name_surname_idx ON users (name COLLATE "C", surname COLLATE "C");