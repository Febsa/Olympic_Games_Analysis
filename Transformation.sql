SELECT
		 [ID]
		,[Name] AS 'Competitor Name' -- Renamed Column
		,CASE WHEN SEX = 'M' THEN 'Male' END AS Sex -- Better Name For Filters And Visualization
		,[Age]
		,CASE	WHEN [Age] < 18 THEN 'Under 18'
				WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
				WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
				WHEN [Age] > 30 THEN 'Over 30'
		 END AS [Age Grouping]
		,[Height]
		,[Weight]
		,[NOC] AS 'Nation Code' 
		,CHARINDEX(' ', Games)-1 AS 'Example 1'
		,CHARINDEX(' ', REVERSE(Games))-1 AS 'Example 2'
		,LEFT(Games, CHARINDEX(' ',Games))-1 AS 'Year' -- Split Column to Isolate Year, Based on Space
		,RIGHT(Games, CHARINDEX(' ',REVERSE(Games))-1) AS 'Seasons' -- Split Column to Isolate Seasons
		,[Games]
		,[City]
		,[Sport]
		,[Event]
		,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal -- Replaced NA With Not Registered
FROM [olympic_games].[dbo].[athletes_event_results]
WHERE RIGHT(Games,CHARINDEX(' ', REVERSE(Games))-1) = 'Summer'; -- Where Clause to Isolate Summer Seasons
