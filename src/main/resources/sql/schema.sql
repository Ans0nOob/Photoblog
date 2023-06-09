DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS image;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
);
CREATE TABLE IF NOT EXISTS user_roles (
    user_role_id INTEGER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);
CREATE TABLE IF NOT EXISTS image (
    image_id INTEGER GENERATED ALWAYS AS IDENTITY,
    filename VARCHAR(50) NOT NULL,
    data BLOB,
    username VARCHAR(50) NOT NULL,
    PRIMARY KEY (image_id)
);