use amigos;

select *
from users;
select *
from friendships;

SELECT u.first_name AS primer_nombre_usuario, u.last_name AS apellido_usuario,
       f.first_name AS primer_nombre_amigo, f.last_name AS apellido_amigo
FROM users u
JOIN friendships fs ON u.id = fs.user_id
JOIN users f ON fs.friend_id = f.id;


/*1*/
SELECT u.first_name AS nombre, u.last_name AS apellido
FROM users u
JOIN friendships fs ON u.id = fs.user_id
JOIN users f ON fs.friend_id = f.id
WHERE f.first_name = 'Kermit' AND f.last_name = 'The Frog';


/*2*/
SELECT COUNT(*) AS total_amistades
FROM friendships;

/*3*/
SELECT u.first_name, u.last_name, COUNT(*) AS total_amigos
FROM users u
JOIN friendships fs ON u.id = fs.user_id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_amigos DESC
LIMIT 1;

/*4*/
-- Añade un nuevo usuario
INSERT INTO users (id, first_name, last_name, created_at) 
VALUES ('6', 'Dave', 'Miller', NOW());

INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('7', '6', '2', NOW());
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('8', '6', '4', NOW());
INSERT INTO friendships (id, user_id, friend_id, created_at) VALUES ('9', '6', '5', NOW());

/*5*/
SELECT first_name, last_name
FROM users u
JOIN friendships fs ON u.id = fs.friend_id
WHERE fs.user_id = 2
ORDER BY first_name, last_name;

/*6*/
DELETE FROM friendships WHERE (id = 5);  

/*7*/
SELECT u1.first_name AS nombre_usuario, u1.last_name AS apellido_usuario,
       u2.first_name AS nombre_amigo, u2.last_name AS apellido_amigo
FROM friendships fs
JOIN users u1 ON fs.user_id = u1.id
JOIN users u2 ON fs.friend_id = u2.id;




