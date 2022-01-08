﻿/*
Deployment script for DW_SUCOS

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_SUCOS"
:setvar DefaultFilePrefix "DW_SUCOS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 7960609b-3360-438e-b9d5-b89b3c882613, 7bf9ab82-22f9-49f8-b62d-abed63e4b38e is skipped, element [dbo].[Dim_Cliente].[Id] (SqlSimpleColumn) will not be renamed to Cod_Cliente';


GO
PRINT N'Creating Table [dbo].[Dim_Cliente]...';


GO
CREATE TABLE [dbo].[Dim_Cliente] (
    [Cod_Cliente]    NVARCHAR (50)  NOT NULL,
    [Desc_Cliente]   NVARCHAR (200) NULL,
    [Cod_Cidade]     NVARCHAR (200) NULL,
    [Desc_Cidade]    NVARCHAR (50)  NULL,
    [Cod_Estado]     NVARCHAR (200) NULL,
    [Desc_Estado]    NVARCHAR (50)  NULL,
    [Cod_Regiao]     NVARCHAR (200) NULL,
    [Desc_Regiao]    NVARCHAR (50)  NULL,
    [Cod_Segemento]  NVARCHAR (200) NULL,
    [Desc_Segemento] NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Cod_Cliente] ASC)
);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7960609b-3360-438e-b9d5-b89b3c882613')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7960609b-3360-438e-b9d5-b89b3c882613')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7bf9ab82-22f9-49f8-b62d-abed63e4b38e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7bf9ab82-22f9-49f8-b62d-abed63e4b38e')

GO

GO
PRINT N'Update complete.';


GO
