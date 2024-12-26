-- CreateTable
CREATE TABLE "user" (
    "us_id" SERIAL NOT NULL,
    "us_name" TEXT NOT NULL,
    "us_email" TEXT NOT NULL,
    "us_password" TEXT NOT NULL,
    "us_active" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("us_id")
);

-- CreateTable
CREATE TABLE "role" (
    "rl_id" SERIAL NOT NULL,
    "rl_name" TEXT NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("rl_id")
);

-- CreateTable
CREATE TABLE "userRole" (
    "ur_id" SERIAL NOT NULL,
    "ur_roleId" INTEGER NOT NULL,
    "ur_userId" INTEGER NOT NULL,

    CONSTRAINT "userRole_pkey" PRIMARY KEY ("ur_id")
);

-- CreateTable
CREATE TABLE "campaign" (
    "id" SERIAL NOT NULL,
    "cpn_title" TEXT NOT NULL,
    "cpn_description" TEXT NOT NULL,
    "cpn_target_amount" INTEGER NOT NULL,
    "cpn_collected_amount" INTEGER NOT NULL,
    "cpn_active" BOOLEAN NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "category_id" INTEGER NOT NULL,

    CONSTRAINT "campaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_us_email_key" ON "user"("us_email");

-- AddForeignKey
ALTER TABLE "userRole" ADD CONSTRAINT "userRole_ur_roleId_fkey" FOREIGN KEY ("ur_roleId") REFERENCES "role"("rl_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRole" ADD CONSTRAINT "userRole_ur_userId_fkey" FOREIGN KEY ("ur_userId") REFERENCES "user"("us_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaign" ADD CONSTRAINT "campaign_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
