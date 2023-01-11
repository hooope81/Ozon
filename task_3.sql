Задание 3

--Создание внешних ключей

--Таблица профилей

ALTER TABLE profiles
ADD CONSTRAINT profiles_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

--Таблица товаров

ALTER TABLE products
ADD CONSTRAINT products_category_id_fk
FOREIGN KEY (category_id)
REFERENCES categories (id);

ALTER TABLE products
ADD CONSTRAINT products_seller_id_fk
FOREIGN KEY (seller_id)
REFERENCES sellers (id);

ALTER TABLE products
ADD CONSTRAINT products_photo_id_fk
FOREIGN KEY (photo_id)
REFERENCES photo (id);

--Таблица скидок

ALTER TABLE discounts
ADD CONSTRAINT discounts_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Таблица для избранных товаров и товаров в корзине

ALTER TABLE favorites_and_cart
ADD CONSTRAINT favorites_and_cart_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE favorites_and_cart
ADD CONSTRAINT favorites_and_cart_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Таблица заказов

ALTER TABLE orders
ADD CONSTRAINT orders_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE orders
ADD CONSTRAINT orders_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE orders
ADD CONSTRAINT orders_payment_id_fk
FOREIGN KEY (payment_id)
REFERENCES payment (id);

ALTER TABLE orders
ADD CONSTRAINT orders_receipt_of_order_id_fk
FOREIGN KEY (receipt_of_order_id)
REFERENCES receipt_of_order (id);

ALTER TABLE orders
ADD CONSTRAINT orders_discount_id_fk
FOREIGN KEY (discount_id)
REFERENCES discounts (id);

ALTER TABLE orders
ADD CONSTRAINT orders_storage_area_id_fk
FOREIGN KEY (storage_area_id)
REFERENCES storage_area (id);

--Таблица для определения наличия товара на складе

ALTER TABLE products_storage_area
ADD CONSTRAINT products_storage_area_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE products_storage_area
ADD CONSTRAINT products_storage_area_storage_area_id_fk
FOREIGN KEY (storage_area_id)
REFERENCES storage_area (id);

--Таблица фотографий

ALTER TABLE photo
ADD CONSTRAINT photo_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE photo
ADD CONSTRAINT photo_role_id_fk
FOREIGN KEY (role_id)
REFERENCES roles (id);

ALTER TABLE photo
ADD CONSTRAINT photo_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE photo
ADD CONSTRAINT photo_seller_id_fk
FOREIGN KEY (seller_id)
REFERENCES sellers (id);

--Таблица видео

LTER TABLE video
ADD CONSTRAINT video_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE video
ADD CONSTRAINT video_role_id_fk
FOREIGN KEY (role_id)
REFERENCES roles (id);

ALTER TABLE video
ADD CONSTRAINT video_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE video
ADD CONSTRAINT video_seller_id_fk
FOREIGN KEY (seller_id)
REFERENCES sellers (id);

--Таблица отзывов

ALTER TABLE reviews
ADD CONSTRAINT reviews_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE reviews
ADD CONSTRAINT reviews_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Таблица комментариев к отзывам

ALTER TABLE comments
ADD CONSTRAINT comments_review_id_fk
FOREIGN KEY (review_id)
REFERENCES reviews (id);

ALTER TABLE comments
ADD CONSTRAINT comments_role_id_fk
FOREIGN KEY (role_id)
REFERENCES roles (id);

ALTER TABLE comments
ADD CONSTRAINT comments_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE comments
ADD CONSTRAINT comments_seller_id_fk
FOREIGN KEY (seller_id)
REFERENCES sellers (id);

--Таблица лайков

ALTER TABLE likes
ADD CONSTRAINT likes_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);




































