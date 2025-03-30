-- Задача 2
-- Условие

-- Найти информацию о производителях и моделях различных типов транспортных средств (автомобили, мотоциклы и велосипеды), которые соответствуют заданным критериям.

-- Автомобили:
-- Извлечь данные о всех автомобилях, которые имеют:

-- Мощность двигателя более 150 лошадиных сил.
-- Объем двигателя менее 3 литров.
-- Цену менее 35 тысяч долларов.
-- В выводе должны быть указаны производитель (maker), номер модели (model), мощность (horsepower), 
-- объем двигателя (engine_capacity) и тип транспортного средства, который будет обозначен как Car.

-- Мотоциклы:
-- Извлечь данные о всех мотоциклах, которые имеют:

-- Мощность двигателя более 150 лошадиных сил.
-- Объем двигателя менее 1,5 литров.
-- Цену менее 20 тысяч долларов.
-- В выводе должны быть указаны производитель (maker), номер модели (model), 
-- мощность (horsepower), объем двигателя (engine_capacity) и тип транспортного средства, который будет обозначен как Motorcycle.

-- Велосипеды:
-- Извлечь данные обо всех велосипедах, которые имеют:

-- Количество передач больше 18.
-- Цену менее 4 тысяч долларов.
-- В выводе должны быть указаны производитель (maker), номер модели (model), а также NULL для мощности и объема двигателя, 
-- так как эти характеристики не применимы для велосипедов. Тип транспортного средства будет обозначен как Bicycle.

-- Сортировка:
-- Результаты должны быть объединены в один набор данных и отсортированы по мощности в порядке убывания. 
-- Для велосипедов, у которых нет значения мощности, они будут располагаться внизу списка.

SELECT maker, vehicle.model, horsepower, engine_capacity, vehicle.type as vehicle_type
FROM vehicle INNER JOIN  (
	SELECT model, horsepower, engine_capacity
		FROM car
		WHERE horsepower > 150
			AND engine_capacity < 3
			AND price < 35000
		UNION SELECT model, horsepower, engine_capacity
			FROM motorcycle
			WHERE horsepower > 150
				AND engine_capacity < 1.5
				AND price < 20000
		UNION SELECT model, NULL as horsepower, NULL as engine_capacity
			FROM bicycle
			WHERE gear_count > 18
				AND price < 4000
	) AS sorted
	ON (vehicle.model=sorted.model)
ORDER BY horsepower DESC NULLS LAST;


