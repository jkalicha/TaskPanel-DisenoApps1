INSERT INTO TaskPanelDB.dbo.Usuarios (Nombre,Apellido,Email,FechaNacimiento,EsAdministrador,Contrasenia) VALUES
	 (N'Joaquin',N'Kalichman',N'adminprec@gmail.com','2004-02-10 00:00:00.0000000',1,N'AdminPrec1234#'),
	 (N'Juan Pedro',N'Michelini',N'juanpemiche@gmail.com','2000-01-01 00:00:00.0000000',0,N'Juanpemiche123#'),
	 (N'Renzo',N'Donagrandi',N'rendonagrandi@gmail.com','2000-01-01 00:00:00.0000000',0,N'Renzo1234#');
INSERT INTO TaskPanelDB.dbo.Equipos (Nombre,FechaCreacion,DescripcionTareas,CantMaxUsuarios,CreadorId) VALUES
	 (N'Subve','2024-11-20 10:35:24.3595273',N'La subve FC',5,1),
	 (N'Equipo1','2024-11-20 10:55:43.4709145',N'Equipo1 Descripcion',2,1),
	 (N'Equipo2','2024-11-20 10:56:19.1038738',N'Descripcion Equipo2',3,1),
	 (N'Equipo3','2024-11-20 10:56:46.6427981',N'Descripcion Equipo3',2,1),
	 (N'Equipo4','2024-11-20 10:57:10.0070259',N'Descripcion Equipo4',14,1),
	 (N'Equipo5','2024-11-20 10:58:09.6481913',N'Descripcion Equipo5',19,1),
	 (N'Equipo6','2024-11-20 10:58:29.4845296',N'Descripcion Equipo6',99,1),
	 (N'Equipo7','2024-11-20 10:58:47.8200036',N'Descripcion Equipo7',98,1),
	 (N'Equipo8','2024-11-20 10:59:09.2116292',N'Descripcion Equipo8',54,1),
	 (N'Equipo9','2024-11-20 10:59:29.5297420',N'Descripcion Equipo9',31,1);
INSERT INTO TaskPanelDB.dbo.Paneles (Nombre,EquipoId,Descripcion) VALUES
	 (N'El Panel de la Subve',1,N'Salir campeones otra vez'),
	 (N'El Panel de Equipo1',2,N'Este es un buen panel'),
	 (N'El Panel de Equipo2',3,N'Este en un gran panel'),
	 (N'El Panel de Equipo3',4,N'Este es un excelente Panel'),
	 (N'El Panel de Equipo4',5,N'Este es un Panel regular'),
	 (N'El Panel de Equipo5',6,N'Este un un panel promedio');
INSERT INTO TaskPanelDB.dbo.Epicas (Titulo,Descripcion,FechaVencimiento,PanelId,EsfuerzoEstimado,EsfuerzoInvertido,Prioridad) VALUES
	 (N'Epica del panel de la subve',N'Epica grande','2025-01-31 00:00:00.0000000',1,22,5,1),
	 (N'Epica v2 del panel de la subve',N'Es gran epica','2025-01-14 00:00:00.0000000',1,0,0,1),
	 (N'Epica del Equipo1',N'Esta es una prueba','2025-01-16 00:00:00.0000000',2,10,2,1);
INSERT INTO TaskPanelDB.dbo.Tareas (Titulo,Prioridad,Descripcion,FechaVencimiento,UsuarioIdPapelera,PanelId,EstaVencida,EstaActiva,EpicaId,EsfuerzoEstimado,EsfuerzoInvertido,PanelIdOriginal,EpicaIdOriginal) VALUES
	 (N'tarea1 epica subve',1,N'tarea1 epica subve1','2024-11-21 11:06:05.3877363',NULL,NULL,0,1,1,18,4,NULL,NULL),
	 (N'tarea2 epica subve',0,N'tarea2 epica subve1','2024-11-21 11:08:18.6768107',NULL,NULL,0,1,1,0,0,NULL,NULL),
	 (N'tarea3 epica subve1',0,N'tarea3 epica subve1','2025-11-21 00:00:00.0000000',NULL,NULL,0,1,1,0,0,NULL,NULL),
	 (N'tarea4 epica subve1',0,N'tarea4 epica subve1','2024-11-21 11:08:58.5800198',NULL,NULL,0,1,1,0,0,NULL,NULL),
	 (N'tarea5 epica subve1',0,N'tarea5 epica subve','2026-11-21 00:00:00.0000000',NULL,NULL,0,1,1,4,1,NULL,NULL),
	 (N'tarea6 epica subve1',0,N'tarea6 epica subve1','2027-11-21 00:00:00.0000000',NULL,NULL,0,1,1,0,0,NULL,NULL),
	 (N'tarea7 epica subve1',0,N'tarea7 epica subve1','2024-11-21 11:10:09.3134695',NULL,NULL,0,1,1,0,0,NULL,NULL),
	 (N'tarea8 epica subve1',0,N'tarea8 epica subve1','2029-11-21 00:00:00.0000000',NULL,NULL,0,1,1,0,0,NULL,NULL),
	 (N'tarea9 epica subve1',0,N'tarea9 epica subve1','2030-11-21 00:00:00.0000000',NULL,NULL,0,1,1,0,0,NULL,NULL),
	 (N'tarea10 subve',0,N'tarea sin epica','2029-11-21 00:00:00.0000000',NULL,1,0,1,NULL,0,0,NULL,NULL);
INSERT INTO TaskPanelDB.dbo.Tareas (Titulo,Prioridad,Descripcion,FechaVencimiento,UsuarioIdPapelera,PanelId,EstaVencida,EstaActiva,EpicaId,EsfuerzoEstimado,EsfuerzoInvertido,PanelIdOriginal,EpicaIdOriginal) VALUES
	 (N'tarea 1 epicaEquipo1',0,N'tarea 1 epicaEquipo1','2025-11-21 00:00:00.0000000',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 2 epicaEquipo1',0,N'tarea 2 epicaEquipo1','2026-11-21 00:00:00.0000000',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 3 epicaEquipo1',0,N'tarea 3 epicaEquipo1','2027-11-21 00:00:00.0000000',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 4 epicaEquipo1',0,N'tarea 4 epicaEquipo1','2028-11-21 00:00:00.0000000',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 5 epicaEquipo1',0,N'tarea 5 epicaEquipo1','2030-11-21 00:00:00.0000000',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 6 epicaEquipo1',0,N'tarea 6 epicaEquipo1','2024-11-21 11:13:50.2511847',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 7 epicaEquipo1',0,N'tarea 7 epicaEquipo1','2024-11-21 11:14:08.2713192',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 8 epicaEquipo1',0,N'tarea 8 epicaEquipo1','2024-11-21 11:14:21.2084666',NULL,NULL,0,1,3,0,0,NULL,NULL),
	 (N'tarea 9 epicaEquipo1',0,N'tarea 9 epicaEquipo1','2024-11-21 11:15:06.9171724',NULL,NULL,0,1,3,10,2,NULL,NULL),
	 (N'tarea10 equipo1 sin epica',0,N'tarea10 equipo1 sin epica','2025-11-21 00:00:00.0000000',NULL,2,0,1,NULL,0,0,NULL,NULL);
INSERT INTO TaskPanelDB.dbo.Comentarios (Explicacion,Resuelto,FechaResolucion,UsuarioCreadorId,TareaId,UsuarioQueResolvioId) VALUES
	 (N'comentario1',1,'2024-11-20 11:17:13.8282401',1,10,1),
	 (N'comentario2',0,'0001-01-01 00:00:00.0000000',1,10,NULL),
	 (N'comentario3',0,'0001-01-01 00:00:00.0000000',1,10,NULL),
	 (N'comentario4',0,'0001-01-01 00:00:00.0000000',1,10,NULL),
	 (N'comentario5',0,'0001-01-01 00:00:00.0000000',1,10,NULL),
	 (N'comentario6',0,'0001-01-01 00:00:00.0000000',1,10,NULL),
	 (N'comentario7',1,'2024-11-20 11:17:45.7832695',1,20,1),
	 (N'comentario8',0,'0001-01-01 00:00:00.0000000',1,20,NULL),
	 (N'comentario9',0,'0001-01-01 00:00:00.0000000',1,20,NULL),
	 (N'comentario10',0,'0001-01-01 00:00:00.0000000',1,20,NULL);
INSERT INTO TaskPanelDB.dbo.Notificaciones (ComentarioResueltoId,Mensaje,UsuarioANotificarId) VALUES
	 (3,N'Joaquin, su comentario sobre |comentario1| ha sido resuelto.',1),
	 (9,N'Joaquin, su comentario sobre |comentario7| ha sido resuelto.',1);
INSERT INTO TaskPanelDB.dbo.EquipoUsuario (EquiposId,ListaUsuariosId) VALUES
	 (1,1),
	 (2,1),
	 (3,1),
	 (4,1),
	 (5,1),
	 (6,1),
	 (8,1),
	 (9,1),
	 (10,1),
	 (1,2);
INSERT INTO TaskPanelDB.dbo.EquipoUsuario (EquiposId,ListaUsuariosId) VALUES
	 (2,2),
	 (3,2),
	 (5,2),
	 (6,2),
	 (7,2),
	 (8,2),
	 (9,2),
	 (10,2),
	 (3,3),
	 (4,3);
INSERT INTO TaskPanelDB.dbo.EquipoUsuario (EquiposId,ListaUsuariosId) VALUES
	 (6,3),
	 (7,3),
	 (8,3),
	 (9,3),
	 (10,3);
