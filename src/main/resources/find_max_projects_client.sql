--SELECT name, project.client_id
--FROM client
--JOIN project ON client.id = project.client_id;
--
--SELECT client_id, count(id) FROM project GROUP BY client_id;
--
--SELECT name, client_id
--FROM (SELECT client_id, count(id) FROM project GROUP BY client_id)
--JOIN client ON client.id = client_id;
--
--SELECT name, count(name) FROM (SELECT name, project.client_id
--FROM client
--JOIN project ON client.id = project.client_id) GROUP BY name;
--
--SELECT name, count(name) AS project_count
--    FROM (SELECT name, project.client_id
--        FROM client
--        JOIN project ON client.id = project.client_id)
--    GROUP BY name

--SELECT name, count(name) AS project_count
--    FROM (SELECT name, project.client_id
--        FROM client
--        JOIN project ON client.id = project.client_id)
--    GROUP BY name
--    HAVING project_count = SELECT (MAX (project_count))

SELECT *
    FROM (SELECT name, count(name) AS project_count
        FROM (SELECT name, project.client_id
            FROM client
            JOIN project
            ON client.id = project.client_id)
        GROUP BY name)
    WHERE project_count = (SELECT MAX(project_count)
        FROM (SELECT name, count(name) AS project_count
            FROM (SELECT name, project.client_id
                FROM client
                JOIN project
                ON client.id = project.client_id)
            GROUP BY name))