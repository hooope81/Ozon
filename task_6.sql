
Задание 6

--Создать два сложных запроса с использованием объединения JOIN и без использования подзапросов.

--Запрос для поиска товара по его названию,
--выводится не только товар, но и его средний рейтинг на основании отзывов покупателей

SELECT DISTINCT
	products.id AS product_id,
	products.name,
	ROUND(AVG(product_evaluation) OVER(PARTITION BY products.id),2) AS average_product_evaluation
	FROM products
		LEFT JOIN reviews
			ON products.id = reviews.product_id
WHERE products.name = 'Tea';

--Запрос для подсчета итоговой суммы заказа с учетом скидки

WITH sum_order AS(
SELECT DISTINCT
	orders.order_number,
	orders.product_id,
	products.price,
	orders.quantity,
	CASE WHEN (discounts.sum IS NULL) THEN 0
			ELSE discounts.sum
	END AS discount
	FROM orders
		JOIN products
			ON orders.product_id = products.id
		LEFT JOIN discounts
			ON orders.discount_id = discounts.id)
SELECT DISTINCT
	order_number,
	SUM((price - discount) * quantity)
		OVER(PARTITION BY order_number) AS total_sum
	FROM sum_order
WHERE order_number = 65;
