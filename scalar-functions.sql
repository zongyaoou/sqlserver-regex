if OBJECT_ID('dbo.RegexMatch') is not null
begin
	exec ('drop function dbo.RegexMatch');
end
go

if OBJECT_ID('dbo.RegexGroupMatch') is not null
begin
	exec ('drop function dbo.RegexGroupMatch');
end
go

if OBJECT_ID('dbo.RegexReplace') is not null
begin
	exec ('drop function dbo.RegexReplace');
end
go


-- see https://msdn.microsoft.com/en-us/library/ms186755.aspx for details

CREATE FUNCTION dbo.RegexMatch (@input nvarchar(max), @pattern nvarchar(max),@option nvarchar(100) ='None')
RETURNS nvarchar(max)
AS EXTERNAL NAME [RegexAssembly].[UDF].[Match]
go

CREATE FUNCTION dbo.RegexGroupMatch (@input nvarchar(max), @pattern nvarchar(max), @group nvarchar(max),@option nvarchar(100) ='None')
RETURNS nvarchar(max)
AS EXTERNAL NAME [RegexAssembly].[UDF].[GroupMatch]
go

CREATE FUNCTION dbo.RegexReplace (@input nvarchar(max), @pattern nvarchar(max), @replacement nvarchar(max),@option nvarchar(100) ='None')
RETURNS nvarchar(max)
AS EXTERNAL NAME [RegexAssembly].[UDF].[Replace]
go

