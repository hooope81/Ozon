Задание 5

--Создать два сложных (многотабличных) запроса с использованием подзапросов.

--Запрос, показывающий пользователей,
--которые написали более трех комментариев в отзывах о товарах.
--Данный запрос может быть применен,
--если используется система поощрения пользователей за оставленные отзывы.
--Данный запрос содержит коррелирующий подзапрос.

SELECT
	user_id,
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id =
		reviews.user_id) AS user,
	COUNT(comment) AS quantity_comments
	FROM reviews
		GROUP BY user_id
			HAVING COUNT(comment) > 3;

--Запрос, который может использоваться для изучения спроса на товары в конкретном городе.

SELECT
	product_id,
	SUM(quantity) AS quantity
	FROM orders
	WHERE user_id =
		(SELECT user_id FROM profiles WHERE town = 'Awaran')
	GROUP BY product_id
	HAVING SUM(quantity) > 10
	ORDER BY quantity;
