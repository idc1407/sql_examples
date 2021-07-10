declare @Grades table (
  [Student] VARCHAR(50),
  [Subject] VARCHAR(50),
  [Marks]   INT
) ;

 
INSERT INTO @Grades VALUES 
('Jacob','Mathematics',100),
('Jacob','Science',95),
('Jacob','Geography',90),
('Amilee','Mathematics',90),
('Amilee','Science',90),
('Amilee','Geography',100) ;


SELECT * FROM (
  SELECT
    [Student],
    [Subject],
    [Marks]
  FROM @Grades
) StudentResults
PIVOT (
  SUM([Marks])
  FOR [Subject]
  IN (
    [Mathematics],
    [Science],
    [Geography]
  )
) AS PivotTable

