CREATE TABLE "users" (
	"id" PRIMARY KEY serial NOT NULL,
	"name" serial(255) NOT NULL,
	"email" serial NOT NULL UNIQUE,
	"password" text NOT NULL,
) 


CREATE TABLE "products" (
	"id" PRIMARY KEY serial NOT NULL,
	"name" serial NOT NULL,
	"price" serial NOT NULL,
	"sizeId" serial NOT NULL REFERENCES "size"("id"),
)

CREATE TABLE "productImgs" (
	"id" serial NOT NULL,
	"productId" text NOT NULL REFERENCES "products"("id"),
	"text" text NOT NULL,
	"secondUrl" text,
	"thirdUrl" text,
	"fourthUrl" text,
	"fifthUrl" text,
) 


CREATE TABLE "sizes" (
	"id" PRIMARY KEY serial NOT NULL,
	"size" text NOT NULL,
) 

CREATE TABLE "categories" (
	"id" PRIMARY KEY serial NOT NULL,
	"category" text NOT NULL,
) 



CREATE TABLE "shoppingCart" (
	"id" PRIMARY KEY serial NOT NULL,
	"userId" serial NOT NULL REFERENCES "user"("id"),
	"status" serial(255) NOT NULL DEFAULT 'criada',
	"productId" serial NOT NULL DEFAULT 'criada',
	"createdAt" serial NOT NULL DEFAULT 'NOW ()',
)









