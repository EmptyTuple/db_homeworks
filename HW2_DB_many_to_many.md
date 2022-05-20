## Task 1. Music database creating.

### ERD for musuc database.

![merd drawio](https://user-images.githubusercontent.com/95244436/169039402-a54f3e91-0e1e-4eba-949d-68c1392dce03.png)



### SQL commands to create main relations.

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
        genre_name VARCHAR(64) NOT NULL,  
        description TEXT);  

***

    CREATE TABLE IF NOT EXISTS artists_genres(  
        genre_id INTEGER REFERENCES genres(genre_id),  
        artist_id INTEGER REFERENCES artists(artist_id),  
        CONSTRAINT ag PRIMARY KEY (genre_id, artist_id));  

***

    CREATE TABLE IF NOT EXISTS albums(  
        album_id SERIAL PRIMARY KEY,  
        album_name VARCHAR(64) NOT NULL,   
        release_year INTEGER NOT NULL);  

***

    CREATE TABLE IF NOT EXISTS artists_albums(  
        album_id INTEGER REFERENCES albums(album_id),  
        artist_id INTEGER REFERENCES artists(artist_id),  
        CONSTRAINT aa PRIMARY KEY (album_id, artist_id));  

***

    CREATE TABLE IF NOT EXISTS tracks(  
        track_id SERIAL PRIMARY KEY,  
        album_id INTEGER REFERENCES albums(album_id),  
        track_name VARCHAR(64) NOT NULL,   
        track_number SMALLINT NOT NULL,  
        playtime INTERVAL MINUTE TO SECOND NOT NULL);  

***

    CREATE TABLE IF NOT EXISTS collections(  
        collection_id SERIAL PRIMARY KEY,  
        collection_name VARCHAR(64) NOT NULL,  
        release_year INTEGER);  

***

    CREATE TABLE IF NOT EXISTS tracks_collections(  
        collection_id INTEGER REFERENCES collections(collection_id),  
        track_id INTEGER REFERENCES tracks(track_id),  
        CONSTRAINT ct PRIMARY KEY (collection_id, track_id));  

***

## Task 2: Employees, deparments, managers.

Consider this case where I'm trying to model a database for a company:<br>
- Entities: employees, departments, managers.
- An employee works in only 1 department while a department may have many Employees working in it.
- A manager may manage only 1 department and similarly a department may have only 1 manager.
- A manager supervises many employees, but an employee is only supervised by one manager.
 
 ### ERD for the task 2.
 
 ![111 drawio](https://user-images.githubusercontent.com/95244436/169483762-206e86d0-31d0-48f0-bd43-d0834bc9ee13.png)

### SQL commands to create main relations.
 
 
