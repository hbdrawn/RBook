sqlserver 
1. print cast( floor(rand()*100) as int);
2. 
declare @var int
declare @result int
set @var = 1
set @result = 46005
while @var <= @result
	begin

		INSERT INTO [imstudio.Webapp.KW].[dbo].[kw_MemberClick]
           ([ResearchArea]
           ,[UserID]
           ,[UserType]
           ,[IPAddress]
           ,[IsActive]
           ,[CreateDate])
     VALUES
           (64
           ,252
           ,1
           ,NULL
           ,1
           ,'2014-10-23 09:09:09')
    set @var = @var + 1
	
	end