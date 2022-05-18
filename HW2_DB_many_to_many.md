### ERD for musuc database

![merd drawio](https://user-images.githubusercontent.com/95244436/169039402-a54f3e91-0e1e-4eba-949d-68c1392dce03.png)



### SQL commands to create main relations

***

    CREATE TABLE IF NOT EXISTS artists(  
        artist_id SERIAL PRIMARY KEY,  
        first_name VARCHAR(64) NOT NULL,  
        last_name VARCHAR(64) NOT NULL,  
        stage_name VARCHAR(64));  

***

    CREATE TABLE IF NOT EXISTS artists_info(  
	    artist_id INTEGER PRIMARY KEY REFERENCES artists(artist_id),  
	    birthday DATE,  
	    description TEXT,  
	    url_page VARCHAR(255));  

***
    
    CREATE TABLE IF NOT EXISTS genres(  
        genre_id SERIAL PRIMARY KEY,  
        genre_name VARCHAR(64),  
        description TEXT);  

***

    CREATE TABLE IF NOT EXISTS artists_genres(  
        genre_id INTEGER REFERENCES genres(genre_id),  
        artist_id INTEGER REFERENCES artists(artist_id),  
        CONSTRAINT ag PRIMARY KEY (genre_id, artist_id));  

***

    CREATE TABLE IF NOT EXISTS albums(  
        album_id SERIAL PRIMARY KEY,  
        album_name VARCHAR(64),  
        release_year INTEGER);  

***

    CREATE TABLE IF NOT EXISTS artists_albums(  
        album_id INTEGER REFERENCES albums(album_id),  
        artist_id INTEGER REFERENCES artists(artist_id),  
        CONSTRAINT aa PRIMARY KEY (album_id, artist_id));  

***

    CREATE TABLE IF NOT EXISTS tracks(  
        track_id SERIAL PRIMARY KEY,  
        album_id INTEGER REFERENCES albums(album_id),  
        track_name VARCHAR(64),  
        track_number SMALLINT,  
        playtime INTERVAL MINUTE TO SECOND);  

***
