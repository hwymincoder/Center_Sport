-- -----------------------------------------------------
-- Schema full-stack-sports-center
-- -----------------------------------------------------

-- Tạo database nếu chưa tồn tại
CREATE DATABASE IF NOT EXISTS `sports-center`;

-- Sử dụng database
USE `sports-center`;

-- ---------------------------------
-- Drop existing tables if they exist
-- ---------------------------------

DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Type;
DROP TABLE IF EXISTS Brand;


-- ------------------------
-- Create the Brand table
-- ------------------------
CREATE TABLE `Brand` (
                         `Id`   INT AUTO_INCREMENT PRIMARY KEY,
                         `Name` VARCHAR(255) NOT NULL
);

-- ---------------------------------
-- Insert data into the Brand table
-- ---------------------------------
INSERT INTO `Brand` (`Name`) VALUES
                                 ('Adidas'),
                                 ('ASICS'),
                                 ('Victor'),
                                 ('Yonex'),
                                 ('Puma'),
                                 ('Babolat'),
                                 ('Nike');
-- ------------------------
-- Create the Type table
-- ------------------------
CREATE TABLE `Type` (
                        `Id`   INT AUTO_INCREMENT PRIMARY KEY,
                        `Name` VARCHAR(255) NOT NULL
);

-- --------------------------------
-- Insert data into the Type table
-- --------------------------------
INSERT INTO `Type` (`Name`) VALUES
                                ('Shoes'),
                                ('Rackets'),
                                ('Football'),
                                ('Kit Bags');

-- ---------------------------
-- Create the Product table
-- ---------------------------
CREATE TABLE `Product` (
                           `Id`             INT AUTO_INCREMENT PRIMARY KEY,
                           `Name`           VARCHAR(255) NOT NULL,
                           `Description`    TEXT,
                           `Price`          DECIMAL(10, 2) NOT NULL,
                           `PictureUrl`     VARCHAR(255),
                           `ProductTypeId`  INT NOT NULL,
                           `ProductBrandId` INT NOT NULL,
                           FOREIGN KEY (`ProductTypeId`)  REFERENCES `Type`(`Id`),
                           FOREIGN KEY (`ProductBrandId`) REFERENCES `Brand`(`Id`)
);

-- (phần dưới video sẽ có INSERT INTO Product..., anh có thể thêm tiếp ở đây)
-- Insert data into the Product table
INSERT INTO Product (Name, Description, Price, PictureUrl, ProductTypeId, ProductBrandId) VALUES
-- ========== SHOES (Type = 1) ==========
('Adidas Quick Force Indoor Badminton Shoes',
 'Adidas Quick Force indoor badminton shoes for club players.',
 79.99,
 '/images/products/adidas-quick-force-indoor-badminton-shoes.jpg',
 1, 1),

('Asics Gel Rocket 8 Indoor Court Shoes',
 'Asics Gel Rocket 8 indoor court shoes with gel cushioning and high grip.',
 69.99,
 '/images/products/asics-gel-rocket-8-indoor-court-shoes.jpg',
 1, 2),

('Victor SHW503 F Badminton Shoes',
 'Victor SHW503 F badminton shoes with PU leather upper and durable outsole.',
 74.99,
 '/images/products/victor-shw503-f-badminton-shoes.jpg',
 1, 3),

('YONEX Super Ace Light Badminton Shoes',
 'Yonex Super Ace Light badminton shoes, lightweight design with Power Cushion.',
 82.50,
 '/images/products/yonex-super-ace-light-badminton-shoes.jpg',
 1, 4),

('Puma 19 FH Rubber Spike Cricket Shoes',
 'Puma 19 FH rubber spike cricket shoes with wide fit and strong traction.',
 64.00,
 '/images/products/puma-19-fh-rubber-spike-cricket-shoes.jpg',
 1, 5),

('Babolat Shadow Spirit Mens Badminton Shoes',
 'Babolat Shadow Spirit men''s badminton shoes for intensive play.',
 77.50,
 '/images/products/babolat-shadow-spirit-mens-badminton-shoes.jpg',
 1, 6),

('Babolat Shadow Tour Mens Badminton Shoes',
 'Babolat Shadow Tour men''s badminton shoes, lightweight performance model.',
 84.90,
 '/images/products/babolat-shadow-tour-mens-badminton-shoes.jpg',
 1, 6),

('Babolat Shadow Team Womens Badminton Shoes',
 'Babolat Shadow Team women''s badminton shoes for regular training.',
 72.90,
 '/images/products/babolat-shadow-team-womens-badminton-shoes.jpg',
 1, 6),

-- ========== RACKETS (Type = 2) ==========
('Yonex VCORE Pro 100 A Tennis Racquet',
 'Yonex VCORE Pro 100 A tennis racquet (270g) for intermediate players.',
 199.90,
 '/images/products/yonex-vcore-pro-100-a-tennis-racquet-270g.jpg',
 2, 4),

('Yonex VCORE Pro 100 A Tennis Racquet (290g)',
 'Yonex VCORE Pro 100 A tennis racquet (290g) for advanced players.',
 209.90,
 '/images/products/yonex-vcore-pro-100-a-tennis-racquet-290g.jpg',
 2, 4),

('Yonex VCORE Pro 100 2019 Tennis Racquet',
 'Yonex VCORE Pro 100 2019 model with improved feel and spin.',
 219.90,
 '/images/products/yonex-vcore-pro-100-2019-tennis-racquet.jpg',
 2, 4),

('Babolat Boost D Tennis Racquet',
 'Babolat Boost D tennis racquet (260g, strung) with graphite frame.',
 149.90,
 '/images/products/babolat-boost-d-tennis-racquet.jpg',
 2, 6),

('Babolat Pure Aero 2019 Superlite Tennis Racquet',
 'Superlite version of the Babolat Pure Aero 2019 for easy maneuverability.',
 189.90,
 '/images/products/babolat-pure-aero-2019-superlite-tennis-racquet.jpg',
 2, 6),

('Babolat Pure Drive VS Tennis Racquet',
 'Babolat Pure Drive VS racquet for power players wanting extra control.',
 239.90,
 '/images/products/babolat-pure-drive-vs-tennis-racquet.jpg',
 2, 6),

-- ========== FOOTBALLS (Type = 3) ==========
('Adidas FIFA World Cup 2018 OMB Football',
 'Official match ball of the 2018 FIFA World Cup, thermally bonded surface.',
 125.00,
 '/images/products/adidas-fifa-world-cup-2018-omb-football.jpg',
 3, 1),

('Adidas FIFA World Cup Top Glider Ball',
 'Adidas FIFA World Cup Top Glider training football.',
 35.00,
 '/images/products/adidas-fifa-world-cup-top-glider-football.jpg',
 3, 1),

('Nike Pitch Premier League Football',
 'Nike Pitch Premier League football (yellow/purple) for training.',
 29.99,
 '/images/products/nike-pitch-premier-league-football.jpg',
 3, 7),

('Nike Manchester City Supporters Football',
 'Nike Manchester City supporters football with printed club crest.',
 32.00,
 '/images/products/nike-manchester-city-supporters-football.jpg',
 3, 7),

('Nike Mercurial Veer Football',
 'Nike Mercurial Veer football in white/green/blue colourway.',
 34.50,
 '/images/products/nike-mercurial-veer-football.jpg',
 3, 7),

-- ========== KIT BAGS (Type = 4) ==========
('Babolat Team Line Racket 12 Kit Bag',
 'Babolat Team Line 12 racket kit bag (fluorescent) with large compartments.',
 89.90,
 '/images/products/babolat-team-line-racket-12-kit-bag.jpg',
 4, 6),

('Babolat Pure Strike RH X12 Kit Bag',
 'Babolat Pure Strike RH X12 kit bag (white/red) for tournament players.',
 94.90,
 '/images/products/babolat-pure-strike-rh-x12-kit-bag.jpg',
 4, 6),

('Babolat Team Line 12 Racquet Kit Bag',
 'Babolat Team Line 12 racquet kit bag (silver) with shoulder straps.',
 89.90,
 '/images/products/babolat-team-line-12-racquet-kit-bag.jpg',
 4, 6),

('Yonex SUNR 4826TX BT6-SR Badminton Kit Bag',
 'Yonex SUNR 4826TX BT6-SR badminton kit bag with 2 large racket compartments.',
 79.90,
 '/images/products/yonex-sunr-4826tx-bt6-sr-badminton-kit-bag.jpg',
 4, 4),

('Yonex SUNR LRB05 MS BT6-S Badminton Kit Bag',
 'Yonex SUNR LRB05 MS BT6-S badminton kit bag for 6 rackets.',
 74.90,
 '/images/products/yonex-sunr-lrb05-ms-bt6-s-badminton-kit-bag.jpg',
 4, 4);

