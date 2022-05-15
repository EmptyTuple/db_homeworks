### ER diagram for music db

artists { id, first_name, last_name, stage_name, birthday }\n
genres { id, name, description }\n
albums { id, name, **artist_id (foreign key)**, release_date, **genre_id (foreign key)**, picture_url }\n
tracks { id, **album_id (foreign key)**, number, name, playtime, lyrics }\n

### SQL commands to create main tables


