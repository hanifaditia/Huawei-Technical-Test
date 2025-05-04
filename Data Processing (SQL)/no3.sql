-- If salary was yearly salary
SELECT SUM(Salary) AS Total_Salary_2021
FROM Employees
WHERE JoinDate <= '2021-12-31' AND (ReleaseDate IS NULL OR ReleaseDate >= '2021-01-01');

-- If salary was monthly salary

SELECT SUM(MonthsWorked * Salary) AS Total_Salary_2021
FROM (
    SELECT 
        Salary,
        CASE 
            WHEN JoinDate > '2021-12-31' OR (ReleaseDate IS NOT NULL AND ReleaseDate < '2021-01-01') THEN 0
            ELSE TIMESTAMPDIFF(MONTH, 
                GREATEST('2021-01-01', JoinDate), 
                LEAST(COALESCE(ReleaseDate, '2021-12-31'), '2021-12-31')
            ) + 1
        END AS MonthsWorked
    FROM Employees
) AS Work_Period;
