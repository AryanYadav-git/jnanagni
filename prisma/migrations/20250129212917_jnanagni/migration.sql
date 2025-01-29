/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- DropEnum
DROP TYPE "Status";

-- CreateTable
CREATE TABLE "students" (
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "GkvRegistrationNo" INTEGER,
    "phone" TEXT NOT NULL,
    "isGurukulStudent" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isPaid" BOOLEAN NOT NULL DEFAULT false,
    "transactionId" TEXT NOT NULL DEFAULT '',
    "paymentImageUrl" TEXT NOT NULL DEFAULT '',
    "entry" BOOLEAN NOT NULL DEFAULT false
);

-- CreateIndex
CREATE UNIQUE INDEX "students_email_key" ON "students"("email");

-- CreateIndex
CREATE UNIQUE INDEX "students_transactionId_key" ON "students"("transactionId");
