create table if not exists photo (
    id uuid default random_uuid() not null,
    name varchar(255),
    title varchar(255),
    description varchar(255),
    content blob,
    content_type varchar(255),
    filename varchar(255),
    daytime varchar(255),
    primary key (id)
);
create table if not exists attachment (
    id bigint generated by default as identity,
    name varchar(255),
    commentbody varchar(255),
    photo_id bigint,
    primary key (id),
    foreign key (photo_id) references photo
);

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
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