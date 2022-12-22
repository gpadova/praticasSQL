CREATE TABLE "discs" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"barCode" integer NOT NULL UNIQUE,
	"categoryId" integer NOT NULL,
	CONSTRAINT "disc_pk" PRIMARY KEY ("id")
) 


CREATE TABLE "categories" (
	"id" serial NOT NULL,
    "name" text NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) 

CREATE TABLE "actors" (
	"id" serial NOT NULL,
	"name" text NOT NULL,
	"country" TEXT NOT NULL,
	"birthday" DATE NOT NULL,
	CONSTRAINT "actors_pk" PRIMARY KEY ("id")
)

CREATE TABLE "actorsDisc" (
	"id" serial NOT NULL,
	"discId" integer NOT NULL,
	"actorid" integer NOT NULL,
	CONSTRAINT "actorsDisc_pk" PRIMARY KEY ("id")
) 

CREATE TABLE "clients" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
    "cpf" VARCHAR(11) NOT NULL UNIQUE,
	CONSTRAINT "clients_pk" PRIMARY KEY ("id")
)

CREATE TABLE "telephones" (
	"id" serial NOT NULL,
	"number" serial NOT NULL UNIQUE,
	"clientId" integer NOT NULL,
	CONSTRAINT "telephones_pk" PRIMARY KEY ("id")
) 

CREATE TABLE "address" (
	"id" serial NOT NULL,
	"street" text NOT NULL,
	"number" text NOT NULL,
	"complement" TEXT NOT NULL,
	"neighborhood" TEXT NOT NULL,
	"cep" TEXT NOT NULL,
	"cityId" TEXT NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) 

CREATE TABLE "cities" (
	"id" serial NOT NULL,
	"name" text NOT NULL,
	"stateId" integer not NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) 

CREATE TABLE "states" (
	"id" serial NOT NULL,
	"name" text NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) 


CREATE TABLE "addressClient" (
	"id" serial NOT NULL,
	"addressId" integer NOT NULL,
	"clientId" integer NOT NULL,
	CONSTRAINT "addressClient_pk" PRIMARY KEY ("id")
) 



CREATE TABLE "clientDisc" (
	"id" serial NOT NULL,
	"discId" integer NOT NULL,
	"clientId" integer NOT NULL,
	"rentedAt" TIMESTAMP NOT NULL DEFAULT 'NOW',
	"deliveredAt" TIMESTAMP NOT NULL DEFAULT 'null',
	CONSTRAINT "clientDisc_pk" PRIMARY KEY ("id")
) 


CREATE TABLE "survey" (
	"id" serial NOT NULL,
	"grade" integer NOT NULL,
	"clientId" integer NOT NULL,
	CONSTRAINT "survey_pk" PRIMARY KEY ("id")
) 

ALTER TABLE "disc" ADD CONSTRAINT "disc_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "actorsDisc" ADD CONSTRAINT "actorsDisc_fk0" FOREIGN KEY ("discId") REFERENCES "disc"("id");
ALTER TABLE "actorsDisc" ADD CONSTRAINT "actorsDisc_fk1" FOREIGN KEY ("actorid") REFERENCES "actors"("id");

ALTER TABLE "telephones" ADD CONSTRAINT "telephones_fk0" FOREIGN KEY ("clientId") REFERENCES "clients"("id");

ALTER TABLE "addressClient" ADD CONSTRAINT "addressClient_fk0" FOREIGN KEY ("addressId") REFERENCES "address"("id");
ALTER TABLE "addressClient" ADD CONSTRAINT "addressClient_fk1" FOREIGN KEY ("clientId") REFERENCES "clients"("id");
ALTER TABLE "addressClient" ADD CONSTRAINT "addressClient_fk2" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "clientDisc" ADD CONSTRAINT "clientDisc_fk0" FOREIGN KEY ("discId") REFERENCES "disc"("id");
ALTER TABLE "clientDisc" ADD CONSTRAINT "clientDisc_fk1" FOREIGN KEY ("clientId") REFERENCES "clients"("id");

ALTER TABLE "survey" ADD CONSTRAINT "survey_fk0" FOREIGN KEY ("clientId") REFERENCES "clients"("id");

ALTER TABLE "citiesClient" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");