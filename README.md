# Task Panel – Diseño de Aplicaciones 1

Este proyecto fue desarrollado como **Obligatorio 1** de la materia **Diseño de Aplicaciones 1** en la **Universidad ORT Uruguay**.  
Se realizó en **dos entregas**, donde la primera se centró en la implementación inicial de la aplicación y la segunda en la incorporación de persistencia con base de datos y mejoras de diseño.  

> ⚠️ Nota: El proyecto fue realizado en equipo. Este repositorio se publica como muestra personal de mi participación, reflejando lo aprendido y construido a lo largo del curso.

---

## Descripción general

**TaskPanel** es una aplicación web diseñada para la **gestión colaborativa de tareas en equipo**.  
Permite a los usuarios:
- Crear y gestionar paneles de tareas.
- Asignar y organizar tareas por equipo.
- Administrar usuarios y roles.
- Importar tareas desde archivos.
- Manejar tareas vencidas, papelera de reciclaje y notificaciones.

### Roles y funcionalidades principales
- **Usuario estándar**: puede unirse a equipos, ver y gestionar tareas en paneles.  
- **Miembro de equipo**: además de lo anterior, puede crear, modificar e importar tareas.  
- **Administrador**: cuenta con permisos adicionales para:
  - Crear, modificar y eliminar usuarios.
  - Reiniciar contraseñas.
  - Crear y administrar equipos.
  - Eliminar permanentemente paneles y tareas desde la papelera.
  - Reactivar tareas vencidas.  

---

## Tecnologías utilizadas

- **.NET 6** y **C#**  
- **Blazor** (interfaz web)  
- **Entity Framework Core (Code First)**  
- **SQL Server (Docker)**  
- **xUnit** para pruebas unitarias  
- **DBeaver** como cliente de base de datos  

---

## Instalación y ejecución

### Requisitos
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)  
- [DBeaver](https://dbeaver.io/) u otro cliente SQL  

### Pasos
1. Descargar y levantar el contenedor de SQL Server:

   ```powershell
   docker pull mcr.microsoft.com/azure-sql-edge
   docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Passw1rd' -p 1433:1433 `
   --name sqlserver -d mcr.microsoft.com/azure-sql-edge
   
Conectarse en DBeaver a SQL Server con:
Usuario: sa
Contraseña: Passw1rd
Crear la base de datos TaskPanelDB.
Ejecutar los scripts SQL del proyecto para crear las tablas.
Correr la aplicación en Visual Studio o con dotnet run.

Arquitectura del sistema

El sistema está dividido en varias capas y proyectos para garantizar mantenibilidad y extensibilidad:

Dominio → Entidades principales (Usuario, Equipo, Tarea, Panel, Épica, Comentario, Notificación).
BusinessLogic → Reglas de negocio, validaciones, operaciones sobre las entidades.
Repository → Persistencia en memoria (Entrega 1) y luego en SQL Server con EF Core (Entrega 2).
UserInterface → Interfaz web con Blazor.
Controllers → Capa intermedia entre la UI y la lógica de negocio.
Tests → Pruebas unitarias para todas las capas.

Se aplicaron principios de diseño como:

SOLID
GRASP
Clean Code
TDD (Test Driven Development)

Evolución entre entregas

Entrega 1:
Implementación base del sistema.
Persistencia en memoria.
Uso de DTOs para seguridad (ej. exclusión de contraseña en UsuarioEnviar).
TDD y Git Flow como metodologías centrales.
Manejo de roles y permisos.
Importación de tareas desde archivos CSV.

Entrega 2:
Incorporación de persistencia en SQL Server (Docker + EF Core).
Migraciones con Entity Framework.
Nuevos módulos como épicas y notificaciones.
Ajustes en la arquitectura para seguir SOLID y GRASP.
Resolución de errores de integración entre back-end y front-end.
Mayor cobertura de pruebas.
Análisis de dependencias y diagramas más completos.

Conclusiones

El desarrollo de TaskPanel en dos etapas permitió:
Aprender y aplicar TDD, Clean Code, SOLID y GRASP.
Vivenciar el pasaje de persistencia en memoria a persistencia real en base de datos.
Practicar trabajo en equipo con Git Flow y resolución de conflictos.
Enfrentar problemas reales de diseño, integración y testing.
Fue una experiencia enriquecedora que mejoró nuestras habilidades en:
Programación en C# y .NET.
Diseño y arquitectura de software.
Trabajo colaborativo en proyectos de mediana complejidad.
