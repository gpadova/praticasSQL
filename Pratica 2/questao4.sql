SELECT users.id, users.name, roles.name AS "role", companies.name AS 'company',experiences."startDate"
FROM users
    ON users.id = applicants."userId"  
FROM applicants
    ON applicants."jobId" = jobs.id
FROM jobs
    ON jobs."roleId" = roles.id
    ON jobs."companyId" = companies.id
FROM experiences
    ON companies.id = experiences.id
WHERE 
    experiences."endDate" IS NULL