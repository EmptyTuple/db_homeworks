import sqlalchemy
from sqlalchemy import create_engine
from pprint import pprint

engine = create_engine("postgresql://postgres:12345@localhost/music", echo=True)


conn = engine.connect()

# select albums released in 1996:
query_albums_1996 = conn.execute(
    '''SELECT album_name, release_year FROM albums
       WHERE release_year = 1996;
    ''').fetchall()
print(query_albums_1996)

# select name and playtime for the longest track:
query_longest_track = conn.execute(
    ''' SELECT track_name, playtime FROM tracks
        WHERE playtime = (SELECT MAX(playtime) FROM tracks);
    ''').fetchone()
print(query_longest_track)

# select tracks with playtime great than 3.5 minutes only:
query_tracks_by_playtime = conn.execute(
    ''' SELECT track_name FROM tracks
        WHERE playtime >= INTERVAL '210' second;
    ''').fetchall()
pprint(query_tracks_by_playtime)

# select collections released between 2018-2020:
query_collections_between = conn.execute(
    ''' SELECT collection_name FROM collections
        WHERE release_year BETWEEN 2018 AND 2020;
    ''').fetchall()
print(query_collections_between)

# select tracks than contain the word "my" in the name only:
query_contains_my = conn.execute(
    ''' SELECT track_name FROM tracks
        WHERE track_name LIKE '%%My%%';
    ''').fetchall()
pprint(query_contains_my)

# select artists with a single word stage name only:
query_single_word_name = conn.execute(
    ''' SELECT first_name, last_name, stage_name FROM artists
        WHERE stage_name NOT LIKE '%% %%';
    ''').fetchall()
pprint(query_single_word_name)

conn.close()





