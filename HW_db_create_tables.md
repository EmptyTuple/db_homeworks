### ER diagram for music db

artists { id, **genre_id (foreign key)**, first_name, last_name, stage_name, birthday }

genres { id, name, description }

albums { id, name, **artist_id (foreign key)**, release_date, picture_url }

tracks { id, **album_id (foreign key)**, number, name, playtime, lyrics }


### SQL commands to create main relations

***

    CREATE TABLE IF NOT EXISTS artists (  
                 id SERIAL PRIMARY KEY,  
                 genre_id INTEGER REFERENCES genres(id),  
                 first_name VARCHAR(64) NOT NULL,  
                 last_name VARCHAR(64) NOT NULL,  
                 stage_name VARCHAR(64) NOT NULL,  
                 birthday DATE NOT NULL  
    );  

***

    CREATE TABLE IF NOT EXISTS genres (  
                id SERIAL PRIMARY KEY,  
                name VARCHAR(64) NOT NULL,  
                description TEXT  
    );  

***

    CREATE TABLE IF NOT EXISTS albums (  
                 id SERIAL PRIMARY KEY,  
                 name VARCHAR(64) NOT NULL,  
                 artist_id INTEGER REFERENCES artists(id),  
                 release_date DATE NOT NULL,    
                 picture_url VARCHAR(255)  
    );  

***

    CREATE TABLE IF NOT EXISTS tracks (  
                 id SERIAL PRIMARY KEY,  
                 album_id INTEGER REFERENCES albums(id),  
                 number SMALLINT NOT NULL,  
                 name VARCHAR(64) NOT NULL,  
                 playtime INTERVAL MINUTE TO SECOND NOT NULL,  
                 lyrics TEXT  
    );  