SELECT id AS name, DATEDIFF(MONTH, START_DATE, FINISH_DATE) AS month_count
    FROM project
    GROUP BY name HAVING month_count = SELECT MAX (month_count);