-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 29 2020 г., 08:51
-- Версия сервера: 5.7.30-0ubuntu0.18.04.1
-- Версия PHP: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_mvc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `image` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `text`, `date`, `image`) VALUES
(1, 1, '123', '2020-06-27 16:24:12', ''),
(4, 8, '1234', '2020-06-28 03:30:05', ''),
(5, 8, 'privet', '2020-06-28 03:30:57', ''),
(6, 2, 'vsem privet', '2020-06-28 03:39:31', ''),
(9, 2, 'ghbd', '2020-06-28 03:47:06', ''),
(11, 2, '12324', '2020-06-28 03:49:51', ''),
(12, 20, 'qwerty', '2020-06-28 05:59:41', ''),
(13, 21, 'ku-ku luzeryi', '2020-06-28 07:46:58', ''),
(15, 21, 'uty', '2020-06-28 07:50:24', ''),
(29, 1, 'ret', '2020-06-29 05:16:45', ''),
(30, 1, 'photo', '2020-06-29 05:19:23', ''),
(32, 1, 'Ð¿Ñ€Ð¸', '2020-06-29 05:24:05', ''),
(33, 1, 'ÐºÑƒÐºÑƒ', '2020-06-29 05:37:35', ''),
(34, 1, 'Ð¿Ñ€Ð¸Ð²ÐµÑ‚', '2020-06-29 05:47:55', ''),
(35, 1, 'Ð²Ð¾Ð¿Ñ€Ð¾Ñ', '2020-06-29 08:38:20', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'dima', 'uglenpish@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-25 00:00:00'),
(2, 'vova', 'uglenpish1@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-26 00:00:00'),
(3, 'vasya', 'uglenpish2@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-26 00:00:00'),
(4, 'dima', 'uglenpish3@rambler.ru', 'd2c37b42f3905ac9e394de138c40c187c2fcfdf3', '2020-06-26 00:00:00'),
(8, 'nina', 'uglenpish4@rambler.ru', 'd2c37b42f3905ac9e394de138c40c187c2fcfdf3', '2020-06-27 00:00:00'),
(10, 'tom', 'uglenpish5@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-27 00:00:00'),
(13, 'tom2', 'uglenpish6@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-27 00:00:00'),
(16, 'tom3', 'uglenpish7@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-27 15:35:35'),
(19, 'dima', 'uglenpish11@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-28 05:03:55'),
(20, 'dima1', 'uglenpish10@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-28 05:59:29'),
(21, 'dina', 'uglenpish9@rambler.ru', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2020-06-28 07:45:40');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_uindex` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
