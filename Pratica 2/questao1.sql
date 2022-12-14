SELECT users.id, users.name, cities.name AS "city"
FROM users
ON users."cityId" = cities.id;