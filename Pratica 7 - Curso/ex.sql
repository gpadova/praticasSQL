CREATE TABLE "students" (
	"id" serial NOT NULL,
	"name" text NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" text NOT NULL UNIQUE,
	CONSTRAINT "students_pk" PRIMARY KEY ("id")
);




CREATE TABLE "classes" (
	"id" serial NOT NULL,
	"code" int NOT NULL,
	CONSTRAINT "classes_pk" PRIMARY KEY ("id")
);


CREATE TABLE "studentClasses" (
	"id" serial NOT NULL,
	"studentId" integer NOT NULL,
	"classId" integer NOT NULL,
	"startTime" TIMESTAMP NOT NULL DEFAULT N0W(),
	"finishTime" TIMESTAMP,
	CONSTRAINT "studentClasses_pk" PRIMARY KEY ("id")
);



CREATE TABLE "projects" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"moduleId" integer NOT NULL,
	CONSTRAINT "projects_pk" PRIMARY KEY ("id")
);

CREATE TYPE "concepts" AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE "studentsProjects" (
	"id" serial NOT NULL,
	"studentId" integer NOT NULL,
	"projectId" integer NOT NULL,
	"date" DATE NOT NULL DEFAULT 'NOW',
	"grade" concepts NOT NULL,
	CONSTRAINT "studentsProjects_pk" PRIMARY KEY ("id")
);



CREATE TABLE "modules" (
	"id" serial NOT NULL,
	"name" text NOT NULL,
	CONSTRAINT "modules_pk" PRIMARY KEY ("id")
);





ALTER TABLE "studentClasses" ADD CONSTRAINT "studentClasses_fk0" FOREIGN KEY ("studentId") REFERENCES "students"("id");
ALTER TABLE "studentClasses" ADD CONSTRAINT "studentClasses_fk1" FOREIGN KEY ("classId") REFERENCES "classes"("id");

ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("moduleId") REFERENCES "modules"("id");

ALTER TABLE "studentsProjects" ADD CONSTRAINT "studentsProjects_fk0" FOREIGN KEY ("studentId") REFERENCES "students"("id");
ALTER TABLE "studentsProjects" ADD CONSTRAINT "studentsProjects_fk1" FOREIGN KEY ("projectId") REFERENCES "projects"("id");


