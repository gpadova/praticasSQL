CREATE TABLE "airlines" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"shortName" varchar(3) NOT NULL,
	CONSTRAINT "airlines_pk" PRIMARY KEY ("id")
) 


CREATE TABLE "flights" (
	"id" serial NOT NULL,
	"name" varchar(7) NOT NULL,
	"originId" varchar(7) NOT NULL,
	"destinationId" integer NOT NULL,
	"airlineId" integer NOT NULL,
	CONSTRAINT "flights_pk" PRIMARY KEY ("id")
)

CREATE TABLE "airports" (
	"id" serial NOT NULL,
	"shortName" varchar(3) NOT NULL,
	"fullName" text NOT NULL,
	CONSTRAINT "airports_pk" PRIMARY KEY ("id")
)


CREATE TABLE "schedule" (
	"id" serial NOT NULL,
	"flightId" integer NOT NULL,
	"arrivalTime" TIMESTAMP NOT NULL,
	"departureTime" TIMESTAMP NOT NULL,
	CONSTRAINT "schedule_pk" PRIMARY KEY ("id")
) 


ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("originId") REFERENCES "airports"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("destinationId") REFERENCES "airports"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("airlineId") REFERENCES "airlines"("id");


ALTER TABLE "schedule" ADD CONSTRAINT "schedule_fk0" FOREIGN KEY ("flightId") REFERENCES "flights"("id");




