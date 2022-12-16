SELECT u1.name AS writer, COUNT(t.message) AS "testimonialCount" 
FROM testimonials t 
	JOIN users u1 ON t."writerId" = u1.id 
	JOIN users u2 ON t."recipientId" = u2.id 
WHERE t."writerId" = 435
GROUP BY u1.name; 