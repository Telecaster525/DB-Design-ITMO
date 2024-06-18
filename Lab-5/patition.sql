CREATE TABLE products_under_100
(
    id           uuid PRIMARY KEY DEFAULT anon.uuid_generate_v4() NOT NULL,
    name         text                                             NOT NULL UNIQUE,
    description  text,
    price        numeric                                          NOT NULL,
    rating       numeric,
    rating_votes int,
    category_id  uuid REFERENCES categories (id)                  NOT NULL
);

CREATE TABLE products_101_to_500
(
    id           uuid PRIMARY KEY DEFAULT anon.uuid_generate_v4() NOT NULL,
    name         text                                             NOT NULL UNIQUE,
    description  text,
    price        numeric                                          NOT NULL,
    rating       numeric,
    rating_votes int,
    category_id  uuid REFERENCES categories (id)                  NOT NULL
);

CREATE TABLE products_above_500
(
    id           uuid PRIMARY KEY DEFAULT anon.uuid_generate_v4() NOT NULL,
    name         text                                             NOT NULL UNIQUE,
    description  text,
    price        numeric                                          NOT NULL,
    rating       numeric,
    rating_votes int,
    category_id  uuid REFERENCES categories (id)                  NOT NULL
);