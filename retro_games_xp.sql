-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2025 a las 17:25:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `retro_games_xp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`Id`, `Nombre`) VALUES
(1, 'Arcade'),
(2, 'Shooter'),
(3, 'Aventura'),
(4, 'Plataformas'),
(5, 'Carreras'),
(6, 'Lucha'),
(7, 'Estrategia'),
(8, 'Simulación'),
(9, 'Terror'),
(10, 'Sandbox'),
(11, 'Retro'),
(12, 'Clásico'),
(13, 'Indie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `Id` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Comentario` text NOT NULL,
  `Likes` tinyint(4) NOT NULL,
  `Dislikes` tinyint(4) NOT NULL,
  `Id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos_de_perfil`
--

CREATE TABLE `fotos_de_perfil` (
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fotos_de_perfil`
--

INSERT INTO `fotos_de_perfil` (`Id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos_de_portada`
--

CREATE TABLE `fotos_de_portada` (
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fotos_de_portada`
--

INSERT INTO `fotos_de_portada` (`Id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `Id` int(11) NOT NULL,
  `Genero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`Id`, `Genero`) VALUES
(1, 'No especificado'),
(2, 'Hombre'),
(3, 'Mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Likes` int(11) NOT NULL,
  `Dislikes` int(11) NOT NULL,
  `Desarrollador` varchar(50) NOT NULL,
  `Clasificacion` tinyint(4) NOT NULL,
  `Fecha_publicacion` date NOT NULL,
  `Ultima_actualizacion` date NOT NULL,
  `Tecnologia` varchar(50) NOT NULL,
  `Plataforma` text NOT NULL,
  `Que es` text NOT NULL,
  `Quien lo desarrollo` text NOT NULL,
  `Plataformas disponibles` text NOT NULL,
  `Calficacion recibida` text NOT NULL,
  `Lenguaje desarrollado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`Id`, `Nombre`, `Likes`, `Dislikes`, `Desarrollador`, `Clasificacion`, `Fecha_publicacion`, `Ultima_actualizacion`, `Tecnologia`, `Plataforma`, `Que es`, `Quien lo desarrollo`, `Plataformas disponibles`, `Calficacion recibida`, `Lenguaje desarrollado`) VALUES
(1, 'Pac-Man', 0, 0, 'Namco', 9, '1980-01-01', '2000-01-01', 'Ensamblador', 'Arcade, consolas, móviles', 'Un juego arcade clásico donde comes puntos mientras escapas de fantasmas.', 'Namco', 'Arcade, consolas, móviles', '9.0/10 (icónico y revolucionario)', 'Ensamblador'),
(2, 'Doom (1993)', 0, 0, 'id Software', 10, '1993-01-01', '2023-01-01', 'C, Ensamblador', 'PC, consolas, móviles', 'Pionero en shooters en primera persona, ambientado en una base marciana invadida por demonios.', 'id Software', 'PC, consolas, móviles', '9.5/10 (revolucionario en FPS)', 'C, Ensamblador'),
(3, 'GTA (1997)', 0, 0, 'DMA Design', 9, '1997-01-01', '2005-01-01', 'C++, Ensamblador', 'PC, PS1, Game Boy Color', 'Juego de acción y crimen en un mundo abierto con vista top-down.', 'DMA Design', 'PC, PS1, Game Boy Color', '8.5/10 (innovador en sandbox)', 'C++, Ensamblador'),
(4, 'Need for Speed', 0, 0, 'EA Canada', 8, '1994-01-01', '2022-01-01', 'C++', 'PC, consolas, móviles', 'Juego de carreras de autos con enfoque en velocidad y simulación.', 'EA Canada', 'PC, consolas, móviles', '8.0/10 (bien recibido en su tiempo)', 'C++'),
(5, 'Mortal Kombat', 0, 0, 'Midway Games', 9, '1992-01-01', '2021-01-01', 'Ensamblador', 'Arcade, PC, consolas', 'Juego de lucha uno contra uno con personajes violentos y fatalities icónicos.', 'Midway Games', 'Arcade, PC, consolas', '8.5/10 (popular pero polémico)', 'Ensamblador'),
(6, 'Kaissa', 0, 0, 'Instituto Moscú', 8, '1971-01-01', '1985-01-01', 'Algol, Ensamblador', 'Mainframes soviéticos', 'Programa de ajedrez soviético que enfrentaba humanos en partidas computarizadas.', 'Instituto Moscú', 'Mainframes soviéticos', '7.5/10 (destacado en ajedrez IA)', 'Algol, Ensamblador'),
(7, 'Galaga', 0, 0, 'Namco', 9, '1981-01-01', '2010-01-01', 'Ensamblador', 'Arcade, consolas, móviles', 'Shooter espacial donde controlas una nave que destruye oleadas de enemigos.', 'Namco', 'Arcade, consolas, móviles', '8.8/10 (muy querido en arcades)', 'Ensamblador'),
(8, 'Donkey Kong', 0, 0, 'Nintendo', 9, '1981-01-01', '2020-01-01', 'Ensamblador', 'Arcade, NES, consolas modernas', 'Plataformas clásico donde Mario debe rescatar a la princesa de Donkey Kong.', 'Nintendo', 'Arcade, NES, consolas modernas', '9.2/10 (histórico e influyente)', 'Ensamblador'),
(9, 'Superfrog', 0, 0, 'Team17', 8, '1993-01-01', '2013-01-01', 'C, Ensamblador', 'Amiga, PC, móviles', 'Plataformas 2D con un sapo superhéroe como protagonista, popular en Amiga.', 'Team17', 'Amiga, PC, móviles', '7.8/10 (popular en Amiga)', 'C, Ensamblador'),
(10, 'Snow Bros', 0, 0, 'Toaplan', 8, '1990-01-01', '2022-01-01', 'Ensamblador', 'Arcade, NES, móviles', 'Juego de plataformas cooperativo donde lanzas bolas de nieve para derrotar enemigos.', 'Toaplan', 'Arcade, NES, móviles', '8.3/10 (éxito en arcades)', 'Ensamblador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego_categoria`
--

CREATE TABLE `juego_categoria` (
  `Id_juego` int(11) NOT NULL,
  `Id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `juego_categoria`
--

INSERT INTO `juego_categoria` (`Id_juego`, `Id_categoria`) VALUES
(1, 1),
(1, 11),
(1, 12),
(2, 2),
(2, 9),
(2, 11),
(3, 3),
(3, 10),
(3, 12),
(4, 5),
(4, 8),
(4, 11),
(5, 6),
(5, 12),
(6, 7),
(6, 12),
(7, 1),
(7, 2),
(7, 11),
(7, 12),
(8, 1),
(8, 4),
(8, 11),
(8, 12),
(9, 4),
(9, 3),
(9, 11),
(9, 13),
(10, 1),
(10, 4),
(10, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logros`
--

CREATE TABLE `logros` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `logros`
--

INSERT INTO `logros` (`Id`, `Nombre`) VALUES
(1, '10 horas'),
(2, '50 horas'),
(3, '100 horas'),
(4, '5 juegos'),
(5, '15 juegos'),
(6, '30 juegos'),
(7, '7 dias'),
(8, '30 dias'),
(9, '90 dias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`Id`, `Nombre`, `region_id`) VALUES
(1, 'Argentina', NULL),
(2, 'México', NULL),
(3, 'Chile', NULL),
(4, 'Colombia', NULL),
(5, 'Perú', NULL),
(6, 'España', NULL),
(7, 'Estados Unidos', NULL),
(8, 'Canadá', NULL),
(9, 'Francia', NULL),
(10, 'Italia', NULL),
(11, 'Alemania', NULL),
(12, 'Brasil', NULL),
(13, 'Reino Unido', NULL),
(14, 'Japón', NULL),
(15, 'Corea del Sur', NULL),
(16, 'Australia', NULL),
(17, 'Sudáfrica', NULL),
(18, 'China', NULL),
(19, 'India', NULL),
(20, 'Rusia', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rango`
--

CREATE TABLE `rango` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rango`
--

INSERT INTO `rango` (`Id`, `Nombre`) VALUES
(1, 'Leyenda pixelada'),
(2, 'Experto 8-bits'),
(3, 'Casual Retro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reacciones`
--

CREATE TABLE `reacciones` (
  `Id_usuario` int(11) NOT NULL,
  `Id_juego` int(11) NOT NULL,
  `Tipo` enum('like','dislike') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reacciones`
--

INSERT INTO `reacciones` (`Id_usuario`, `Id_juego`, `Tipo`) VALUES
(1, 1, 'like');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`Id`, `Nombre`) VALUES
(1, 'Norteamerica'),
(2, 'Sudamerica'),
(3, 'Europa'),
(4, 'Africa'),
(5, 'Europa'),
(6, 'Asia'),
(7, 'Africa'),
(8, 'Oceania');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_juego`
--

CREATE TABLE `respuestas_juego` (
  `Id_juego` int(11) NOT NULL,
  `Que_es` longtext DEFAULT NULL,
  `Quien_lo_desarrollo` longtext DEFAULT NULL,
  `Fecha_publicacion` date NOT NULL,
  `Plataformas_disponibles` longtext DEFAULT NULL,
  `Calificacion_recibida` longtext DEFAULT NULL,
  `Lenguaje_desarrollado` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `respuestas_juego`
--

INSERT INTO `respuestas_juego` (`Id_juego`, `Que_es`, `Quien_lo_desarrollo`, `Fecha_publicacion`, `Plataformas_disponibles`, `Calificacion_recibida`, `Lenguaje_desarrollado`) VALUES
(1, 'Pac-Man es un videojuego arcade lanzado en 1980 que revolucionó la industria con su diseño basado en laberintos. Controlas a una criatura amarilla que debe comer todos los puntos del nivel mientras evade a cuatro fantasmas con diferentes comportamientos de persecución.', 'Desarrollado por Namco en Japón, bajo la dirección de Toru Iwatani, Pac-Man fue concebido como un juego no violento que atrajera tanto a hombres como mujeres en una época dominada por juegos de disparos.', '1980-01-01', 'Inicialmente para arcades, luego fue adaptado a Atari 2600, NES, SNES, Game Boy, móviles, y disponible actualmente en colecciones retro y versiones web.', 'Considerado un ícono cultural, Pac-Man ha sido incluido en museos y rankings como uno de los mejores juegos de todos los tiempos. Tiene una puntuación de 9/10 en diversos sitios retro.', 'Programado principalmente en lenguaje ensamblador para hardware arcade basado en Zilog Z80.'),
(2, 'Doom (1993) es un juego de disparos en primera persona ambientado en una base marciana infestada por demonios. Su rápida acción, atmósfera oscura y música intensa lo convirtieron en un clásico instantáneo.', 'Creado por id Software, el equipo de John Carmack y John Romero diseñó tanto el revolucionario motor gráfico como los niveles llenos de enemigos y secretos.', '1993-01-01', 'Lanzado originalmente en MS-DOS, luego portado a SNES, PlayStation, Xbox, móviles y navegadores. Su código abierto permitió infinidad de mods y versiones comunitarias.', 'Obtuvo 9.5/10 por su innovación técnica y jugabilidad. Definió el género FPS y sigue siendo influyente.', 'Usó C para la lógica general y ensamblador para optimización gráfica en procesadores Intel 486.'),
(3, 'Grand Theft Auto fue el primer juego de una saga icónica. Usando una perspectiva cenital, permite al jugador cometer crímenes en una ciudad abierta mientras evita a la policía.', 'Fue desarrollado por DMA Design, hoy conocido como Rockstar North, quienes revolucionaron la forma de crear mundos abiertos.', '1997-01-01', 'Lanzado para MS-DOS, Windows, PlayStation y Game Boy Color. Actualmente disponible en colecciones clásicas.', 'Recibió 8.5/10 por su innovación y libertad, aunque también críticas por su contenido violento.', 'Programado en C++ y ensamblador para compatibilidad con diferentes arquitecturas de PC y consolas.'),
(4, 'The Need for Speed fue el primer título de la longeva franquicia. Combinaba carreras realistas con modelos de autos licenciados y una sensación de velocidad nunca vista antes.', 'Desarrollado por EA Canada y originalmente impulsado por Road & Track Magazine, fue una colaboración entre automovilismo real y simulación digital.', '1994-01-01', 'Disponibilidad inicial en 3DO, luego PC, PlayStation y SEGA Saturn. Hoy está en PC y consolas modernas en ediciones remasterizadas.', 'Obtuvo una media de 8.0/10 por sus gráficos avanzados, audio realista y jugabilidad adictiva.', 'C++ fue el lenguaje principal por su flexibilidad multiplataforma y soporte de gráficos avanzados.'),
(5, 'Mortal Kombat es un juego de lucha que se destacó por su violencia gráfica, personajes digitalizados y mecánicas de combate rápidas. Introdujo los \"Fatalities\", movimientos finales sangrientos.', 'Creado por Midway Games, con Ed Boon y John Tobias liderando el diseño y la programación.', '1992-01-01', 'Originalmente en arcades, y luego en Super Nintendo, Sega Genesis, Game Boy, PC, móviles y colecciones modernas.', '8.5/10. Fue amado por su estilo visual, aunque controversial por la violencia, lo cual motivó la creación del sistema ESRB.', 'Hecho en lenguaje ensamblador para placas arcade con hardware customizado.'),
(6, 'Kaissa es uno de los primeros programas de ajedrez desarrollados por la Unión Soviética. Competía en torneos contra humanos y otros programas, siendo uno de los primeros en usar heurísticas.', 'Desarrollado por el Instituto de Problemas de Matemática de Moscú, con un enfoque académico para explorar inteligencia artificial temprana.', '1971-01-01', 'Diseñado para mainframes soviéticos como BESM y M-20, no fue distribuido comercialmente.', 'Recibió reconocimiento académico, con una calificación estimada de 7.5/10 por su capacidad para competir en partidas reales.', 'Algol para lógica estructural y ensamblador para tareas de cálculo pesado.'),
(7, 'Galaga es un juego de disparos espaciales donde el jugador controla una nave que debe destruir oleadas de enemigos que se mueven en patrones complejos.', 'Fue desarrollado por Namco como secuela de Galaxian y rápidamente se convirtió en un éxito de los arcades.', '1981-01-01', 'Arcade, NES, Atari, Game Boy, PC, móviles y versiones en línea.', '8.8/10 por su adictiva jugabilidad, dificultad progresiva y modo de doble nave.', 'Programado en ensamblador para sistemas arcade basados en hardware Zilog.'),
(8, 'Donkey Kong es uno de los primeros juegos de plataformas donde el jugador controla a Mario para rescatar a su novia de un gorila gigante, esquivando obstáculos.', 'Fue desarrollado por Nintendo y diseñado por Shigeru Miyamoto en su primer gran proyecto, dando origen a la saga Mario.', '1981-01-01', 'Arcade, NES, Game Boy, consolas virtuales, móviles y emuladores.', '9.2/10. Marcó el inicio de los juegos narrativos de plataformas con personajes icónicos.', 'Hecho en ensamblador para hardware arcade personalizado de Nintendo.'),
(9, 'Superfrog es un colorido juego de plataformas en 2D protagonizado por un sapo con superpoderes, desarrollado durante la era dorada del Amiga.', 'Team17 diseñó el juego con énfasis en controles fluidos, gráficos animados y música vibrante.', '1993-01-01', 'Originalmente para Amiga, luego para PC, móviles y plataformas de distribución digital.', '7.8/10. Fue muy bien recibido por los usuarios de Amiga por su estilo europeo de plataformas.', 'C para lógica de juego y ensamblador para manejo gráfico directo en el hardware del Amiga.'),
(10, 'Snow Bros es un juego de plataformas cooperativo donde dos personajes lanzan bolas de nieve para atrapar enemigos y convertirlos en bolas rodantes que limpian la pantalla.', 'Fue creado por Toaplan, una desarrolladora japonesa conocida por sus shooters arcade.', '1990-01-01', 'Arcade, NES, Game Boy, teléfonos móviles y remakes actuales en consolas.', '8.3/10. Muy popular en salones recreativos por su acción cooperativa y estética amigable.', 'Programado en ensamblador para chips de arcade personalizados.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Nombre_usuario` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Horas_jugadas` int(11) NOT NULL,
  `Fecha_registro` date NOT NULL,
  `Juegos_jugados` int(11) NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `Id_region` int(11) NOT NULL,
  `Id_pais` int(11) NOT NULL,
  `Id_genero` int(11) NOT NULL,
  `Id_logros` int(11) NOT NULL,
  `Id_rango` int(11) NOT NULL,
  `Id_foto_perfil` int(11) NOT NULL,
  `Id_foto_portada` int(11) NOT NULL,
  `token_sesion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nombre_usuario`, `Correo`, `Contraseña`, `Horas_jugadas`, `Fecha_registro`, `Juegos_jugados`, `Descripcion`, `Fecha_nacimiento`, `Id_region`, `Id_pais`, `Id_genero`, `Id_logros`, `Id_rango`, `Id_foto_perfil`, `Id_foto_portada`, `token_sesion`) VALUES
(1, 'NeoGamer', 'neo@matrix.com', '$2y$10$KbGHbG5raZPjpRH7mA7ulONwN9CmMQxkHTF58kJXWQiJmvm2HX3Si', 150, '2025-05-28', 10, 'Fan de los retro-futuristas', '1990-05-01', 1, 7, 2, 1, 1, 1, 1, NULL),
(2, 'PixelQueen', 'queen@retro.com', '$2y$10$Dw3W3kVJP0kpRcBtZy.X9OLQklcrx7O14XduE.F1zdpU3ebkYHehy', 80, '2025-05-28', 7, 'Amo los clásicos de NES', '1995-11-11', 1, 7, 3, 2, 2, 2, 2, NULL),
(3, 'TurboMax', 'max@arcade.org', '$2y$10$4QYglYABJvF9b8YcEvOZ5evF4Ud6WrT1ZmmbYhn6rM0zRFGX7eO7i', 300, '2025-05-28', 20, 'Competidor en torneos retro', '1987-09-25', 1, 6, 2, 3, 3, 3, 3, NULL),
(4, 'LolaByte', 'lola@bitworld.net', '$2y$10$jFO3pmjzD1T7K5vXYR9Ule3DpUohZa/0OaWXfpTZuHnA6GvRVCjDu', 40, '2025-05-28', 4, 'Programadora y jugadora', '2000-03-22', 1, 8, 3, 1, 2, 4, 2, NULL),
(5, 'RetroBoss', 'boss@retroking.com', '$2y$10$qNMTZSvB2zffWME9U8Ls0.64PlSkvWLUj7dRZ7O34HbKJTWlthFA2', 500, '2025-05-28', 30, 'Amante de todo lo vintage', '1980-07-04', 1, 6, 2, 3, 1, 5, 3, NULL),
(6, 'BitRunner', 'runner@oldschool.org', '$2y$10$uDGRQ5CQvJkD4sELBoAXjOdG9m47cJ2cgMCU95CE8OfGkErIqHtIS', 210, '2025-05-28', 12, 'Runner de speedruns retro', '1993-01-10', 1, 5, 2, 2, 2, 6, 2, NULL),
(7, 'Arcadia', 'arcadia@8bitmail.com', '$2y$10$IDQ.FzUBa94YByzF7XBI8e3OaItzvUeKobvDRWjWnTJH4idwGoHeK', 90, '2025-05-28', 8, 'Entusiasta de consolas viejas', '1992-04-18', 1, 5, 3, 2, 3, 7, 1, NULL),
(8, 'LoadMaster', 'master@romload.com', '$2y$10$TKh.7gKnY9W3eGoeWssZtORWfrQJYOAc3SEKExjl6zLKzvGVv6U4O', 60, '2025-05-28', 5, 'Rom loader nivel pro', '1999-12-30', 1, 7, 2, 1, 2, 8, 2, NULL),
(9, 'Carla', 'carla@retro.fun', '$2y$10$DJ8FLzZ8wB98p3uUc1Yt/Ofv.qmc52VX.RMsUZv6YdAfD6excfF1K', 23, '2025-05-28', 2, 'Solo juego Mario Kart 64', '1998-06-12', 1, 9, 3, 1, 3, 9, 3, NULL),
(10, 'PixelKid', 'kid@8bits.com', '$2y$10$AX1vRy/9KX01fE/mZxQ6XOCjZ6G2lg/sZ8S4vM9bYXBflfZmLHg5G', 10, '2025-05-28', 1, 'Recién empiezo en el mundo retro', '2007-10-05', 1, 10, 2, 1, 3, 10, 1, NULL),
(11, 'Player11', 'player11@correo.com', '$2y$10$8iHAbQsf23hgZuQOTn7m2ukA2sVO0KTm1kYBThQv0vBPwP5fuqFYO', 34, '2025-05-28', 3, 'Jugando desde 1999', '1985-02-02', 1, 6, 2, 1, 2, 11, 1, NULL),
(12, 'Player12', 'player12@correo.com', '$2y$10$Kb1NJeBSBKHrF8TWMe2leO7AS1tZT2VKn.2BJ5dJZyG9Lj6QK9PLO', 65, '2025-05-28', 6, 'Amante del Atari', '1978-08-08', 1, 7, 2, 2, 1, 12, 2, NULL),
(13, 'Player13', 'player13@correo.com', '$2y$10$HDNEqP7W35zUuAv79iTzoOYzTgM2eq9YPX8hAeUVw9UjeUe7hF1Kq', 112, '2025-05-28', 9, 'Curador de ROMs', '1991-11-11', 1, 6, 2, 2, 2, 13, 3, NULL),
(14, 'Player14', 'player14@correo.com', '$2y$10$USGCu5RQD8EL5H2Zd8Ff5upKbzztw1LsXWguYdW7IkKbiq3URyN0e', 200, '2025-05-28', 15, 'Fanático del pixel art', '1986-03-15', 1, 5, 2, 2, 1, 14, 1, NULL),
(15, 'Player15', 'player15@correo.com', '$2y$10$NmQpfxSzsEfz3R/ZyEDTxOZyxI91oXHg57N/FtsCGj5IKvYxZcVNS', 88, '2025-05-28', 7, 'Jugadora de Game Boy', '1994-07-20', 1, 5, 3, 1, 2, 15, 2, NULL),
(16, 'Player16', 'player16@correo.com', '$2y$10$q.xf0XMwUzJz7UDM6eMP4uh94vHKR7Nppf5zwXJK2MLn4D0rUQZSG', 11, '2025-05-28', 1, 'Jugando Pong en emulador', '1981-01-09', 1, 6, 2, 1, 3, 16, 3, NULL),
(17, 'Player17', 'player17@correo.com', '$2y$10$eW2AfMCKoxujqLVD7Ex9ZuqR4quj4V/FP6kM3bZKyd6MdY14Pf3/G', 300, '2025-05-28', 25, 'Torneo de SF2', '1989-12-01', 1, 6, 2, 3, 2, 17, 1, NULL),
(18, 'Player18', 'player18@correo.com', '$2y$10$rXWKi5oKXtR6ZxBce6Sp1.v/j3Dk0qKU85OU7CqZ.VyPLlC7v8SGG', 57, '2025-05-28', 6, 'Me encanta Castlevania', '1992-09-15', 1, 7, 2, 2, 2, 18, 2, NULL),
(19, 'Player19', 'player19@correo.com', '$2y$10$eHbPa2PZbV7N0e8L4yWhAeEmnq9JStvJ6a/PkLNs8DlXo35JY3tAe', 130, '2025-05-28', 13, 'Pixel pro', '1990-12-31', 1, 8, 2, 2, 1, 19, 3, NULL),
(20, 'Player20', 'player20@correo.com', '$2y$10$Aw3NUsfP/UnMBmXTZKlvN.TnkUavc6ZzFO4ZzS/nKqB3Yysssc5Q.', 76, '2025-05-28', 5, 'Siempre retro', '1983-05-05', 1, 5, 2, 1, 2, 20, 1, NULL),
(21, 'Leo', 'Leo@google.com', '$2y$10$2U2tH2MshmnT4zhmGfyJPuwxuMY4LLxSKj2ofcs.nWfSj4iIhxhNi', 0, '2025-05-29', 0, 'Nuevo usuario', '2000-01-01', 1, 7, 1, 1, 1, 17, 1, 'f71cbbbf43c5b314562f43c194fd1f33522ceb36ef9666a5fc816f766c9e61b7'),
(22, 'Mario', 'mario@bros.com', '$2y$10$BIUzNhYs078OZgAxy.1nxOG7UO0DwDKPDt3DYmDV6n0pptB2qljsK', 0, '2025-05-29', 0, 'Nuevo usuario', '2000-01-01', 1, 7, 1, 1, 1, 6, 1, NULL),
(23, 'Christian', 'nodal@amor.us', '$2y$10$IuLyW7zNvS1RjBp1PMhPT.tonoHOvV00Jj9OlgpL35H13VDj7VcE2', 0, '2025-05-29', 0, 'Nuevo usuario', '2000-01-01', 1, 7, 1, 1, 1, 6, 1, NULL),
(24, 'Lolo', 'loloGamer@gaming.com', '$2y$10$KghLWzc1F2o4wdOw0NgCmu5N0qtATpD7YSMsWg2j8N4fmr6MPJaSa', 0, '2025-05-29', 0, 'Nuevo usuario', '2000-01-01', 1, 7, 1, 1, 1, 15, 1, NULL),
(25, 'Tallada', 'Tallado@Mario.com', '$2y$10$E86jL9u5vPLcMl0LGo5abehBnZauqPUWDU0mAYsQjNEuHbz5CD2EW', 0, '2025-05-29', 0, 'Nuevo usuario', '2000-01-01', 1, 7, 1, 1, 1, 13, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_juego_favorito`
--

CREATE TABLE `usuario_juego_favorito` (
  `Id` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_juego_favorito`
--

INSERT INTO `usuario_juego_favorito` (`Id`, `Id_usuario`, `Id_juego`) VALUES
(1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id usuario` (`Id_usuario`),
  ADD KEY `Id juegos` (`Id_juego`);

--
-- Indices de la tabla `fotos_de_perfil`
--
ALTER TABLE `fotos_de_perfil`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `fotos_de_portada`
--
ALTER TABLE `fotos_de_portada`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `juego_categoria`
--
ALTER TABLE `juego_categoria`
  ADD KEY `Id juego` (`Id_juego`),
  ADD KEY `Id categoria` (`Id_categoria`);

--
-- Indices de la tabla `logros`
--
ALTER TABLE `logros`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_region_pais` (`region_id`);

--
-- Indices de la tabla `rango`
--
ALTER TABLE `rango`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `reacciones`
--
ALTER TABLE `reacciones`
  ADD PRIMARY KEY (`Id_usuario`,`Id_juego`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `respuestas_juego`
--
ALTER TABLE `respuestas_juego`
  ADD PRIMARY KEY (`Id_juego`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id genero` (`Id_genero`),
  ADD KEY `Id pais` (`Id_pais`),
  ADD KEY `Id logros` (`Id_logros`),
  ADD KEY `Id region` (`Id_region`),
  ADD KEY `Id rango` (`Id_rango`),
  ADD KEY `Id foto de perfil` (`Id_foto_perfil`),
  ADD KEY `Id foto de portada` (`Id_foto_portada`);

--
-- Indices de la tabla `usuario_juego_favorito`
--
ALTER TABLE `usuario_juego_favorito`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_usuario` (`Id_usuario`),
  ADD KEY `fk_juego` (`Id_juego`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fotos_de_perfil`
--
ALTER TABLE `fotos_de_perfil`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `fotos_de_portada`
--
ALTER TABLE `fotos_de_portada`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `logros`
--
ALTER TABLE `logros`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `rango`
--
ALTER TABLE `rango`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuario_juego_favorito`
--
ALTER TABLE `usuario_juego_favorito`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `Id juegos` FOREIGN KEY (`Id_juego`) REFERENCES `juegos` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id usuario` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`Id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `juego_categoria`
--
ALTER TABLE `juego_categoria`
  ADD CONSTRAINT `Id categoria` FOREIGN KEY (`Id_categoria`) REFERENCES `categorias` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id juego` FOREIGN KEY (`Id_juego`) REFERENCES `juegos` (`Id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `Id_region_pais` FOREIGN KEY (`region_id`) REFERENCES `region` (`Id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuestas_juego`
--
ALTER TABLE `respuestas_juego`
  ADD CONSTRAINT `respuestas_juego_ibfk_1` FOREIGN KEY (`Id_juego`) REFERENCES `juegos` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `Id foto de perfil` FOREIGN KEY (`Id_foto_perfil`) REFERENCES `fotos_de_perfil` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id foto de portada` FOREIGN KEY (`Id_foto_portada`) REFERENCES `fotos_de_portada` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id genero` FOREIGN KEY (`Id_genero`) REFERENCES `genero` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id logros` FOREIGN KEY (`Id_logros`) REFERENCES `logros` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id pais` FOREIGN KEY (`Id_pais`) REFERENCES `pais` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id rango` FOREIGN KEY (`Id_rango`) REFERENCES `rango` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Id region` FOREIGN KEY (`Id_region`) REFERENCES `region` (`Id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_juego_favorito`
--
ALTER TABLE `usuario_juego_favorito`
  ADD CONSTRAINT `fk_juego` FOREIGN KEY (`Id_juego`) REFERENCES `juegos` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`Id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
