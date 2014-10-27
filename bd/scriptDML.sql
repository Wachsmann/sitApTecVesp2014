-- -----------------------------------------------------
-- Data for table `sitap`.`tbl_usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`tbl_usuario` (`idusuario`, `nome`, `senha`, `email`, `foto`, `sexo`, `cidade`, `estado`, `endereco`, `cep`) VALUES (2, 'Gilverton Gerverson', '1234', 'Gilverton@gil.com', 'http://lorempixel.com/output/nightlife-q-c-333-333-3.jpg', 'm', 'Brunopolis', 'Bunbameuboi', 'Bomximbomximbombombom', '882909382');
INSERT INTO `sitap`.`tbl_usuario` (`idusuario`, `nome`, `senha`, `email`, `foto`, `sexo`, `cidade`, `estado`, `endereco`, `cep`) VALUES (0, 'Anonimo', NULL, 'anonimo@anonimo.com', 'http://lorempixel.com/output/nightlife-q-c-333-333-3.jpg', 'm', 'anonimo', 'anonimo', 'anonimo', 'anonimo');
INSERT INTO `sitap`.`tbl_usuario` (`idusuario`, `nome`, `senha`, `email`, `foto`, `sexo`, `cidade`, `estado`, `endereco`, `cep`) VALUES (3, 'Cacilda', '4321', 'cacilda@cacilda.com', 'http://lorempixel.com/output/nightlife-q-c-333-333-3.jpg', 'f', 'Calcinopolis', NULL, NULL, NULL);
INSERT INTO `sitap`.`tbl_usuario` (`idusuario`, `nome`, `senha`, `email`, `foto`, `sexo`, `cidade`, `estado`, `endereco`, `cep`) VALUES (1, 'Admin', '1234', 'admin@admin.com', 'http://lorempixel.com/output/nightlife-q-c-333-333-3.jpg', 'm', 'Brusque', 'Brusque', 'Brusque', '889282899');
INSERT INTO `sitap`.`tbl_usuario` (`idusuario`, `nome`, `senha`, `email`, `foto`, `sexo`, `cidade`, `estado`, `endereco`, `cep`) VALUES (NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sitap`.`tbl_artigo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`tbl_artigo` (`id`, `titulo`, `corpo`, `data`, `idusuario`, `like`) VALUES (1, 'Pizza', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ultricies dignissim nunc nec pretium. Integer tincidunt eros vitae metus vehicula mattis. Mauris lacinia malesuada arcu, non tempus neque fringilla elementum. Fusce dapibus sapien eget magna hendrerit tempor. Ut id orci id nunc ultrices pellentesque. Aliquam dolor purus, tincidunt vel facilisis ut, placerat id mauris. Pellentesque ut dui et diam dignissim malesuada. Phasellus a mauris at tortor maximus pharetra sit amet ac nisl. Donec lobortis ultricies dolor, id pellentesque sem placerat sed. In gravida ante id euismod sodales. Donec nec ornare orci. Proin eget scelerisque justo. Nam efficitur elit vitae ex placerat ullamcorper. Integer dignissim tincidunt dictum. Etiam lacus augue, sodales in rutrum sed, semper ut nunc.</p> ', '2014-10-27 16:48', NULL, NULL);
INSERT INTO `sitap`.`tbl_artigo` (`id`, `titulo`, `corpo`, `data`, `idusuario`, `like`) VALUES (2, 'Bacon', '<p>Bacon ipsum dolor amet pig ball tip venison tail biltong landjaeger ham boudin tri-tip short loin. Chicken salami shankle rump drumstick, t-bone landjaeger kevin bacon andouille. Pork loin turducken tongue, short loin pastrami pancetta drumstick ball tip beef chicken beef ribs cow fatback. Chuck frankfurter tenderloin ribeye t-bone doner flank strip steak short ribs.</p>', '2014-10-27 16:48', NULL, NULL);
INSERT INTO `sitap`.`tbl_artigo` (`id`, `titulo`, `corpo`, `data`, `idusuario`, `like`) VALUES (NULL, NULL, NULL, '2014-10-27 16:48', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sitap`.`tbl_fotos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`tbl_fotos` (`id`, `fotos`, `idartigo`) VALUES (1, 'http://lorempizza.com/i/714/300', NULL);
INSERT INTO `sitap`.`tbl_fotos` (`id`, `fotos`, `idartigo`) VALUES (NULL, 'http://baconmockup.com/300/200', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sitap`.`tbl_categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`tbl_categoria` (`id`, `nome`, `descricao`) VALUES (1, 'Pizza', 'Categoria que fala sobre pizzas');
INSERT INTO `sitap`.`tbl_categoria` (`id`, `nome`, `descricao`) VALUES (2, 'Video Game', 'Categoria que fala sobre refrigerantes');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sitap`.`tbl_comentario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`tbl_comentario` (`idcomentario`, `idusuario`, `idartigo`, `corpo`, `data`) VALUES (1, 0, 1, 'UULULULULULLULULULULU', '2014-10-27 16:48');
INSERT INTO `sitap`.`tbl_comentario` (`idcomentario`, `idusuario`, `idartigo`, `corpo`, `data`) VALUES (2, 3, 1, 'very nice tichi', '2014-10-27 16:48');

COMMIT;

