Задание 10

--Для одного из запросов, созданных в пункте 6, провести оптимизацию.

--План выполнения запроса до оптимизации

EXPLAIN ANALYZE SELECT DISTINCT
	products.id AS product_id,
	products.name,
	ROUND(AVG(product_evaluation) OVER(PARTITION BY products.id),2) AS average_product_evaluation
	FROM products
		LEFT JOIN reviews
			ON products.id = reviews.product_id
WHERE products.name = 'Tea';

"Unique  (cost=138.64..138.65 rows=1 width=49) (actual time=0.426..0.428 rows=1 loops=1)"
"  ->  Sort  (cost=138.64..138.65 rows=1 width=49) (actual time=0.425..0.427 rows=1 loops=1)"
"        Sort Key: products.id, (round(avg(reviews.product_evaluation) OVER (?), 2))"
"        Sort Method: quicksort  Memory: 25kB"
"        ->  WindowAgg  (cost=138.61..138.63 rows=1 width=49) (actual time=0.414..0.416 rows=1 loops=1)"
"              ->  Sort  (cost=138.61..138.61 rows=1 width=21) (actual time=0.401..0.402 rows=1 loops=1)"
"                    Sort Key: products.id"
"                    Sort Method: quicksort  Memory: 25kB"
"                    ->  Hash Right Join  (cost=55.28..138.60 rows=1 width=21) (actual time=0.252..0.398 rows=1 loops=1)"
"                          Hash Cond: (reviews.product_id = products.id)"
"                          ->  Seq Scan on reviews  (cost=0.00..82.00 rows=500 width=8) (actual time=0.006..0.133 rows=500 loops=1)"
"                          ->  Hash  (cost=55.26..55.26 rows=1 width=17) (actual time=0.209..0.210 rows=1 loops=1)"
"                                Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"                                ->  Seq Scan on products  (cost=0.00..55.26 rows=1 width=17) (actual time=0.011..0.205 rows=1 loops=1)"
"                                      Filter: ((name)::text = 'Tea'::text)"
"                                      Rows Removed by Filter: 500"
"Planning Time: 0.326 ms"
"Execution Time: 0.495 ms"

--Поиск товара по его наименованию является частым запросом в интернет-магазинах,
--поэтому было принято решение в качестве оптимизации создать индекс на столбец "name" в таблице "products"

CREATE INDEX products_name_idx ON products (name);

--В результате поиск по таблице products при использовании созданного индекса произойдет быстрее,
--чем при ее последовательном сканировании

"Unique  (cost=87.54..87.55 rows=1 width=49) (actual time=0.250..0.252 rows=1 loops=1)"
"  ->  Sort  (cost=87.54..87.55 rows=1 width=49) (actual time=0.250..0.251 rows=1 loops=1)"
"        Sort Key: products.id, (round(avg(reviews.product_evaluation) OVER (?), 2))"
"        Sort Method: quicksort  Memory: 25kB"
"        ->  WindowAgg  (cost=87.51..87.53 rows=1 width=49) (actual time=0.237..0.239 rows=1 loops=1)"
"              ->  Sort  (cost=87.51..87.52 rows=1 width=21) (actual time=0.218..0.219 rows=1 loops=1)"
"                    Sort Key: products.id"
"                    Sort Method: quicksort  Memory: 25kB"
"                    ->  Hash Right Join  (cost=4.18..87.50 rows=1 width=21) (actual time=0.067..0.215 rows=1 loops=1)"
"                          Hash Cond: (reviews.product_id = products.id)"
"                          ->  Seq Scan on reviews  (cost=0.00..82.00 rows=500 width=8) (actual time=0.008..0.135 rows=500 loops=1)"
"                          ->  Hash  (cost=4.17..4.17 rows=1 width=17) (actual time=0.028..0.028 rows=1 loops=1)"
"                                Buckets: 1024  Batches: 1  Memory Usage: 9kB"
"                                ->  Index Scan using products_name_idx on products  (cost=0.15..4.17 rows=1 width=17) (actual time=0.020..0.021 rows=1 loops=1)"
"                                      Index Cond: ((name)::text = 'Tea'::text)"
"Planning Time: 0.291 ms"
"Execution Time: 0.310 ms"


