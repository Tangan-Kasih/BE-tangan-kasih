/*
  Warnings:

  - The primary key for the `campaign` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `campaign` table. All the data in the column will be lost.
  - The primary key for the `category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `category` table. All the data in the column will be lost.
  - Added the required column `ct_name` to the `category` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "campaign" DROP CONSTRAINT "campaign_category_id_fkey";

-- AlterTable
ALTER TABLE "campaign" DROP CONSTRAINT "campaign_pkey",
DROP COLUMN "id",
ADD COLUMN     "cpn_id" SERIAL NOT NULL,
ADD CONSTRAINT "campaign_pkey" PRIMARY KEY ("cpn_id");

-- AlterTable
ALTER TABLE "category" DROP CONSTRAINT "category_pkey",
DROP COLUMN "id",
DROP COLUMN "name",
ADD COLUMN     "ct_id" SERIAL NOT NULL,
ADD COLUMN     "ct_name" TEXT NOT NULL,
ADD CONSTRAINT "category_pkey" PRIMARY KEY ("ct_id");

-- AddForeignKey
ALTER TABLE "campaign" ADD CONSTRAINT "campaign_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("ct_id") ON DELETE RESTRICT ON UPDATE CASCADE;
