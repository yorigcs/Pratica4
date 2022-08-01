CREATE TABLE "public.users" (
	"user_id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.users_adress" (
	"adress_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"adress" TEXT NOT NULL,
	"adress_num" TEXT NOT NULL,
	CONSTRAINT "users_adress_pk" PRIMARY KEY ("adress_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes_category" (
	"category_id" serial NOT NULL,
	"category_name" TEXT NOT NULL,
	CONSTRAINT "clothes_category_pk" PRIMARY KEY ("category_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes_size" (
	"size_id" serial NOT NULL,
	"size" TEXT NOT NULL,
	CONSTRAINT "clothes_size_pk" PRIMARY KEY ("size_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes" (
	"clothes_id" serial NOT NULL,
	"price" integer NOT NULL,
	"category" integer NOT NULL,
	"size" integer NOT NULL,
	"main_img" integer NOT NULL,
	"sub_img" integer NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("clothes_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.main_img" (
	"img_id" serial NOT NULL,
	"image_uri" TEXT NOT NULL,
	CONSTRAINT "main_img_pk" PRIMARY KEY ("img_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sub_images" (
	"img_id" serial NOT NULL,
	"image_uri" TEXT NOT NULL,
	CONSTRAINT "sub_images_pk" PRIMARY KEY ("img_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.checkout" (
	"checkout_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"clothe_id" integer NOT NULL,
	"amount" integer NOT NULL,
	"status" integer NOT NULL,
	"total_price" integer NOT NULL,
	"order_time" TIMESTAMP NOT NULL,
	CONSTRAINT "checkout_pk" PRIMARY KEY ("checkout_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.status" (
	"status_id" serial NOT NULL,
	"type" serial NOT NULL,
	CONSTRAINT "status_pk" PRIMARY KEY ("status_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "users_adress" ADD CONSTRAINT "users_adress_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");



ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("category") REFERENCES "clothes_category"("category_id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk1" FOREIGN KEY ("size") REFERENCES "clothes_size"("size_id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk2" FOREIGN KEY ("main_img") REFERENCES "main_img"("img_id");
ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk3" FOREIGN KEY ("sub_img") REFERENCES "sub_images"("img_id");



ALTER TABLE "checkout" ADD CONSTRAINT "checkout_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");
ALTER TABLE "checkout" ADD CONSTRAINT "checkout_fk1" FOREIGN KEY ("clothe_id") REFERENCES "clothes"("clothes_id");
ALTER TABLE "checkout" ADD CONSTRAINT "checkout_fk2" FOREIGN KEY ("status") REFERENCES "status"("status_id");











