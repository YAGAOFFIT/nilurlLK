-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 06 2023 г., 08:31
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
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `superadmin` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `email_other` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `token_validity` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Virtual Admins';

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`username`, `password`, `created`, `modified`, `active`, `superadmin`, `phone`, `email_other`, `token`, `token_validity`) VALUES
('admin@nilurl.ru', '$1$c9809462$xvIE4gnfIBjXnDGuO0T7s0', '2023-10-17 10:07:20', '2023-10-17 10:07:20', 1, 1, '', '', '', '2023-10-17 10:07:20');

-- --------------------------------------------------------

--
-- Структура таблицы `alias`
--

CREATE TABLE `alias` (
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `goto` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Virtual Aliases';

--
-- Дамп данных таблицы `alias`
--

INSERT INTO `alias` (`address`, `goto`, `domain`, `created`, `modified`, `active`) VALUES
('abuse@nilurl.ru', 'root@nilurl.ru', 'nilurl.ru', '2023-10-17 10:10:24', '2023-10-17 10:10:24', 1),
('all_in@nilurl.ru', 'all_in@nilurl.ru', 'nilurl.ru', '2023-10-17 11:17:35', '2023-10-18 20:24:40', 1),
('all_out@nilurl.ru', 'all_out@nilurl.ru', 'nilurl.ru', '2023-10-17 11:18:25', '2023-10-17 11:18:25', 1),
('hostmaster@nilurl.ru', 'root@nilurl.ru', 'nilurl.ru', '2023-10-17 10:10:24', '2023-10-17 10:10:24', 1),
('postmaster@nilurl.ru', 'root@nilurl.ru', 'nilurl.ru', '2023-10-17 10:10:24', '2023-10-17 10:10:24', 1),
('webmaster@nilurl.ru', 'root@nilurl.ru', 'nilurl.ru', '2023-10-17 10:10:24', '2023-10-17 10:10:24', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `alias_domain`
--

CREATE TABLE `alias_domain` (
  `alias_domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `target_domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Domain Aliases';

-- --------------------------------------------------------

--
-- Структура таблицы `config`
--

CREATE TABLE `config` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `value` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci COMMENT='PostfixAdmin settings';

--
-- Дамп данных таблицы `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'version', '1847');

-- --------------------------------------------------------

--
-- Структура таблицы `domain`
--

CREATE TABLE `domain` (
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `aliases` int NOT NULL DEFAULT '0',
  `mailboxes` int NOT NULL DEFAULT '0',
  `maxquota` bigint NOT NULL DEFAULT '0',
  `quota` bigint NOT NULL DEFAULT '0',
  `transport` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `backupmx` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `password_expiry` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Virtual Domains';

--
-- Дамп данных таблицы `domain`
--

INSERT INTO `domain` (`domain`, `description`, `aliases`, `mailboxes`, `maxquota`, `quota`, `transport`, `backupmx`, `created`, `modified`, `active`, `password_expiry`) VALUES
('ALL', '', 0, 0, 0, 0, '', 0, '2023-10-17 10:06:11', '2023-10-17 10:06:11', 1, 0),
('nilurl.ru', '', 0, 0, 10, 2048, 'virtual', 0, '2023-10-17 10:10:24', '2023-10-17 10:10:24', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `domain_admins`
--

CREATE TABLE `domain_admins` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Domain Admins';

--
-- Дамп данных таблицы `domain_admins`
--

INSERT INTO `domain_admins` (`username`, `domain`, `created`, `active`, `id`) VALUES
('admin@nilurl.ru', 'ALL', '2023-10-17 10:07:20', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fetchmail`
--

CREATE TABLE `fetchmail` (
  `id` int UNSIGNED NOT NULL,
  `mailbox` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `src_server` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `src_auth` enum('password','kerberos_v5','kerberos','kerberos_v4','gssapi','cram-md5','otp','ntlm','msn','ssh','any') CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `src_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `src_password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `src_folder` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poll_time` int UNSIGNED NOT NULL DEFAULT '10',
  `fetchall` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `keep` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `protocol` enum('POP3','IMAP','POP2','ETRN','AUTO') CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `usessl` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `extra_options` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `returned_text` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `mda` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT '1999-12-31 21:00:00',
  `sslcertck` tinyint(1) NOT NULL DEFAULT '0',
  `sslcertpath` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `sslfingerprint` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '1999-12-31 21:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_port` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `link`
--

CREATE TABLE `link` (
  `id` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_520_ci NOT NULL,
  `userId` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `title` text CHARACTER SET utf32 COLLATE utf32_unicode_520_ci,
  `desc_` text CHARACTER SET utf32 COLLATE utf32_unicode_520_ci,
  `longUrl` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `shortUrl` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `clicks` int DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `createdAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci;

--
-- Дамп данных таблицы `link`
--

INSERT INTO `link` (`id`, `userId`, `title`, `desc_`, `longUrl`, `shortUrl`, `clicks`, `meta`, `createdAt`) VALUES
('0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1', 'user1697172435488', NULL, NULL, 'https://chat.openai.com/c/04f08a57-fb8c-47a9-9acd-403c90144567', 'http://nilurl.ru/cLD5No', NULL, NULL, NULL),
('2', 'user1697172435488', NULL, NULL, 'https://www.php.net/manual/ru/function.session-start.php', 'http://nilurl.ru/ELxMu5', NULL, NULL, NULL),
('3', 'user1697172435488', NULL, NULL, 'https://www.php.net/manual/ru/function.session-start.php', 'http://nilurl.ru/dkkb87', NULL, NULL, NULL),
('4', 'user1697172435488', NULL, NULL, 'https://www.php.net/manual/ru/function.session-start.php', 'http://nilurl.ru/olmAJv', NULL, NULL, NULL),
('5', 'user1697172435488', NULL, NULL, 'https://www.php.net/manual/ru/function.session-start.php', 'http://nilurl.ru/vwRs7C', NULL, NULL, NULL),
('6', 'user1697172435488', NULL, NULL, 'https://chat.openai.com/c/04f08a57-fb8c-47a9-9acd-403c90144567', 'http://nilurl.ru/zzzzzzz', NULL, NULL, NULL),
('7', 'user1699248494001', NULL, NULL, 'https://www.php.net/manual/ru/function.session-start.php', 'http://nilurl.ru/2IS3ZU', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

CREATE TABLE `log` (
  `timestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `action` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `data` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Log';

--
-- Дамп данных таблицы `log`
--

INSERT INTO `log` (`timestamp`, `username`, `domain`, `action`, `data`, `id`) VALUES
('2023-10-17 10:07:20', 'SETUP.PHP (95.104.186.105)', '', 'create_admin', 'admin@nilurl.ru', 1),
('2023-10-17 10:10:24', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'create_domain', 'nilurl.ru', 2),
('2023-10-17 11:17:35', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'create_alias', 'all_in@nilurl.ru', 3),
('2023-10-17 11:17:36', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'create_mailbox', 'all_in@nilurl.ru', 4),
('2023-10-17 11:18:25', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'create_alias', 'all_out@nilurl.ru', 5),
('2023-10-17 11:18:37', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'create_mailbox', 'all_out@nilurl.ru', 6),
('2023-10-18 20:24:31', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'edit_alias', 'all_in@nilurl.ru', 7),
('2023-10-18 20:24:31', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'edit_mailbox', 'all_in@nilurl.ru', 8),
('2023-10-18 20:24:40', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'edit_alias', 'all_in@nilurl.ru', 9),
('2023-10-18 20:24:40', 'admin@nilurl.ru (95.104.186.105)', 'nilurl.ru', 'edit_mailbox', 'all_in@nilurl.ru', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `mail`
--

CREATE TABLE `mail` (
  `id` varchar(30) NOT NULL,
  `type` char(10) DEFAULT 'resetPswd',
  `expiresTime` datetime(6) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `userId` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `mail`
--

INSERT INTO `mail` (`id`, `type`, `expiresTime`, `code`, `userId`) VALUES
('0', '0', NULL, '0', '0'),
('1', 'newPswd', NULL, 'okhgoXxl', 'user1697172435488'),
('2', 'newPswd', NULL, 'OvjsGJKY', 'user1697182103656'),
('3', 'newPswd', NULL, 'FGaHGdlY', 'user1697227701141'),
('4', 'newPswd', NULL, 'NwBSQgpB', 'user1699248494001');

-- --------------------------------------------------------

--
-- Структура таблицы `mailbox`
--

CREATE TABLE `mailbox` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `maildir` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `quota` bigint NOT NULL DEFAULT '0',
  `local_part` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `phone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `email_other` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `token_validity` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `password_expiry` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Virtual Mailboxes';

--
-- Дамп данных таблицы `mailbox`
--

INSERT INTO `mailbox` (`username`, `password`, `name`, `maildir`, `quota`, `local_part`, `domain`, `created`, `modified`, `active`, `phone`, `email_other`, `token`, `token_validity`, `password_expiry`) VALUES
('all_in@nilurl.ru', '$1$c9809462$7cRtCFOcwB6ouLu88RQE6.', 'Входящая почта', 'nilurl.ru/all_in@nilurl.ru/', 0, 'all_in', 'nilurl.ru', '2023-10-17 11:17:35', '2023-10-18 20:24:40', 1, '', '', '', '2023-10-17 11:17:35', '2023-10-17 11:17:00'),
('all_out@nilurl.ru', '$1$c9809462$FUS1drQsNG/n5gjDyAi6x0', 'Исходящая почта', 'nilurl.ru/all_out@nilurl.ru/', 0, 'all_out', 'nilurl.ru', '2023-10-17 11:18:25', '2023-10-17 11:18:25', 1, '', '', '', '2023-10-17 11:18:25', '2023-10-17 11:18:00');

-- --------------------------------------------------------

--
-- Структура таблицы `plan`
--

CREATE TABLE `plan` (
  `id` int NOT NULL,
  `planName` text CHARACTER SET utf32 COLLATE utf32_unicode_520_ci,
  `cost` int DEFAULT NULL,
  `linkCount` int DEFAULT NULL,
  `anotherAccess` json DEFAULT NULL,
  `expiresData` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `quota`
--

CREATE TABLE `quota` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `path` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `current` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `quota2`
--

CREATE TABLE `quota2` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `bytes` bigint NOT NULL DEFAULT '0',
  `messages` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

CREATE TABLE `session` (
  `id` int NOT NULL,
  `createdAt` date DEFAULT NULL,
  `expiresTime` time(6) DEFAULT NULL,
  `userId` varchar(30) CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf32 COLLATE utf32_unicode_520_ci,
  `desc` text CHARACTER SET utf32 COLLATE utf32_unicode_520_ci,
  `longUrl` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `shortUrl` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `clicks` int DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `createdAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `userId` varchar(30) NOT NULL,
  `username` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `password` varchar(250) NOT NULL,
  `referalId` int DEFAULT NULL,
  `mailCheck` tinyint(1) DEFAULT NULL,
  `planId` varchar(30) CHARACTER SET utf8mb4  DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`userId`, `username`, `email`, `password`, `referalId`, `mailCheck`, `planId`) VALUES
('', '', '', '', 0, NULL, ''),
('user1699248494001', 'wlad2000vita', 'wlad2000vita@gmail.com', '$2y$10$vgUVOev6wIz6zLdcNk3OJOIfuBvpU0eVjAwbN23jBW/vAvmjMrUMy', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `vacation`
--

CREATE TABLE `vacation` (
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `body` text CHARACTER SET utf8mb4  NOT NULL,
  `cache` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activefrom` timestamp NOT NULL DEFAULT '1999-12-31 21:00:00',
  `activeuntil` timestamp NOT NULL DEFAULT '2038-01-17 21:00:00',
  `interval_time` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Postfix Admin - Virtual Vacation';

-- --------------------------------------------------------

--
-- Структура таблицы `vacation_notification`
--

CREATE TABLE `vacation_notification` (
  `on_vacation` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `notified` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `notified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Postfix Admin - Virtual Vacation Notifications';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `alias`
--
ALTER TABLE `alias`
  ADD PRIMARY KEY (`address`),
  ADD KEY `domain` (`domain`);

--
-- Индексы таблицы `alias_domain`
--
ALTER TABLE `alias_domain`
  ADD PRIMARY KEY (`alias_domain`),
  ADD KEY `active` (`active`),
  ADD KEY `target_domain` (`target_domain`);

--
-- Индексы таблицы `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`domain`);

--
-- Индексы таблицы `domain_admins`
--
ALTER TABLE `domain_admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Индексы таблицы `fetchmail`
--
ALTER TABLE `fetchmail`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `domain_timestamp` (`domain`,`timestamp`);

--
-- Индексы таблицы `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mailbox`
--
ALTER TABLE `mailbox`
  ADD PRIMARY KEY (`username`),
  ADD KEY `domain` (`domain`);

--
-- Индексы таблицы `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `quota`
--
ALTER TABLE `quota`
  ADD PRIMARY KEY (`username`,`path`);

--
-- Индексы таблицы `quota2`
--
ALTER TABLE `quota2`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- Индексы таблицы `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email` (`email`);

--
-- Индексы таблицы `vacation_notification`
--
ALTER TABLE `vacation_notification`
  ADD PRIMARY KEY (`on_vacation`,`notified`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `domain_admins`
--
ALTER TABLE `domain_admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `fetchmail`
--
ALTER TABLE `fetchmail`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `log`
--
ALTER TABLE `log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `vacation_notification`
--
ALTER TABLE `vacation_notification`
  ADD CONSTRAINT `vacation_notification_pkey` FOREIGN KEY (`on_vacation`) REFERENCES `vacation` (`email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
