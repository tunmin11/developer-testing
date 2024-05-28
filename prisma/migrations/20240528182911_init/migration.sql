-- CreateTable
CREATE TABLE `Project` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NULL,
    `country` VARCHAR(191) NOT NULL,
    `latitude` DOUBLE NULL,
    `longitude` DOUBLE NULL,

    UNIQUE INDEX `Project_name_key`(`name`),
    INDEX `Project_name_city_country_idx`(`name`, `city`, `country`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Property` (
    `id` VARCHAR(191) NOT NULL,
    `projectId` VARCHAR(191) NOT NULL,
    `unitNumber` VARCHAR(191) NULL,
    `projectName` VARCHAR(191) NOT NULL,
    `shortTitle` VARCHAR(191) NOT NULL,
    `saleOrRent` ENUM('SALE', 'RENT') NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `bedrooms` INTEGER NOT NULL,
    `area` DECIMAL(10, 2) NOT NULL,
    `shortDescription` VARCHAR(191) NOT NULL,
    `images` VARCHAR(191) NOT NULL,

    INDEX `Property_projectId_saleOrRent_price_bedrooms_area_idx`(`projectId`, `saleOrRent`, `price`, `bedrooms`, `area`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Property` ADD CONSTRAINT `Property_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
