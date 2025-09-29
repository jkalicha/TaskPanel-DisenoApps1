-- DROP SCHEMA dbo;

-- TaskPanelDB.dbo.Usuarios definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.Usuarios;

CREATE TABLE TaskPanelDB.dbo.Usuarios (
	Id int IDENTITY(1,1) NOT NULL,
	Nombre nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Apellido nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Email nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FechaNacimiento datetime2 NOT NULL,
	EsAdministrador bit NOT NULL,
	Contrasenia nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Usuarios PRIMARY KEY (Id)
);


-- TaskPanelDB.dbo.[__EFMigrationsHistory] definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.[__EFMigrationsHistory];

CREATE TABLE TaskPanelDB.dbo.[__EFMigrationsHistory] (
	MigrationId nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ProductVersion nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK___EFMigrationsHistory PRIMARY KEY (MigrationId)
);


-- TaskPanelDB.dbo.Equipos definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.Equipos;

CREATE TABLE TaskPanelDB.dbo.Equipos (
	Id int IDENTITY(1,1) NOT NULL,
	Nombre nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FechaCreacion datetime2 NOT NULL,
	DescripcionTareas nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CantMaxUsuarios int NOT NULL,
	CreadorId int NOT NULL,
	CONSTRAINT PK_Equipos PRIMARY KEY (Id),
	CONSTRAINT FK_Equipos_Usuarios_CreadorId FOREIGN KEY (CreadorId) REFERENCES TaskPanelDB.dbo.Usuarios(Id)
);
 CREATE NONCLUSTERED INDEX IX_Equipos_CreadorId ON dbo.Equipos (  CreadorId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- TaskPanelDB.dbo.Paneles definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.Paneles;

CREATE TABLE TaskPanelDB.dbo.Paneles (
	Id int IDENTITY(1,1) NOT NULL,
	Nombre nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	EquipoId int NOT NULL,
	Descripcion nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Paneles PRIMARY KEY (Id),
	CONSTRAINT FK_Paneles_Equipos_EquipoId FOREIGN KEY (EquipoId) REFERENCES TaskPanelDB.dbo.Equipos(Id) ON DELETE CASCADE
);
 CREATE NONCLUSTERED INDEX IX_Paneles_EquipoId ON dbo.Paneles (  EquipoId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- TaskPanelDB.dbo.Epicas definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.Epicas;

CREATE TABLE TaskPanelDB.dbo.Epicas (
	Id int IDENTITY(1,1) NOT NULL,
	Titulo nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Descripcion nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FechaVencimiento datetime2 NOT NULL,
	PanelId int NOT NULL,
	EsfuerzoEstimado int NOT NULL,
	EsfuerzoInvertido int NOT NULL,
	Prioridad int NOT NULL,
	CONSTRAINT PK_Epicas PRIMARY KEY (Id),
	CONSTRAINT FK_Epicas_Paneles_PanelId FOREIGN KEY (PanelId) REFERENCES TaskPanelDB.dbo.Paneles(Id) ON DELETE CASCADE
);
 CREATE NONCLUSTERED INDEX IX_Epicas_PanelId ON dbo.Epicas (  PanelId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- TaskPanelDB.dbo.EquipoUsuario definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.EquipoUsuario;

CREATE TABLE TaskPanelDB.dbo.EquipoUsuario (
	EquiposId int NOT NULL,
	ListaUsuariosId int NOT NULL,
	CONSTRAINT PK_EquipoUsuario PRIMARY KEY (EquiposId,ListaUsuariosId),
	CONSTRAINT FK_EquipoUsuario_Equipos_EquiposId FOREIGN KEY (EquiposId) REFERENCES TaskPanelDB.dbo.Equipos(Id) ON DELETE CASCADE,
	CONSTRAINT FK_EquipoUsuario_Usuarios_ListaUsuariosId FOREIGN KEY (ListaUsuariosId) REFERENCES TaskPanelDB.dbo.Usuarios(Id) ON DELETE CASCADE
);
 CREATE NONCLUSTERED INDEX IX_EquipoUsuario_ListaUsuariosId ON dbo.EquipoUsuario (  ListaUsuariosId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- TaskPanelDB.dbo.Tareas definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.Tareas;

CREATE TABLE TaskPanelDB.dbo.Tareas (
	Id int IDENTITY(1,1) NOT NULL,
	Titulo nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Prioridad int NOT NULL,
	Descripcion nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FechaVencimiento datetime2 NOT NULL,
	UsuarioIdPapelera int NULL,
	PanelId int NULL,
	EstaVencida bit NOT NULL,
	EstaActiva bit NOT NULL,
	EpicaId int NULL,
	EsfuerzoEstimado int NOT NULL,
	EsfuerzoInvertido int NOT NULL,
	PanelIdOriginal int NULL,
	EpicaIdOriginal int NULL,
	CONSTRAINT PK_Tareas PRIMARY KEY (Id),
	CONSTRAINT FK_Tareas_Epicas_EpicaId FOREIGN KEY (EpicaId) REFERENCES TaskPanelDB.dbo.Epicas(Id),
	CONSTRAINT FK_Tareas_Paneles_PanelId FOREIGN KEY (PanelId) REFERENCES TaskPanelDB.dbo.Paneles(Id),
	CONSTRAINT FK_Tareas_Usuarios_UsuarioIdPapelera FOREIGN KEY (UsuarioIdPapelera) REFERENCES TaskPanelDB.dbo.Usuarios(Id) ON DELETE CASCADE
);
 CREATE NONCLUSTERED INDEX IX_Tareas_EpicaId ON dbo.Tareas (  EpicaId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Tareas_PanelId ON dbo.Tareas (  PanelId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Tareas_UsuarioIdPapelera ON dbo.Tareas (  UsuarioIdPapelera ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- TaskPanelDB.dbo.Comentarios definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.Comentarios;

CREATE TABLE TaskPanelDB.dbo.Comentarios (
	Id int IDENTITY(1,1) NOT NULL,
	Explicacion nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Resuelto bit NOT NULL,
	FechaResolucion datetime2 NOT NULL,
	UsuarioCreadorId int NOT NULL,
	TareaId int NOT NULL,
	UsuarioQueResolvioId int NULL,
	CONSTRAINT PK_Comentarios PRIMARY KEY (Id),
	CONSTRAINT FK_Comentarios_Tareas_TareaId FOREIGN KEY (TareaId) REFERENCES TaskPanelDB.dbo.Tareas(Id) ON DELETE CASCADE,
	CONSTRAINT FK_Comentarios_Usuarios_UsuarioCreadorId FOREIGN KEY (UsuarioCreadorId) REFERENCES TaskPanelDB.dbo.Usuarios(Id),
	CONSTRAINT FK_Comentarios_Usuarios_UsuarioQueResolvioId FOREIGN KEY (UsuarioQueResolvioId) REFERENCES TaskPanelDB.dbo.Usuarios(Id)
);
 CREATE NONCLUSTERED INDEX IX_Comentarios_TareaId ON dbo.Comentarios (  TareaId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Comentarios_UsuarioCreadorId ON dbo.Comentarios (  UsuarioCreadorId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Comentarios_UsuarioQueResolvioId ON dbo.Comentarios (  UsuarioQueResolvioId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- TaskPanelDB.dbo.Notificaciones definition

-- Drop table

-- DROP TABLE TaskPanelDB.dbo.Notificaciones;

CREATE TABLE TaskPanelDB.dbo.Notificaciones (
	Id int IDENTITY(1,1) NOT NULL,
	ComentarioResueltoId int NOT NULL,
	Mensaje nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	UsuarioANotificarId int NULL,
	CONSTRAINT PK_Notificaciones PRIMARY KEY (Id),
	CONSTRAINT FK_Notificaciones_Comentarios_ComentarioResueltoId FOREIGN KEY (ComentarioResueltoId) REFERENCES TaskPanelDB.dbo.Comentarios(Id) ON DELETE CASCADE,
	CONSTRAINT FK_Notificaciones_Usuarios_UsuarioANotificarId FOREIGN KEY (UsuarioANotificarId) REFERENCES TaskPanelDB.dbo.Usuarios(Id)
);
 CREATE NONCLUSTERED INDEX IX_Notificaciones_ComentarioResueltoId ON dbo.Notificaciones (  ComentarioResueltoId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Notificaciones_UsuarioANotificarId ON dbo.Notificaciones (  UsuarioANotificarId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;