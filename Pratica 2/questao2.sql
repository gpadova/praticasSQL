SELECT testimonials.id, testimonials."writerId" AS "writer",  testimonials.message, testimonials."recipientId" AS "recipient"
FROM testimonials
JOIN users
ON users.id = testimonials."writerId"
ON users.id = testimonials."recipientId";