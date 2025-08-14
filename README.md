# 🗄️ Base de Datos Zenith

¡Bienvenido al repositorio de la Base de Datos Zenith! 🚀

## 📋 Descripción

Este repositorio contiene todos los archivos necesarios para configurar y poblar la base de datos Zenith. La base de datos está organizada por equipos y contiene datos estructurados listos para usar.

## 🛠️ Instalación y Configuración

Tienes **dos opciones** para obtener la base de datos completa:

### 📦 Opción 1: Restaurar desde Backup (.bak)

La forma más rápida y sencilla:

1. **Descarga** el archivo `ZenithDatabase.bak`
2. **Abre** tu DBMS (SQL Server Management Studio, Azure Data Studio, etc.)
3. **Restaura** la base de datos desde el archivo .bak
4. **¡Listo!** 🎉 La base de datos estará completa con todos los datos

### 🔧 Opción 2: Creación Manual paso a paso

Si prefieres crear la base de datos desde cero:

#### Paso 1: Crear la estructura 🏗️
```sql
-- Ejecuta primero:
Database-Zenith.sql
```

#### Paso 2: Insertar datos por equipos 📊
Ejecuta los archivos en el siguiente orden **estricto**:

1. 📁 **equipo1** - Datos del primer equipo
2. 📁 **equipo2** - Datos del segundo equipo  
3. 📁 **equipo3** - Datos del tercer equipo
4. 📁 **equipo4** - Datos del cuarto equipo
5. 📁 **equipo5** - Datos del quinto equipo

> ⚠️ **Importante**: Es crucial ejecutar los archivos de inserción en este orden específico para mantener la integridad referencial de la base de datos.

## 📂 Estructura del Repositorio

```
├── 📁 equipo1/          # Scripts de datos - Equipo 1
├── 📁 equipo2/          # Scripts de datos - Equipo 2
├── 📁 equipo3/          # Scripts de datos - Equipo 3
├── 📁 equipo4/          # Scripts de datos - Equipo 4
├── 📁 equipo5/          # Scripts de datos - Equipo 5
├── 📄 .gitignore        # Configuración de Git
├── 📄 Database-Zenith.sql    # Script de creación de estructura
└── 📄 ZenithDatabase.bak     # Backup completo de la BD
```


## 🎯 Recomendación

Para una experiencia sin complicaciones, recomendamos usar la **Opción 1** (restaurar desde .bak) ya que garantiza una instalación rápida y sin errores.


**¡Disfruta trabajando con la Base de Datos Zenith!** 🌟
