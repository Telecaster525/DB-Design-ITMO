INSERT INTO users (username, password, name, surname, phone_number, address, plus_subscriber)
VALUES ('user1', 'password1', 'John', 'Doe', '123456789', '123 Street, Tampa', true),
       ('user2', 'password2', 'Jane', 'Smith', '987654321', '626 Road, Tampa', false),
       ('user3', 'password3', 'Bob', 'Smith', '987654321', '131 Road, Tampa', true),
       ('user4', 'password4', 'Alice', 'Smith', '987654321', '647 Road, Tampa', true),
       ('user5', 'password5', 'John', 'Smith', '987654321', '868 Road, Tampa', false),
       ('user6', 'password6', 'Jack', 'Smith', '987654321', '246 Road, Tampa', true),
       ('user7', 'password7', 'Olivia', 'Smith', '987654321', '456 Road, Tampa', false),
       ('user8', 'password8', 'Oliver', 'Smith', '987654321', '788 Road, Tampa', true);

INSERT INTO shops (name, address, email, phone_number, rating)
VALUES ('Shop 1', '789 Street, Tampa', 'shop1@example.com', '301963213', 4.5),
       ('Shop 2', '239 Street, Tampa', 'shop2@example.com', '135131366', 1.4),
       ('Shop 3', '212 Street, Tampa', 'shop3@example.com', '735753824', 3.5),
       ('Shop 4', '668 Street, Tampa', 'shop4@example.com', '353734163', 3.7),
       ('Shop 5', '356 Street, Tampa', 'shop5@example.com', '856341789', 4.9),
       ('Shop 6', '101 Street, Tampa', 'shop6@example.com', '345472772', 5.0),
       ('Shop 7', '853 Street, Tampa', 'shop7@example.com', '444567234', 3.2),
       ('Shop 8', '442 Street, Tampa', 'shop8@example.com', '575884222', 2.8);

INSERT INTO categories (name)
VALUES ('Electronics'),
       ('Clothing'),
       ('Books'),
       ('Home Appliances'),
       ('Sports Equipment'),
       ('Furniture'),
       ('Toys'),
       ('Beauty Products');

-- Заполнение данных из .csv

\copy users (id, username, password, name, surname, phone_number, address, plus_subscriber) FROM 'users.csv' DELIMITER ',' CSV HEADER;

\copy shops (id, name, address, email, phone_number, rating) FROM 'shops.csv' DELIMITER ',' CSV HEADER;

\copy categories (id, name) FROM 'categories.csv' DELIMITER ',' CSV HEADER;
