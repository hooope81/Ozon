Задание 7

--Создать два представления, в основе которых лежат сложные запросы.

--Представление для отображения информации о продавцах и об их товарах
--которые зарегистрировались в течение года

CREATE VIEW sellers_added_last_year AS
SELECT
    sellers.id AS id_seller,
    sellers.name AS seller,
    products.id AS id_product,
    products.name AS product
    FROM sellers
            JOIN products
                ON sellers.id = products.seller_id
    WHERE sellers.created_at > (current_timestamp - interval '1 year');

--Представление, показывающее пользователей,
--не сделавших ни одного заказа.
--Данный запрос может быть полезен для стимулирования продаж

CREATE VIEW users_without_orders AS
SELECT users.id, users.first_name, users.last_name
	FROM users
		LEFT JOIN orders
			ON users.id = orders.user_id
	WHERE orders.id IS NULL;
