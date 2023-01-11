Задание 9

--Создать триггер.

--Данный триггер срабатывает при изменении записи в таблице лайков.
--Если лайк/дизлайк был поставлен, и приходит изменение на данную строку, то
--в колонке "is_like" проставляется NULL,
--так как при нажатии на кнопку в приложении пользователь может
--либо поставить лайк/дизлайк, либо убрать его

CREATE OR REPLACE FUNCTION check_likes_trigger()
RETURNS TRIGGER AS
$$
DECLARE user_like bool;
BEGIN
	user_like :=(SELECT is_like FROM likes WHERE likes.id = NEW.id);
	IF user_like IS NOT NULL THEN
		NEW.is_like := NULL;
	END IF;
	RETURN NEW;
END
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER likes_trigger BEFORE UPDATE ON likes
FOR EACH ROW
EXECUTE FUNCTION check_likes_trigger();
