/*
  Warnings:

  - Added the required column `cpn_image` to the `campaign` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `campaign` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "campaign" ADD COLUMN     "cpn_image" TEXT NOT NULL,
ADD COLUMN     "user_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "campaign" ADD CONSTRAINT "campaign_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("us_id") ON DELETE RESTRICT ON UPDATE CASCADE;
