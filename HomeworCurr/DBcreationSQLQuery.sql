CREATE DATABASE [CDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVERGHM\MSSQL\DATA\CDB.mdf' , SIZE = 3072KB , FILEGROWTH = 1024KB ), 
 FILEGROUP [memFG] CONTAINS MEMORY_OPTIMIZED_DATA 
( NAME = N'memData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVERGHM\MSSQL\DATA\memData' )
 LOG ON 
( NAME = N'CDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVERGHM\MSSQL\DATA\CDB_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CDB] SET COMPATIBILITY_LEVEL = 120
GO
ALTER DATABASE [CDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CDB] SET  READ_WRITE 
GO
ALTER DATABASE [CDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CDB] SET  MULTI_USER 
GO
ALTER DATABASE [CDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CDB]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [CDB] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
