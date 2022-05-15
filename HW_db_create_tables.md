### ER diagram for music db

artists { id, first_name, last_name, stage_name, birthday }

genres { id, name, description }

albums { id, name, **artist_id (foreign key)**, release_date, **genre_id (foreign key)**, picture_url }

tracks { id, **album_id (foreign key)**, number, name, playtime, lyrics }


### SQL commands to create main tables

CREATE TABLE IF NOT EXISTS artists (
             id SERIAL PRIMARY KEY,
             first_name VARCHAR(64) NOT NULL,
             last_name VARCHAR(64) NOT NULL,
             stage_name VARCHAR(64) NOT NULL,
             birtday DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
            id SERIAL PRIMARY KEY,
            name VARCHAR(64) NOT NULL,
            description TEXT
);

CREATE TABLE IF NOT EXISTS (
    
)

