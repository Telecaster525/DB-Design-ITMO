CREATE TABLE categories
(
    id   uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name text NOT NULL
);

CREATE TABLE products
(
    id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name         text                            NOT NULL UNIQUE,
    description  text,
    price        numeric                         NOT NULL,
    rating       numeric,
    rating_votes int,
    category_id  uuid REFERENCES categories (id) NOT NULL
);

CREATE TABLE product_options
(
    id         uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    value      text                          NOT NULL,
    product_id uuid REFERENCES products (id) NOT NULL
);

CREATE TABLE order_units
(
    id         uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    amount     int,
    product_id uuid REFERENCES products (id)
);

CREATE TABLE users
(
    id              uuid PRIMARY KEY     DEFAULT uuid_generate_v4(),
    username        varchar(32) NOT NULL UNIQUE,
    password        varchar(32) NOT NULL,
    name            varchar(16) NOT NULL,
    surname         varchar(16) NOT NULL,
    phone_number    varchar(16) NOT NULL,
    address         varchar(64) NOT NULL,
    plus_subscriber boolean     NOT NULL DEFAULT false
);

CREATE TABLE shops
(
    id           uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name         varchar(32) NOT NULL UNIQUE,
    address      varchar(32) NOT NULL,
    email        text        NOT NULL,
    phone_number varchar(15) NOT NULL,
    rating       numeric,
    rating_votes int
);

CREATE TABLE orders
(
    id            uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id       uuid REFERENCES users (id),
    order_unit_id uuid REFERENCES order_units (id),
    shop_id       uuid REFERENCES shops (id)
);
