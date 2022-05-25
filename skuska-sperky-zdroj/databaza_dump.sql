-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Verzia PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `wa1_skusky`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `sperky_kategorie`
--

DROP TABLE IF EXISTS `sperky_kategorie`;
CREATE TABLE `sperky_kategorie` (
  `id_kat` smallint(6) NOT NULL,
  `nazov` varchar(100) COLLATE utf8_slovak_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `sperky_kategorie`
--

INSERT INTO `sperky_kategorie` (`id_kat`, `nazov`) VALUES
(1, 'Prstene'),
(2, 'Náušnice'),
(3, 'Prívesky'),
(4, 'Náramky');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `sperky_objednavky`
--

DROP TABLE IF EXISTS `sperky_objednavky`;
CREATE TABLE `sperky_objednavky` (
  `id` smallint(6) NOT NULL,
  `uid` smallint(6) NOT NULL,
  `tovar` text COLLATE utf8_slovak_ci NOT NULL,
  `datum` date NOT NULL,
  `vybavena` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `sperky_objednavky`
--

INSERT INTO `sperky_objednavky` (`id`, `uid`, `tovar`, `datum`, `vybavena`) VALUES
(1, 2, '12;55', '2018-05-13', 0),
(2, 2, '7;12;55', '2019-05-20', 0),
(3, 6, '7;12;55', '2019-05-24', 1),
(4, 2, '12;30;53;56;59', '2019-05-24', 0),
(5, 2, '55;17;25', '2019-05-26', 0),
(9, 5, '55;12;53', '2019-06-18', 1),
(10, 4, '21;23', '2019-06-18', 0),
(11, 2, '53;30;56;12', '2020-06-01', 0),
(13, 6, '12;53;30', '2020-06-01', 0),
(14, 2, '10;26', '2020-06-01', 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `sperky_pouzivatelia`
--

DROP TABLE IF EXISTS `sperky_pouzivatelia`;
CREATE TABLE `sperky_pouzivatelia` (
  `uid` smallint(6) NOT NULL,
  `username` varchar(20) COLLATE utf8_slovak_ci NOT NULL DEFAULT '',
  `heslo` varchar(50) COLLATE utf8_slovak_ci NOT NULL DEFAULT '',
  `meno` varchar(20) COLLATE utf8_slovak_ci NOT NULL DEFAULT '',
  `priezvisko` varchar(30) COLLATE utf8_slovak_ci NOT NULL DEFAULT '',
  `admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `sperky_pouzivatelia`
--

INSERT INTO `sperky_pouzivatelia` (`uid`, `username`, `heslo`, `meno`, `priezvisko`, `admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrátor', 'systému', 1),
(2, 'uwa', '78f0f32c08873cfdba57f17c855943c0', 'predmet', 'UWA', 0),
(3, 'roman', 'b179a9ec0777eae19382c14319872e1b', 'Roman', 'Hrušecký', 1),
(4, 'marek', 'e061c9aea5026301e7b3ff09e9aca2cf', 'Marek', 'Nagy', 0),
(5, 'jozko', '256f035bd7cf72238fad007fb9199c66', 'Jožko', 'Púčik', 0),
(6, 'mrkva', 'bfd7d9c62540ed72de0f32932077bef7', 'Janko', 'Mrkvička', 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `sperky_produkty`
--

DROP TABLE IF EXISTS `sperky_produkty`;
CREATE TABLE `sperky_produkty` (
  `kod` smallint(6) NOT NULL,
  `nazov` varchar(30) COLLATE utf8_slovak_ci NOT NULL,
  `popis` varchar(200) COLLATE utf8_slovak_ci NOT NULL,
  `cena` float NOT NULL,
  `id_kat` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `sperky_produkty`
--

INSERT INTO `sperky_produkty` (`kod`, `nazov`, `popis`, `cena`, `id_kat`) VALUES
(1, 'Lavender Swarovski Crystal', 'strieborný prsteň s levanduľovými kryštálmi Swarovski', 21.33, 1),
(2, 'Fancy Blue and White Swarovski', 'strieborný prsteň s modrými a bielymi zirkónmi Swarovski', 25, 1),
(3, 'Meadow and White Swarovski', 'strieborný prsteň s trávovo-zelenými a bielymi kryštálmi Swarovski', 25, 1),
(4, 'Gold Woven Design', 'strieborno-zlatý prsteň s prepletaným vzorom a diamantovými prvkami', 28.68, 1),
(5, 'Swarovski Pearl and Crystal', 'strieborný prsteň s perlou a kryštálmi Swarovski', 28.68, 1),
(6, 'Onyx Ring', 'strieborný prsteň s ónyxom', 28.68, 1),
(7, 'Azotic Ecstasy', 'strieborný prsteň s mystickým topásom a bielymi zafírmi', 30.15, 1),
(8, 'Sapphire Drop', 'zafírové náušnice s diamantmi v striebornej platničke', 21.32, 2),
(9, 'Zirconia Heart', 'náušnice v tvare srdca so zirkónmi Swarovski v zlate a striebre', 21.33, 2),
(10, 'Butterfly Pendant', 'strieborný prívesok s diamantmi v tvare motýľa', 21.32, 3),
(11, 'Link Bracelet', 'zlatý článkový náramok v žlto-ružovom prevedení na nerezovej oceli', 21.32, 4),
(12, 'Black and White Wave', 'strieborný prsteň v tvare vĺn s čiernymi a bielymi diamantmi', 102.2, 1),
(13, 'Jessica Simpson Butterfly', 'strieborno-zlatý prsteň v tvare dvojitého motýľa s diamantmi', 109.55, 1),
(14, 'Diamond Flower', 'strieborný prsteň v tvare kvetu so zafírmi a diamantmi', 116.9, 1),
(15, 'Three Band Ring', 'trojpruhový prsteň zo žltého a ružového zlata na striebornom základe s diamantmi', 37.5, 1),
(16, 'Heart Bangle', 'strieborný náramok so srdcami z kryštálov Swarovski', 21.33, 4),
(17, 'Bubble Ring', 'strieborný prsteň s množstvom modro-bielych kryštálov Swarovski', 43.38, 1),
(18, 'Heart Hoop', 'strieborné náušnice s bielymi kryštálmi Swarovski  so srdiečkami z ružových kryštálov Swarovski', 21.33, 2),
(19, 'Flower Earrings', 'náušnice so žltého a ružového zlata na striebornom podklade s kvetinovým vzorom a diamantmi', 25, 2),
(20, 'Sapphire Ring', 'strieborný prsteň so zafírom a diamantmi', 43.38, 1),
(21, 'Double Heart', 'prívesok v tvare srdca zo zlata na striebornom základe so srdiečkom z azúrových kryštálov Swarovski', 21.33, 3),
(22, 'Vintage Tear Drop', 'strieborný prívesok v tvare slzy s kryštálmi Swarovski', 21.33, 3),
(23, 'Dome Ring', 'mohutný prsteň z 24k zlata na striebornom základe', 43.38, 1),
(24, 'Shamballa', 'dizajnérsky náramok s bielymi a striebornými kryštálmi, hematitom a magickou hviezdicou', 28.68, 4),
(25, 'Bouquet Ring', 'ónyxový prsteň v tvare kytice s kryštálmi Swarovski  na ródiovej platničke', 55.15, 1),
(26, 'Kabana Double Dolphin', 'strieborný prsteň s dvoma delfínmi', 58.09, 1),
(27, 'Chocolate', 'náramok z 5mm čokoládových perál a zlata', 28.68, 4),
(28, 'Twist Bangle', 'prepletaný náramok s diamantmi na striebornom základe', 28.68, 4),
(29, 'Teal Bangle', 'strieborný náramok s azúrovými kryštálmi Swarovski', 43.38, 4),
(30, 'Blue and White', 'strieborné náušnice s modrými a bielymi kryštálmi Swarovski', 25, 2),
(31, 'Flower Stud', 'napichovacie zlaté náušnice na striebornom základe so zlatými kryštálmi Swarovski', 25, 2),
(32, 'Onyx Earrings', 'strieborné náušnice s ónyxom', 25, 2),
(33, 'Triple Hoop', 'trojkruhové strieborné náušnice s kryštálmi Swarovski', 25, 2),
(34, 'Hoop Zirconia', 'polkruhové náušnice so zirkónmi Swarovski na striebornej platničke', 25, 2),
(35, 'Meadow and White Pendant', 'strieborný prívesok s trávovo-zelenými a bielymi kryštálmi Swarovski', 21.32, 3),
(36, 'Onyx Pendant', 'ónyxový prívesok v striebre', 25, 3),
(37, 'Tie Pendant', 'strieborný prívesok v tvare kravaty s kryštálmi Swarovski', 25, 3),
(38, 'Grey Pearl', 'náramok z 11-12mm sivých perál a striebra', 50.74, 4),
(39, 'Starfish', 'strieborný prsteň v tvare hviezdice s rôzne fialovými a bielymi kryštálmi Swarovski', 69.85, 1),
(40, 'Calla Lily', 'strieborno-zlatý prsteň v tvare kvetu kala s diamantmi', 87.5, 1),
(41, 'Onyx Black and White', 'strieborný prsteň s ónyxom a čiernymi a bielymi diamantmi', 94.85, 1),
(42, 'Tangle Black and White', 'strieborný prepletený prsteň s čiernymi a bielymi diamantmi', 102.2, 1),
(43, 'Ruby and White', 'zlatý prsteň s červenými a bielymi zafírmi', 314.95, 1),
(44, 'White Quartz', 'prsteň z bieleho zlata s bielym kryštálom a diamantmi', 205.37, 1),
(45, 'Two-Tone', 'prsteň z dvojfarebného zlata s diamantmi', 241.91, 1),
(46, 'Champagne Heart', 'zlatý prsteň v tvare srdca s bielymi a šampanskými diamantmi', 219.85, 1),
(47, 'Blue and White Ring', 'prsteň z bieleho zlata so zafírmi a diamantmi', 131.62, 1),
(48, 'Pave Ring', 'strieborno-zlatý prsteň s diamantmi', 124.26, 1),
(49, 'Pink and White Engagement', 'prsteň z ružového a bieleho zlata s ružovými a bielymi diamantmi', 2940.44, 1),
(50, 'Cubetto Bracelet', 'mohutný zlatý náramok na striebornom základe', 72.79, 4),
(51, 'Three Row', 'trojradový náramok z perál, diamantov a striebra', 72.79, 4),
(52, 'Zebra Bracelet', 'strieborný náramok so zebrovým efektom', 80.15, 4),
(53, 'Black Ceramic Circle', 'strieborný náramok s diamantovými keramickými kruhmi', 131.62, 4),
(54, 'Onyx Cuff', 'strieborno-zlatý náramok s ónyxom', 146.33, 4),
(55, 'Black and White Bangle', 'strieborný náramok s čiernymi a bielymi diamantmi', 205.15, 4),
(56, 'Blue and White Drop', 'strieborný prívesok v tvare slzy s modrými a bielymi zafírmi', 28.68, 3),
(57, 'Pearl Bead', 'zlatý prívesok s perlou a kryštálmi Swarovski', 50.74, 3),
(58, 'Champagne Flower', 'strieborno-zlatý prívesok s čiernymi, šampanskými a bielymi diamantmi', 94.85, 3),
(59, 'Blue and White Drops', 'strieborné náušnice s modrými a bielymi zafírmi v tvare sĺz', 36.03, 2),
(60, 'Chocolate Pearl Drop', 'zlaté náušnice so 7mm čokoládovými perlami', 43.38, 2);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `sperky_kategorie`
--
ALTER TABLE `sperky_kategorie`
  ADD PRIMARY KEY (`id_kat`);

--
-- Indexy pre tabuľku `sperky_objednavky`
--
ALTER TABLE `sperky_objednavky`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `sperky_pouzivatelia`
--
ALTER TABLE `sperky_pouzivatelia`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexy pre tabuľku `sperky_produkty`
--
ALTER TABLE `sperky_produkty`
  ADD PRIMARY KEY (`kod`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `sperky_kategorie`
--
ALTER TABLE `sperky_kategorie`
  MODIFY `id_kat` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `sperky_objednavky`
--
ALTER TABLE `sperky_objednavky`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pre tabuľku `sperky_pouzivatelia`
--
ALTER TABLE `sperky_pouzivatelia`
  MODIFY `uid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pre tabuľku `sperky_produkty`
--
ALTER TABLE `sperky_produkty`
  MODIFY `kod` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
