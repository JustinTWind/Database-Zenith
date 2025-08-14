# 🗄️ Base de Datos Zenith

¡Bienvenido al repositorio de la Base de Datos Zenith! 🚀

## 📋 Descripción

Este repositorio contiene todos los archivos necesarios para configurar y poblar la base de datos Zenith. La base de datos está organizada por equipos y contiene datos estructurados listos para usar.

## 🛠️ Instalación y Configuración

Tienes **dos opciones** para obtener la base de datos completa:

### 📦 Opción 1: Restaurar desde Backup (.bak)

La forma más rápida y sencilla:

#### Para SQL Server Management Studio (SSMS):

1. **Descarga** el archivo `ZenithDatabase.bak` a tu computadora
2. **Abre** SQL Server Management Studio
3. **Conéctate** a tu instancia de SQL Server
4. **Click derecho** en "Databases" en el Object Explorer
5. **Selecciona** "Restore Database..."
6. En la ventana de restauración:
   - 📍 **Source**: Selecciona "Device"
   - 🔍 **Click** en el botón "..." para buscar archivos
   - 📁 **Add**: Navega y selecciona el archivo `ZenithDatabase.bak`
   - ✅ **OK** para confirmar la selección
7. En **"Destination"**:
   - 🏷️ **Database**: Cambia el nombre si deseas (por defecto será "Zenith")
8. **Click** en "OK" para iniciar la restauración
9. **¡Listo!** 🎉 La base de datos estará completa con todos los datos

#### Para otros DBMS:
- **Azure Data Studio**: Usa la extensión SQL Server Admin Pack
- **DBeaver**: Importa usando la funcionalidad de backup/restore para SQL Server


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
