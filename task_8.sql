Задание 8

--Создать пользовательскую функцию.

--Функция для подсчета лайков и дизлайков конкретного пользователя

CREATE TYPE likes_sum AS (likes INT, dislikes INT);

CREATE FUNCTION likes_sum_by_user_id(user_likes INT)
RETURNS likes_sum AS
$$
SELECT
COUNT(DISTINCT lk.id),
COUNT(DISTINCT dlk.id)
FROM users
LEFT JOIN likes lk
ON lk.user_id = users.id AND lk.is_like = true
LEFT JOIN likes dlk
ON dlk.user_id = users.id AND dlk.is_like = false
WHERE users.id = user_likes;
$$
LANGUAGE SQL;
