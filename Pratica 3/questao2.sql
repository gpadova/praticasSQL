SELECT u.id, COUNT(e.id) AS educations  
    FROM users u 
        JOIN educations e ON e."userId" = u.id 
    GROUP BY  u.id;  