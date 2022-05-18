### ERD for musuc database

![merd drawio](https://user-images.githubusercontent.com/95244436/169039402-a54f3e91-0e1e-4eba-949d-68c1392dce03.png)



### SQL commands to create main relations

CREATE TABLE IF NOT EXISTS artists(  
	artist_id SERIAL PRIMARY KEY,  
	first_name VARCHAR(64) NOT NULL,  
	last_name VARCHAR(64) NOT NULL,  
	stage_name VARCHAR(64));  

