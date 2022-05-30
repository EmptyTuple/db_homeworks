
-- 1. Количество исполнителей в каждом жанре
SELECT g.genre_name, count(ar.stage_name)
FROM genres AS g
LEFT JOIN artists_genres AS ag ON g.genre_id = ag.genre_id
LEFT JOIN artists AS ar ON ag.artist_id = ar.artist_id
GROUP BY g.genre_name
ORDER BY count(ar.artist_id) DESC
;

-- 2. Количество треков, вошедших в альбомы 1995-2000 годов
SELECT t.track_name, al.release_year
FROM albums AS al
LEFT JOIN tracks AS t ON al.album_id = t.album_id
WHERE (al.release_year >= 1995) AND (al.release_year <= 2000)
;

-- 3. Cредняя продолжительность треков по каждому альбому
SELECT al.album_name, AVG(t.playtime) AS average_playtime
FROM albums AS al
LEFT JOIN tracks AS t ON al.album_id = t.album_id
GROUP BY al.album_name 
ORDER BY AVG(t.playtime)
;

-- 4. Все исполнители, которые не выпустили альбомы в 2000 году
SELECT DISTINCT ar.stage_name
FROM artists as ar
WHERE ar.stage_name NOT IN (
    SELECT ar.stage_name
    FROM artists AS ar
    LEFT JOIN artists_albums AS aa ON ar.artist_id = aa.artist_id
    LEFT JOIN albums as al on aa.album_id = al.album_id
    WHERE al.release_year = 2000
)
ORDER BY ar.stage_name
;

-- 5. Названия сборников, в которых присутствует конкретный исполнитель: first_name = James

SELECT DISTINCT c.collection_name
FROM collections AS c
LEFT JOIN tracks_collections AS tc ON c.collection_id = tc.collection_id
LEFT JOIN tracks AS t ON t.track_id = tc.track_id
LEFT JOIN albums AS al ON t.album_id = al.album_id
LEFT JOIN artists_albums AS aa ON al.album_id = aa.album_id
LEFT JOIN artists AS ar ON aa.artist_id = ar.artist_id
WHERE ar.first_name LIKE '%%James%%'
ORDER BY c.collection_name
;

-- 6. Название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT al.album_name
FROM albums AS al
LEFT JOIN artists_albums AS aa ON al.album_id = aa.album_id
LEFT JOIN artists AS ar ON aa.artist_id = ar.artist_id
LEFT JOIN artists_genres AS ag ON ar.artist_id = ag.artist_id
LEFT JOIN genres AS g ON ag.genre_id = g.genre_id
GROUP BY al.album_name
HAVING count(DISTINCT g.genre_name) > 1
ORDER BY al.album_name
;

-- 7. Названия треков, которые не входят в сборники
SELECT t.track_name
FROM tracks AS t
LEFT JOIN tracks_collections AS tc ON t.track_id = tc.track_id
WHERE tc.track_id is NULL
;

-- 8. Исполнитель, написавший самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT ar.stage_name, t.playtime
FROM tracks AS t
LEFT JOIN albums AS al ON t.album_id = al.album_id
LEFT JOIN artists_albums AS aa ON al.album_id = aa.album_id
LEFT JOIN artists AS ar ON aa.artist_id = ar.artist_id
GROUP BY ar.stage_name, t.playtime
HAVING t.playtime = (SELECT MIN(playtime) FROM tracks)
ORDER BY ar.stage_name
;

-- 9. Название альбомов, содержащих наименьшее количество треков
SELECT DISTINCT al.album_name
FROM albums AS al
LEFT JOIN tracks AS t ON al.album_id = t.album_id
WHERE t.album_id IN (
    SELECT album_id FROM tracks
    GROUP BY album_id
    HAVING COUNT(track_id) = (
        SELECT COUNT(track_id)
        FROM tracks
        GROUP BY album_id
        ORDER BY count
        LIMIT 1
    )
)
ORDER BY al.album_name
;