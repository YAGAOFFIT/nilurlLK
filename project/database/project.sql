-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 09 2023 г., 02:04
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `mail`
--

CREATE TABLE `mail` (
  `id` varchar(30) NOT NULL,
  `type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'resetPswd',
  `expiresTime` datetime(6) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `userId` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `mail`
--

INSERT INTO `mail` (`id`, `type`, `expiresTime`, `code`, `userId`) VALUES
('0', '0', NULL, '0', '0'),
('1', 'newPswd', NULL, 'SLIMLXgv', 'user1696803664230'),
('2', 'newPswd', NULL, 'lcqSytcH', 'user1696805539757');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `userId` varchar(30) NOT NULL,
  `username` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` char(40) NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`userId`, `username`, `email`, `password`) VALUES
('', '', '', ''),
('user1696803249222', 'ыавыа', 'fdsfds@gmail.com', '$2y$10$Jrw2ddAtHnReVsxtEvjnrecZkYeiqtH2MyGYioucEzd0xvw34gsN.'),
('user1696803589697', 'dsadasd', 'wlad2axz1sahgdfa@gmail.com', '$2y$10$9SqLpNz9mIvT2Gg64.TtYuvJ5pMirDJ5aH7p6S7i8Fk9IYEN9sfnK'),
('user1696803664230', 'wdaaaa', 'wdsazz1alad21sahgdfa@gmail.com', '$2y$10$wunZIg1ZsZONNwpeIeTv3eK7ymwFPNo59PDBfyk54BB5tqIlRaniy'),
('user1696805539757', 'zcxzzz', 'dsad@mail.ru', '$2y$10$CHRn24Rsj9LAzNqcFfIRXegg7IUp1VcCD/lFf4tpzxIe854P4WKQK');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
