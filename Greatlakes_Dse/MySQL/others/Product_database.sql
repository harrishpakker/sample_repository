create database product;
use product;


CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL,
  `product_category_description` varchar(90) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_category_id`)
);


INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2050,'Electronics',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2051,'Toys',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2052,'Clothes & Accessories',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2053,'Computer',2050);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2054,'Books',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2055,'Mobile Phones',2050);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2056,'Stationery',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2057,'Watches',2050);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2058,'Furnitures',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2059,'Luggage & Bags',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2060,'Home & Kitchen',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2061,'Televisions',2050);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2062,'Tablets',2053);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2063,'Cameras',2050);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2064,'Headphones',2050);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2065,'Music System & Speakers',2050);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2066,'Computer Accessories',2053);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2067,'Laptops',2053);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2068,'Printers',2053);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2069,'Hard disks',2066);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2070,'Pen Drives',2066);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2071,'Mouse',2066);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2072,'Games',2051);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2073,'Puzzles',2051);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2074,'Soft Toys',2051);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2075,'Educational Toys',2051);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2076,'Women\'s Clothes & Accessories',2052);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2077,'Men\'s Clothes & Accessories',2052);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2078,'Kidswear',2052);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2079,'Fiction Books',2054);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2080,'Classic Books',2054);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2081,'Children\'s Books',2054);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2082,'Non-fiction Books',2054);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2083,'Textbooks',2054);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2084,'Sofas',2058);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2085,'Beds & Mattresses',2058);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2086,'Storage & Tables',2058);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2087,'Cookware',2060);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (2088,'Home Appliance',2060);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (3000,'Promotion-High Value',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (3001,'Promotion-Medium Value',NULL);
INSERT INTO product_category(`product_category_id`,`product_category_description`,`parent_category_id`) VALUES (3002,'Promotion-Low Value',NULL);


CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_desc` varchar(100) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `Quantity_in_stock` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_category_id` (`product_category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`)
);

INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (201,'Sky LED 102 CM TV',2061,35000,30,905,750,700,15.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (202,'Sams 192 L4 Single-door Refrigerator',2088,28000,15,1802,750,750,25.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (203,'Jocky Speaker Music System HT32',2065,8900,19,908,300,300,5.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (204,'Cricket Set for Boys',2072,4500,10,890,300,200,18.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (205,'Infant Sleepwear Blue',2078,250,50,596,300,100,0.25);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (206,'Barbie Fab Gown Doll',2074,1000,20,305,150,75,0.15);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (207,'Remote Control Car',2072,2900,29,200,150,50,0.23);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (208,'Doll House',2072,3000,12,600,455,375,0.90);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (209,'Blue Jeans 34',2077,800,100,450,310,52,1.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (210,'Blossoms Lehenga Choli set',2076,3000,100,600,315,54,0.25);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (211,'OnePlus 6 Smart Phone',2055,32500,25,100,65,15,0.55);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (212,'Samsung Galaxy On6',2055,14000,20,120,70,18,0.65);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (213,'Alchemist',2082,150,50,200,100,20,0.24);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (214,'Harry Potter',2079,250,50,210,100,50,0.35);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (215,'Logtech M244 Optical Mouse',2071,450,10,125,85,45,0.11);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (216,'External Hard Disk 500 GB',2069,3500,10,275,285,85,0.53);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (217,'Titan Karishma Watch',2057,3497,35,220,55,24,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (218,'Shell Fingertip Ball Pen',2056,25,150,170,12,170,0.05);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (219,'Ruf-n-Tuf Black PU Leather Belt',2077,350,50,700,45,4,0.16);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (220,'Hello Kitti Lunch Bag',2059,199,15,455,300,225,0.50);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (221,'Cybershot DWC-W325 Camera',2063,5300,5,100,55,40,0.05);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (222,'KitchAsst Siphon Coffee Maker 500 ml',2088,1790,10,150,100,200,1.20);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (223,'Sams 21L Microwave Oven',2088,6880,5,500,400,300,8.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (224,'Phils HL 7430 Mixer Grinder 750W',2088,2265,3,375,400,355,3.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (225,'Solmo Non-stick Sandwich Maker 750 W',2088,1625,10,150,175,70,0.75);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (226,'Solmo Hand Blender Fibre',2088,1415,12,220,100,220,0.56);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (227,'Phils Wah Collection Juicer JM12',2088,2029,2,400,450,425,4.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (228,'Adidas Analog Watch',2057,2295,10,225,60,28,0.12);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (229,'Disney Analog Watch',2057,1600,10,225,60,28,0.12);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (230,'Esprit Analog Watch',2057,3495,5,225,60,28,0.12);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (231,'HP ODC Laptop Bag 15.5',2059,3390,10,550,400,210,0.26);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (232,'Women\'s Hand Bag',2059,1600,15,250,220,170,0.18);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (233,'HP ODC School Bag 2.5\'',2059,799,35,600,450,275,0.36);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (234,'FLUFF Tote Travel Bag 35LTR',2059,3290,8,900,800,600,4.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (235,'Cindy HMPOC Pencil Box (Multicolor)',2056,80,10,250,50,15,0.45);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (236,'Solo Exam SB-01 Writing Pad',2056,350,30,400,300,5,0.55);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (237,'Zamark Color Pencil Art Set',2056,100,10,120,90,20,0.35);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (238,'Kasyo DJ-2100 Desktop Calculator',2056,338,10,150,120,120,0.55);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (239,'TRANS 2D A4 Size Box File',2056,120,6,350,300,100,0.32);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (240,'4M Post It Pad 3.5',2056,35,8,80,80,150,0.12);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (241,'PK Copier A4 75 GSM White Paper Ream',2056,285,2,297,210,NULL,NULL);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (242,'GreenWud CT-NO-PR Coffee Table',2086,3500,6,1250,550,700,50.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (243,'Supreme Fusion Cupboard 02TB',2086,3000,3,1200,350,900,60.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (244,'Foldable Premium Chair',2086,4000,6,75,70,90,20.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (245,'GreenWud Nova Pedestal Unit',2086,2500,5,400,400,600,25.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (246,'Exam Warriors',2081,100,50,200,160,15,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (247,'Small Is Beautiful',2082,140,40,180,100,15,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (248,'To Kill a Mocking Bird',2082,210,35,190,150,20,0.15);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (249,'All-in-one Board Game',2072,450,20,750,320,90,0.50);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (250,'Huwi Wi-Fi Receiver 500Mbps',2066,287,30,100,95,30,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (251,'Samsung 125 cm (50\") Super 6 Series 4K UHD LED Smart TV',2061,46999,35,1125,650,60,13.60);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (252,'LG 123 cm (49\") 4K UHD LED Smart TV 49UK6360PTE (Black)',2061,58990,20,1110,650,81,11.30);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (253,'TCL 138.78 cm (55#) AI 4K UHD Certified Android Smart LED TV 55P8 (Black)',2061,39999,15,2390,1244,775,12.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (254,'Sony Bravia 123.2 cm (49#) Full HD Certified Android Smart LED TV KDL-49W800F (Black)',2061,60499,12,1101,645,57,12.30);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (255,'Canon EOS 1500D 24.1 Digital SLR Camera (Black) with EF S18-55 is II Lens, 16GB Card and Carry Case',2063,21990,32,129,101,78,0.48);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (256,'Sony ILCE-7SM2 12.2MP Camera Body (Black)',2063,165499,15,127,96,60,0.63);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (257,'Sony FE 70-200mm F/2.8 GM OSS Lens for DSLR Cameras (Black and White)',2063,184499,10,200,88,77,1.48);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (258,'Applis Style Rayon Kurti with Palazzo Set for Women Design',2076,1199,40,NULL,NULL,NULL,350.00);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (259,'Sitaram Designer Women\'s Rayon A-Line Kurta with Palazzo Pants',2076,898,40,NULL,NULL,NULL,0.30);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (260,'Mudrika Women\'s Rayon Jaipuri Printed Maxi Long Semi-Stitched Fabric',2076,539,35,NULL,NULL,NULL,0.38);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (261,'Women\'s Plain Regular fit T-Shirt',2076,759,35,NULL,NULL,NULL,0.30);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (262,'Denim Frock for Girls',2078,599,24,NULL,NULL,NULL,0.35);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (263,'Women\'s Anarkali Kurta',2076,401,15,NULL,NULL,NULL,0.35);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (264,'Women\'s Cotton a-line Kurta',2076,398,29,NULL,NULL,NULL,0.38);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (265,'Women\'s Wrap Kurtas Kurta',2076,400,19,NULL,NULL,NULL,0.40);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (266,'Women\'s Cotton Chudidar Bottom',2076,499,34,NULL,NULL,NULL,0.30);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (267,'Women\'s Cotton Dupatta - Black',2076,499,23,NULL,NULL,NULL,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (268,'Women\'s Cotton Dupatta - White',2076,499,21,NULL,NULL,NULL,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (269,'Princess Dress Girls',2078,399,13,NULL,NULL,NULL,0.28);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (270,'Women\'s Palazzo Slub Pants Solid Cotton Casual Trousers',2076,579,34,NULL,NULL,NULL,0.45);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (271,'Women\'s Cotton Casual Trouser',2076,598,14,NULL,NULL,NULL,0.40);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (272,'Women\'s PU Leather Plaid Purses Nubuck Card Holder',2076,399,12,110,90,30,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (273,'Handbag set with handbag, sling bag and wallet',2076,699,14,240,200,70,0.70);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (274,'Fanny Brook Women\'s Wallet (Red Floral)',2076,749,24,1905,1010,255,0.15);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (275,'Jewellery Set for Women (Golden)(CB73485)',2076,349,15,NULL,NULL,NULL,NULL);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (276,'Non-Precious Metal Fashion Jewellery Bohemian Stylish Multi-Color Fancy Party Wear Earrings',2076,1999,25,1038,919,381,NULL);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (277,'Men\'s Hooded Full Sleeve Cotton T-Shirt',2077,265,15,NULL,NULL,NULL,0.25);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (278,'Men\'s Printed Regular Fit T-Shirt',2077,435,15,NULL,NULL,NULL,0.20);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (279,'Men\'s Cotton Full Sleeve T-Shirt',2077,474,18,NULL,NULL,NULL,0.20);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (280,'Men\'s Slim Fit Stretchable Jeans',2077,737,18,NULL,NULL,NULL,0.20);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (281,'Leons Fab Girls Embroidered Semi Stitched Wedding Lehenga Choli',2078,549,15,NULL,NULL,NULL,0.45);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (282,'Gradient Men\'s Rectangular Sunglasses',2077,3670,22,NULL,NULL,NULL,0.05);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (283,'T2F Boy\'s and Girl\'s Cotton Shorts - Pack of 5',2078,364,19,NULL,NULL,NULL,0.55);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (284,'Beaded Bracelet for Men (Golden)',2077,366,8,NULL,NULL,NULL,0.15);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (285,'Redmi Note 8 Pro | World\'s 1st 64MP Quad Camera Beast',2055,15998,23,162,76,9,0.20);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (286,'Samsung Galaxy A30s (Prism Crush Black, 4GB RAM, 64GB Storage)',2055,15999,25,158,75,8,0.17);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (287,'OPPO F11 Pro (Thunder Black, 6GB RAM, 128GB Storage)',2055,19990,19,161,76,9,0.19);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (288,'Vivo U10 (Electric Blue, 5000 mAH 18W Fast Charge Battery, 3GB RAM, 32GB Storage)',2055,8990,26,159,77,9,0.19);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (289,'Olele® Kids Denim Dungarees for Boys',2078,1299,27,NULL,NULL,NULL,0.45);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (290,'Girls Full Length Gown Dress',2078,599,28,NULL,NULL,NULL,0.35);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (291,'Baby Girls Frock Birthday Dress',2078,539,14,NULL,NULL,NULL,0.38);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99990,'Quanta 4 Port USB Hub',3000,500,50,180,125,30,0.05);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99991,'Dell Targus Synergy 2.0 Backpack',3002,999,250,450,250,50,0.50);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99992,'Tom Clancy\'s Ghost Recon: Future Soldier (PC Game)',3002,999,250,150,200,10,0.10);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99993,'Nokia 1280 (Black)',3002,999,250,45,107,15,0.08);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99994,'HP Deskjet 2050 All-in-One - J510a Printer',3001,3749,100,249,427,406,3.60);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99995,'LG MS-2049UW Solo Microwave',3001,4800,100,455,252,320,5.60);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99996,'Nokia Asha 200 (Graphite)',3001,4070,100,61,115,14,0.11);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99997,'Sony Xperia U (Black White)',3000,16499,50,54,112,12,0.11);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99998,'Nikon Coolpix L810 Bridge',3000,14987,50,111,76,83,0.43);
INSERT INTO `product` (`product_id`,`product_desc`,`product_category_id`,`product_price`,`Quantity_in_stock`,`length`,`width`,`height`,`weight`) VALUES (99999,'Samsung Galaxy Tab 2 P3100',3000,19300,50,122,194,10,0.35);

