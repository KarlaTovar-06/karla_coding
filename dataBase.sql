CREATE TABLE `usuarios` (
    `id` int(50) PRIMARY KEY AUTO_INCREMENT,
    `nombre_completo` varchar(50) NOT NULL,
    `correo` varchar(50) NOT NULL,
    `usuario` varchar(50) NOT NULL,
    `contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS pais(
    idPais INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    codigo CHARACTER(2),
    nombre VARCHAR(60) NOT NULL
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS estado(
    nukidestado INT NOT NULL,
    chd_estado VARCHAR(50),
    idPais INT NOT NULL
    -- PRIMARY KEY (nukidestado)
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS municipio(
    nukidmunicipio INT NOT NULL,
    nukidestado INT,
    chd_municipio VARCHAR(120)
    -- PRIMARY KEY (nukidmunicipio)
    -- FOREIGN KEY (nukidestado) REFERENCES estado(nukidestado) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS colonia(
    nukidcolonia INT NOT NULL,
    nukidmunicipio INT,
    chcodigo_postal CHARACTER(5),
    chdescripcion character(120)
    -- PRIMARY KEY (nukidcolonia)
    -- FOREIGN KEY (nukidmunicipio) REFERENCES municipio(nukidmunicipio) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS ubicacion(
    idUbicacion INT AUTO_INCREMENT NOT NULL, 
    ubicacion_url VARCHAR(250) NOT NULL,
    calleNum VARCHAR(50) NOT NULL,
    idColonia INT NOT NULL,
    idMunicipio INT NOT NULL,
    idEstado INT NOT NULL,
    PRIMARY KEY (idUbicacion),
    FOREIGN KEY (idColonia) REFERENCES colonia(nukidcolonia) ON DELETE RESTRICT,
    FOREIGN KEY (idMunicipio) REFERENCES municipio(nukidmunicipio) ON DELETE RESTRICT,
	FOREIGN KEY (idEstado) REFERENCES estado(nukidestado) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS personaje(
    idPersonaje INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nomPer VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    apellido2 VARCHAR(45),
    fechaNac DATE,
    idPais INT,
    informacion TEXT NOT NULL,
    FOREIGN KEY (idPais) REFERENCES pais(idPais) ON DELETE RESTRICT 
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS espacioUrbano(
    id INT PRIMARY KEY AUTO_INCREMENT,
    espacioUrbNom TEXT NOT NULL,
    periodoConstruc TEXT NOT NULL,
    funcion TEXT NOT NULL,
    idArquitecto INT,
    idUbicacion INT NOT NULL,
    contextoHistorico TEXT NOT NULL,
    descripUrb_idDescripUrb  INT NOT NULL,
    transformaciones TEXT NOT NULL,
    principiosDiseño TEXT NOT NULL,
    importancia TEXT,
    FOREIGN KEY (idArquitecto) REFERENCES personaje(idPersonaje) ON DELETE RESTRICT,
    FOREIGN KEY (idUbicacion) REFERENCES ubicacion(idUbicacion) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS descripUrbano(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEspacioUrb INT NOT NULL,
    planUrbanistico TEXT,
    caracteristicas TEXT,
    orientacion VARCHAR(500),
    dimensiones VARCHAR(250),
    secciones TEXT,
    elementos TEXT,
    tiposEdifRodeando TEXT,
    FOREIGN KEY (idEspacioUrb) REFERENCES espacioUrbano(id)
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS generos(
    idGenero INT PRIMARY KEY AUTO_INCREMENT,
    nombreGenero VARCHAR(35) NOT NULL
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS edificio(
    idEdificio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    idGeneroEdif INT NOT NULL,
    usoActual TEXT,
    fechaConstruc DATE,
    idArquitecto INT,
    idUbicacion int NOT NULL,
    contextoHistorico TEXT NOT NULL,
    concepto TEXT,
    -- Plantas son imagenes
    -- Fachadas y ornamentos son imagenes
    corrienteEst TEXT,
    materialYSistem TEXT,
    contextoUrbano TEXT,
    transformaciones TEXT,
    FOREIGN KEY (idArquitecto) REFERENCES personaje(idPersonaje) ON DELETE RESTRICT,
    FOREIGN KEY (idUbicacion) REFERENCES ubicacion(idUbicacion) ON DELETE RESTRICT,
    FOREIGN KEY (idGeneroEdif) REFERENCES generos(idGenero) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS imagenesEdificios(
    idImagen INT PRIMARY KEY AUTO_INCREMENT,
    idSeccion CHARACTER(2),
    idEdificio INT NOT NULL,
    imagen LONGBLOB NOT NULL,
    FOREIGN KEY (idEdificio) REFERENCES edificio(idEdificio) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS imagenesEspacios(
    idImagen INT PRIMARY KEY AUTO_INCREMENT,
    idSeccion CHARACTER(2),
    idEspacio INT NOT NULL,
    imagen LONGBLOB NOT NULL,
    FOREIGN KEY (idEspacio) REFERENCES espacioUrbano(id) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS imagenesBiografias(
    idImagen INT PRIMARY KEY AUTO_INCREMENT,
    idPersonaje INT NOT NULL,
    imagen LONGBLOB NOT NULL,
    FOREIGN KEY (idPersonaje) REFERENCES personaje(idPersonaje) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS arquitectosEdificio(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEdificio INT NOT NULL,
    idPersonaje INT NOT NULL,
    FOREIGN KEY (idEdificio) REFERENCES edificio(idEdificio) ON DELETE RESTRICT,
    FOREIGN KEY (idPersonaje) REFERENCES personaje(idPersonaje) ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS arquitectosEspacio(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEspacioUrb INT NOT NULL,
    idPersonaje INT NOT NULL,
    FOREIGN KEY (idEspacio) REFERENCES espacioUrbano(id) ON DELETE RESTRICT,
    FOREIGN KEY (idPersonaje) REFERENCES personaje(idPersonaje) ON DELETE RESTRICT
)ENGINE = INNODB;

-- CREATE TABLE IF NOT EXISTS obra(
--     idObra INT AUTO_INCREMENT NOT NULL,
--     nomObra VARCHAR(200) NOT NULL,
--     fechaRealizo DATE NOT NULL,
--     idUbicacion INT NOT NULL,
--     idPersonaje INT NOT NULL,
--     PRIMARY KEY (idObra),
--     FOREIGN KEY (idUbicacion) REFERENCES ubicacion(idUbicacion) ON DELETE RESTRICT,
--     FOREIGN KEY (idPersonaje) REFERENCES biografia(idPersonaje) ON DELETE RESTRICT
-- )ENGINE = INNODB;

-----------------------------------------------------------------------------------------------------------
INSERT INTO `pais` VALUES(1, 'AF', 'Afganistán');
INSERT INTO `pais` VALUES(2, 'AX', 'Islas Gland');
INSERT INTO `pais` VALUES(3, 'AL', 'Albania');
INSERT INTO `pais` VALUES(4, 'DE', 'Alemania');
INSERT INTO `pais` VALUES(5, 'AD', 'Andorra');
INSERT INTO `pais` VALUES(6, 'AO', 'Angola');
INSERT INTO `pais` VALUES(7, 'AI', 'Anguilla');
INSERT INTO `pais` VALUES(8, 'AQ', 'Antártida');
INSERT INTO `pais` VALUES(9, 'AG', 'Antigua y Barbuda');
INSERT INTO `pais` VALUES(10, 'AN', 'Antillas Holandesas');
INSERT INTO `pais` VALUES(11, 'SA', 'Arabia Saudí');
INSERT INTO `pais` VALUES(12, 'DZ', 'Argelia');
INSERT INTO `pais` VALUES(13, 'AR', 'Argentina');
INSERT INTO `pais` VALUES(14, 'AM', 'Armenia');
INSERT INTO `pais` VALUES(15, 'AW', 'Aruba');
INSERT INTO `pais` VALUES(16, 'AU', 'Australia');
INSERT INTO `pais` VALUES(17, 'AT', 'Austria');
INSERT INTO `pais` VALUES(18, 'AZ', 'Azerbaiyán');
INSERT INTO `pais` VALUES(19, 'BS', 'Bahamas');
INSERT INTO `pais` VALUES(20, 'BH', 'Bahréin');
INSERT INTO `pais` VALUES(21, 'BD', 'Bangladesh');
INSERT INTO `pais` VALUES(22, 'BB', 'Barbados');
INSERT INTO `pais` VALUES(23, 'BY', 'Bielorrusia');
INSERT INTO `pais` VALUES(24, 'BE', 'Bélgica');
INSERT INTO `pais` VALUES(25, 'BZ', 'Belice');
INSERT INTO `pais` VALUES(26, 'BJ', 'Benin');
INSERT INTO `pais` VALUES(27, 'BM', 'Bermudas');
INSERT INTO `pais` VALUES(28, 'BT', 'Bhután');
INSERT INTO `pais` VALUES(29, 'BO', 'Bolivia');
INSERT INTO `pais` VALUES(30, 'BA', 'Bosnia y Herzegovina');
INSERT INTO `pais` VALUES(31, 'BW', 'Botsuana');
INSERT INTO `pais` VALUES(32, 'BV', 'Isla Bouvet');
INSERT INTO `pais` VALUES(33, 'BR', 'Brasil');
INSERT INTO `pais` VALUES(34, 'BN', 'Brunéi');
INSERT INTO `pais` VALUES(35, 'BG', 'Bulgaria');
INSERT INTO `pais` VALUES(36, 'BF', 'Burkina Faso');
INSERT INTO `pais` VALUES(37, 'BI', 'Burundi');
INSERT INTO `pais` VALUES(38, 'CV', 'Cabo Verde');
INSERT INTO `pais` VALUES(39, 'KY', 'Islas Caimán');
INSERT INTO `pais` VALUES(40, 'KH', 'Camboya');
INSERT INTO `pais` VALUES(41, 'CM', 'Camerún');
INSERT INTO `pais` VALUES(42, 'CA', 'Canadá');
INSERT INTO `pais` VALUES(43, 'CF', 'República Centroafricana');
INSERT INTO `pais` VALUES(44, 'TD', 'Chad');
INSERT INTO `pais` VALUES(45, 'CZ', 'República Checa');
INSERT INTO `pais` VALUES(46, 'CL', 'Chile');
INSERT INTO `pais` VALUES(47, 'CN', 'China');
INSERT INTO `pais` VALUES(48, 'CY', 'Chipre');
INSERT INTO `pais` VALUES(49, 'CX', 'Isla de Navidad');
INSERT INTO `pais` VALUES(50, 'VA', 'Ciudad del Vaticano');
INSERT INTO `pais` VALUES(51, 'CC', 'Islas Cocos');
INSERT INTO `pais` VALUES(52, 'CO', 'Colombia');
INSERT INTO `pais` VALUES(53, 'KM', 'Comoras');
INSERT INTO `pais` VALUES(54, 'CD', 'República Democrática del Congo');
INSERT INTO `pais` VALUES(55, 'CG', 'Congo');
INSERT INTO `pais` VALUES(56, 'CK', 'Islas Cook');
INSERT INTO `pais` VALUES(57, 'KP', 'Corea del Norte');
INSERT INTO `pais` VALUES(58, 'KR', 'Corea del Sur');
INSERT INTO `pais` VALUES(59, 'CI', 'Costa de Marfil');
INSERT INTO `pais` VALUES(60, 'CR', 'Costa Rica');
INSERT INTO `pais` VALUES(61, 'HR', 'Croacia');
INSERT INTO `pais` VALUES(62, 'CU', 'Cuba');
INSERT INTO `pais` VALUES(63, 'DK', 'Dinamarca');
INSERT INTO `pais` VALUES(64, 'DM', 'Dominica');
INSERT INTO `pais` VALUES(65, 'DO', 'República Dominicana');
INSERT INTO `pais` VALUES(66, 'EC', 'Ecuador');
INSERT INTO `pais` VALUES(67, 'EG', 'Egipto');
INSERT INTO `pais` VALUES(68, 'SV', 'El Salvador');
INSERT INTO `pais` VALUES(69, 'AE', 'Emiratos Árabes Unidos');
INSERT INTO `pais` VALUES(70, 'ER', 'Eritrea');
INSERT INTO `pais` VALUES(71, 'SK', 'Eslovaquia');
INSERT INTO `pais` VALUES(72, 'SI', 'Eslovenia');
INSERT INTO `pais` VALUES(73, 'ES', 'España');
INSERT INTO `pais` VALUES(74, 'UM', 'Islas ultramarinas de Estados Unidos');
INSERT INTO `pais` VALUES(75, 'US', 'Estados Unidos');
INSERT INTO `pais` VALUES(76, 'EE', 'Estonia');
INSERT INTO `pais` VALUES(77, 'ET', 'Etiopía');
INSERT INTO `pais` VALUES(78, 'FO', 'Islas Feroe');
INSERT INTO `pais` VALUES(79, 'PH', 'Filipinas');
INSERT INTO `pais` VALUES(80, 'FI', 'Finlandia');
INSERT INTO `pais` VALUES(81, 'FJ', 'Fiyi');
INSERT INTO `pais` VALUES(82, 'FR', 'Francia');
INSERT INTO `pais` VALUES(83, 'GA', 'Gabón');
INSERT INTO `pais` VALUES(84, 'GM', 'Gambia');
INSERT INTO `pais` VALUES(85, 'GE', 'Georgia');
INSERT INTO `pais` VALUES(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur');
INSERT INTO `pais` VALUES(87, 'GH', 'Ghana');
INSERT INTO `pais` VALUES(88, 'GI', 'Gibraltar');
INSERT INTO `pais` VALUES(89, 'GD', 'Granada');
INSERT INTO `pais` VALUES(90, 'GR', 'Grecia');
INSERT INTO `pais` VALUES(91, 'GL', 'Groenlandia');
INSERT INTO `pais` VALUES(92, 'GP', 'Guadalupe');
INSERT INTO `pais` VALUES(93, 'GU', 'Guam');
INSERT INTO `pais` VALUES(94, 'GT', 'Guatemala');
INSERT INTO `pais` VALUES(95, 'GF', 'Guayana Francesa');
INSERT INTO `pais` VALUES(96, 'GN', 'Guinea');
INSERT INTO `pais` VALUES(97, 'GQ', 'Guinea Ecuatorial');
INSERT INTO `pais` VALUES(98, 'GW', 'Guinea-Bissau');
INSERT INTO `pais` VALUES(99, 'GY', 'Guyana');
INSERT INTO `pais` VALUES(100, 'HT', 'Haití');
INSERT INTO `pais` VALUES(101, 'HM', 'Islas Heard y McDonald');
INSERT INTO `pais` VALUES(102, 'HN', 'Honduras');
INSERT INTO `pais` VALUES(103, 'HK', 'Hong Kong');
INSERT INTO `pais` VALUES(104, 'HU', 'Hungría');
INSERT INTO `pais` VALUES(105, 'IN', 'India');
INSERT INTO `pais` VALUES(106, 'ID', 'Indonesia');
INSERT INTO `pais` VALUES(107, 'IR', 'Irán');
INSERT INTO `pais` VALUES(108, 'IQ', 'Iraq');
INSERT INTO `pais` VALUES(109, 'IE', 'Irlanda');
INSERT INTO `pais` VALUES(110, 'IS', 'Islandia');
INSERT INTO `pais` VALUES(111, 'IL', 'Israel');
INSERT INTO `pais` VALUES(112, 'IT', 'Italia');
INSERT INTO `pais` VALUES(113, 'JM', 'Jamaica');
INSERT INTO `pais` VALUES(114, 'JP', 'Japón');
INSERT INTO `pais` VALUES(115, 'JO', 'Jordania');
INSERT INTO `pais` VALUES(116, 'KZ', 'Kazajstán');
INSERT INTO `pais` VALUES(117, 'KE', 'Kenia');
INSERT INTO `pais` VALUES(118, 'KG', 'Kirguistán');
INSERT INTO `pais` VALUES(119, 'KI', 'Kiribati');
INSERT INTO `pais` VALUES(120, 'KW', 'Kuwait');
INSERT INTO `pais` VALUES(121, 'LA', 'Laos');
INSERT INTO `pais` VALUES(122, 'LS', 'Lesotho');
INSERT INTO `pais` VALUES(123, 'LV', 'Letonia');
INSERT INTO `pais` VALUES(124, 'LB', 'Líbano');
INSERT INTO `pais` VALUES(125, 'LR', 'Liberia');
INSERT INTO `pais` VALUES(126, 'LY', 'Libia');
INSERT INTO `pais` VALUES(127, 'LI', 'Liechtenstein');
INSERT INTO `pais` VALUES(128, 'LT', 'Lituania');
INSERT INTO `pais` VALUES(129, 'LU', 'Luxemburgo');
INSERT INTO `pais` VALUES(130, 'MO', 'Macao');
INSERT INTO `pais` VALUES(131, 'MK', 'ARY Macedonia');
INSERT INTO `pais` VALUES(132, 'MG', 'Madagascar');
INSERT INTO `pais` VALUES(133, 'MY', 'Malasia');
INSERT INTO `pais` VALUES(134, 'MW', 'Malawi');
INSERT INTO `pais` VALUES(135, 'MV', 'Maldivas');
INSERT INTO `pais` VALUES(136, 'ML', 'Malí');
INSERT INTO `pais` VALUES(137, 'MT', 'Malta');
INSERT INTO `pais` VALUES(138, 'FK', 'Islas Malvinas');
INSERT INTO `pais` VALUES(139, 'MP', 'Islas Marianas del Norte');
INSERT INTO `pais` VALUES(140, 'MA', 'Marruecos');
INSERT INTO `pais` VALUES(141, 'MH', 'Islas Marshall');
INSERT INTO `pais` VALUES(142, 'MQ', 'Martinica');
INSERT INTO `pais` VALUES(143, 'MU', 'Mauricio');
INSERT INTO `pais` VALUES(144, 'MR', 'Mauritania');
INSERT INTO `pais` VALUES(145, 'YT', 'Mayotte');
INSERT INTO `pais` VALUES(146, 'MX', 'México');
INSERT INTO `pais` VALUES(147, 'FM', 'Micronesia');
INSERT INTO `pais` VALUES(148, 'MD', 'Moldavia');
INSERT INTO `pais` VALUES(149, 'MC', 'Mónaco');
INSERT INTO `pais` VALUES(150, 'MN', 'Mongolia');
INSERT INTO `pais` VALUES(151, 'MS', 'Montserrat');
INSERT INTO `pais` VALUES(152, 'MZ', 'Mozambique');
INSERT INTO `pais` VALUES(153, 'MM', 'Myanmar');
INSERT INTO `pais` VALUES(154, 'NA', 'Namibia');
INSERT INTO `pais` VALUES(155, 'NR', 'Nauru');
INSERT INTO `pais` VALUES(156, 'NP', 'Nepal');
INSERT INTO `pais` VALUES(157, 'NI', 'Nicaragua');
INSERT INTO `pais` VALUES(158, 'NE', 'Níger');
INSERT INTO `pais` VALUES(159, 'NG', 'Nigeria');
INSERT INTO `pais` VALUES(160, 'NU', 'Niue');
INSERT INTO `pais` VALUES(161, 'NF', 'Isla Norfolk');
INSERT INTO `pais` VALUES(162, 'NO', 'Noruega');
INSERT INTO `pais` VALUES(163, 'NC', 'Nueva Caledonia');
INSERT INTO `pais` VALUES(164, 'NZ', 'Nueva Zelanda');
INSERT INTO `pais` VALUES(165, 'OM', 'Omán');
INSERT INTO `pais` VALUES(166, 'NL', 'Países Bajos');
INSERT INTO `pais` VALUES(167, 'PK', 'Pakistán');
INSERT INTO `pais` VALUES(168, 'PW', 'Palau');
INSERT INTO `pais` VALUES(169, 'PS', 'Palestina');
INSERT INTO `pais` VALUES(170, 'PA', 'Panamá');
INSERT INTO `pais` VALUES(171, 'PG', 'Papúa Nueva Guinea');
INSERT INTO `pais` VALUES(172, 'PY', 'Paraguay');
INSERT INTO `pais` VALUES(173, 'PE', 'Perú');
INSERT INTO `pais` VALUES(174, 'PN', 'Islas Pitcairn');
INSERT INTO `pais` VALUES(175, 'PF', 'Polinesia Francesa');
INSERT INTO `pais` VALUES(176, 'PL', 'Polonia');
INSERT INTO `pais` VALUES(177, 'PT', 'Portugal');
INSERT INTO `pais` VALUES(178, 'PR', 'Puerto Rico');
INSERT INTO `pais` VALUES(179, 'QA', 'Qatar');
INSERT INTO `pais` VALUES(180, 'GB', 'Reino Unido');
INSERT INTO `pais` VALUES(181, 'RE', 'Reunión');
INSERT INTO `pais` VALUES(182, 'RW', 'Ruanda');
INSERT INTO `pais` VALUES(183, 'RO', 'Rumania');
INSERT INTO `pais` VALUES(184, 'RU', 'Rusia');
INSERT INTO `pais` VALUES(185, 'EH', 'Sahara Occidental');
INSERT INTO `pais` VALUES(186, 'SB', 'Islas Salomón');
INSERT INTO `pais` VALUES(187, 'WS', 'Samoa');
INSERT INTO `pais` VALUES(188, 'AS', 'Samoa Americana');
INSERT INTO `pais` VALUES(189, 'KN', 'San Cristóbal y Nevis');
INSERT INTO `pais` VALUES(190, 'SM', 'San Marino');
INSERT INTO `pais` VALUES(191, 'PM', 'San Pedro y Miquelón');
INSERT INTO `pais` VALUES(192, 'VC', 'San Vicente y las Granadinas');
INSERT INTO `pais` VALUES(193, 'SH', 'Santa Helena');
INSERT INTO `pais` VALUES(194, 'LC', 'Santa Lucía');
INSERT INTO `pais` VALUES(195, 'ST', 'Santo Tomé y Príncipe');
INSERT INTO `pais` VALUES(196, 'SN', 'Senegal');
INSERT INTO `pais` VALUES(197, 'CS', 'Serbia y Montenegro');
INSERT INTO `pais` VALUES(198, 'SC', 'Seychelles');
INSERT INTO `pais` VALUES(199, 'SL', 'Sierra Leona');
INSERT INTO `pais` VALUES(200, 'SG', 'Singapur');
INSERT INTO `pais` VALUES(201, 'SY', 'Siria');
INSERT INTO `pais` VALUES(202, 'SO', 'Somalia');
INSERT INTO `pais` VALUES(203, 'LK', 'Sri Lanka');
INSERT INTO `pais` VALUES(204, 'SZ', 'Suazilandia');
INSERT INTO `pais` VALUES(205, 'ZA', 'Sudáfrica');
INSERT INTO `pais` VALUES(206, 'SD', 'Sudán');
INSERT INTO `pais` VALUES(207, 'SE', 'Suecia');
INSERT INTO `pais` VALUES(208, 'CH', 'Suiza');
INSERT INTO `pais` VALUES(209, 'SR', 'Surinam');
INSERT INTO `pais` VALUES(210, 'SJ', 'Svalbard y Jan Mayen');
INSERT INTO `pais` VALUES(211, 'TH', 'Tailandia');
INSERT INTO `pais` VALUES(212, 'TW', 'Taiwán');
INSERT INTO `pais` VALUES(213, 'TZ', 'Tanzania');
INSERT INTO `pais` VALUES(214, 'TJ', 'Tayikistán');
INSERT INTO `pais` VALUES(215, 'IO', 'Territorio Británico del Océano Índico');
INSERT INTO `pais` VALUES(216, 'TF', 'Territorios Australes Franceses');
INSERT INTO `pais` VALUES(217, 'TL', 'Timor Oriental');
INSERT INTO `pais` VALUES(218, 'TG', 'Togo');
INSERT INTO `pais` VALUES(219, 'TK', 'Tokelau');
INSERT INTO `pais` VALUES(220, 'TO', 'Tonga');
INSERT INTO `pais` VALUES(221, 'TT', 'Trinidad y Tobago');
INSERT INTO `pais` VALUES(222, 'TN', 'Túnez');
INSERT INTO `pais` VALUES(223, 'TC', 'Islas Turcas y Caicos');
INSERT INTO `pais` VALUES(224, 'TM', 'Turkmenistán');
INSERT INTO `pais` VALUES(225, 'TR', 'Turquía');
INSERT INTO `pais` VALUES(226, 'TV', 'Tuvalu');
INSERT INTO `pais` VALUES(227, 'UA', 'Ucrania');
INSERT INTO `pais` VALUES(228, 'UG', 'Uganda');
INSERT INTO `pais` VALUES(229, 'UY', 'Uruguay');
INSERT INTO `pais` VALUES(230, 'UZ', 'Uzbekistán');
INSERT INTO `pais` VALUES(231, 'VU', 'Vanuatu');
INSERT INTO `pais` VALUES(232, 'VE', 'Venezuela');
INSERT INTO `pais` VALUES(233, 'VN', 'Vietnam');
INSERT INTO `pais` VALUES(234, 'VG', 'Islas Vírgenes Británicas');
INSERT INTO `pais` VALUES(235, 'VI', 'Islas Vírgenes de los Estados Unidos');
INSERT INTO `pais` VALUES(236, 'WF', 'Wallis y Futuna');
INSERT INTO `pais` VALUES(237, 'YE', 'Yemen');
INSERT INTO `pais` VALUES(238, 'DJ', 'Yibuti');
INSERT INTO `pais` VALUES(239, 'ZM', 'Zambia');
INSERT INTO `pais` VALUES(240, 'ZW', 'Zimbabue');