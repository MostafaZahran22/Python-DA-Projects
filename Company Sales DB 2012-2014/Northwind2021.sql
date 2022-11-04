/*DROP DATABASE Northwind2021;*/
CREATE DATABASE Northwind2021;

USE Northwind2021;

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer (
   Id                   int                  ,
   FirstName            nvarchar(40)         not null,
   LastName             nvarchar(40)         not null,
   City                 nvarchar(40)         null,
   Country              nvarchar(40)         null,
   Phone                nvarchar(20)         null,
   constraint PK_CUSTOMER primary key (Id)
);


/*==============================================================*/
/* Index: IndexCustomerName                                     */
/*==============================================================*/
create index IndexCustomerName on Customer (
LastName ASC,
FirstName ASC
);

/*==============================================================*/
/* Table: "Orders"                                               */
/*==============================================================*/
create table Orders (
   Id                   int                  ,
   OrderDate            nvarchar(30),
   OrderNumber          nvarchar(10)         null,
   CustomerId           int                  not null,
   TotalAmount          decimal(12,2)        null default 0,
   constraint PK_ORDER primary key (Id)
);


/*==============================================================*/
/* Index: IndexOrderCustomerId                                  */
/*==============================================================*/
create index IndexOrderCustomerId on Orders (
CustomerId ASC
);

/*==============================================================*/
/* Index: IndexOrderOrderDate                                   */
/*==============================================================*/
create index IndexOrderOrderDate on Orders (
OrderDate ASC
);

/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
create table OrderItem (
   Id                   int                  ,
   OrderId              int                  not null,
   ProductId            int                  not null,
   UnitPrice            decimal(12,2)        not null default 0,
   Quantity             int                  not null default 1,
   constraint PK_ORDERITEM primary key (Id)
);

/*==============================================================*/
/* Index: IndexOrderItemOrderId                                 */
/*==============================================================*/
create index IndexOrderItemOrderId on OrderItem (
OrderId ASC
);

/*==============================================================*/
/* Index: IndexOrderItemProductId                               */
/*==============================================================*/
create index IndexOrderItemProductId on OrderItem (
ProductId ASC
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product (
   Id                   int                  ,
   ProductName          nvarchar(50)         not null,
   SupplierId           int                  not null,
   UnitPrice            decimal(12,2)        null default 0,
   Package              nvarchar(30)         null,
   IsDiscontinued       bit                  not null default 0,
   constraint PK_PRODUCT primary key (Id)
);

/*==============================================================*/
/* Index: IndexProductSupplierId                                */
/*==============================================================*/
create index IndexProductSupplierId on Product (
SupplierId ASC
);

/*==============================================================*/
/* Index: IndexProductName                                      */
/*==============================================================*/
create index IndexProductName on Product (
ProductName ASC
);

/*==============================================================*/
/* Table: Supplier                                              */
/*==============================================================*/
create table Supplier (
   Id                   int                  ,
   CompanyName          nvarchar(40)         not null,
   ContactName          nvarchar(50)         null,
   ContactTitle         nvarchar(40)         null,
   City                 nvarchar(40)         null,
   Country              nvarchar(40)         null,
   Phone                nvarchar(30)         null,
   Fax                  nvarchar(30)         null,
   constraint PK_SUPPLIER primary key (Id)
);

/*==============================================================*/
/* Index: IndexSupplierName                                     */
/*==============================================================*/
create index IndexSupplierName on Supplier (
CompanyName ASC
);

/*==============================================================*/
/* Index: IndexSupplierCountry                                  */
/*==============================================================*/
create index IndexSupplierCountry on Supplier (
Country ASC
);



INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(1,'Maria','Anders','Berlin','Germany','030-0074321')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(2,'Ana','Trujillo','México D.F.','Mexico','(5) 555-4729')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(3,'Antonio','Moreno','México D.F.','Mexico','(5) 555-3932')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(4,'Thomas','Hardy','London','UK','(171) 555-7788')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(5,'Christina','Berglund','Luleå','Sweden','0921-12 34 65')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(6,'Hanna','Moos','Mannheim','Germany','0621-08460')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(7,'Frédérique','Citeaux','Strasbourg','France','88.60.15.31')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(8,'Martín','Sommer','Madrid','Spain','(91) 555 22 82')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(9,'Laurence','Lebihan','Marseille','France','91.24.45.40')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(10,'Elizabeth','Lincoln','Tsawassen','Canada','(604) 555-4729')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(11,'Victoria','Ashworth','London','UK','(171) 555-1212')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(12,'Patricio','Simpson','Buenos Aires','Argentina','(1) 135-5555')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(13,'Francisco','Chang','México D.F.','Mexico','(5) 555-3392')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(14,'Yang','Wang','Bern','Switzerland','0452-076545')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(15,'Pedro','Afonso','Sao Paulo','Brazil','(11) 555-7647')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(16,'Elizabeth','Brown','London','UK','(171) 555-2282')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(17,'Sven','Ottlieb','Aachen','Germany','0241-039123')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(18,'Janine','Labrune','Nantes','France','40.67.88.88')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(19,'Ann','Devon','London','UK','(171) 555-0297')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(20,'Roland','Mendel','Graz','Austria','7675-3425')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(21,'Aria','Cruz','Sao Paulo','Brazil','(11) 555-9857')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(22,'Diego','Roel','Madrid','Spain','(91) 555 94 44')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(23,'Martine','Rancé','Lille','France','20.16.10.16')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(24,'Maria','Larsson','Bräcke','Sweden','0695-34 67 21')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(25,'Peter','Franken','München','Germany','089-0877310')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(26,'Carine','Schmitt','Nantes','France','40.32.21.21')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(27,'Paolo','Accorti','Torino','Italy','011-4988260')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(28,'Lino','Rodriguez','Lisboa','Portugal','(1) 354-2534')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(29,'Eduardo','Saavedra','Barcelona','Spain','(93) 203 4560')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(30,'José','Pedro Freyre','Sevilla','Spain','(95) 555 82 82')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(31,'André','Fonseca','Campinas','Brazil','(11) 555-9482')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(32,'Howard','Snyder','Eugene','USA','(503) 555-7555')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(33,'Manuel','Pereira','Caracas','Venezuela','(2) 283-2951')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(34,'Mario','Pontes','Rio de Janeiro','Brazil','(21) 555-0091')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(35,'Carlos','Hernández','San Cristóbal','Venezuela','(5) 555-1340')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(36,'Yoshi','Latimer','Elgin','USA','(503) 555-6874')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(37,'Patricia','McKenna','Cork','Ireland','2967 542')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(38,'Helen','Bennett','Cowes','UK','(198) 555-8888')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(39,'Philip','Cramer','Brandenburg','Germany','0555-09876')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(40,'Daniel','Tonini','Versailles','France','30.59.84.10')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(41,'Annette','Roulet','Toulouse','France','61.77.61.10')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(42,'Yoshi','Tannamuri','Vancouver','Canada','(604) 555-3392')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(43,'John','Steel','Walla Walla','USA','(509) 555-7969')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(44,'Renate','Messner','Frankfurt a.M.','Germany','069-0245984')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(45,'Jaime','Yorres','San Francisco','USA','(415) 555-5938')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(46,'Carlos','González','Barquisimeto','Venezuela','(9) 331-6954')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(47,'Felipe','Izquierdo','I. de Margarita','Venezuela','(8) 34-56-12')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(48,'Fran','Wilson','Portland','USA','(503) 555-9573')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(49,'Giovanni','Rovelli','Bergamo','Italy','035-640230')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(50,'Catherine','Dewey','Bruxelles','Belgium','(02) 201 24 67')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(51,'Jean','Fresnière','Montréal','Canada','(514) 555-8054')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(52,'Alexander','Feuer','Leipzig','Germany','0342-023176')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(53,'Simon','Crowther','London','UK','(171) 555-7733')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(54,'Yvonne','Moncada','Buenos Aires','Argentina','(1) 135-5333')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(55,'Rene','Phillips','Anchorage','USA','(907) 555-7584')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(56,'Henriette','Pfalzheim','Köln','Germany','0221-0644327')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(57,'Marie','Bertrand','Paris','France','(1) 42.34.22.66')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(58,'Guillermo','Fernández','México D.F.','Mexico','(5) 552-3745')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(59,'Georg','Pipps','Salzburg','Austria','6562-9722')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(60,'Isabel','de Castro','Lisboa','Portugal','(1) 356-5634')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(61,'Bernardo','Batista','Rio de Janeiro','Brazil','(21) 555-4252')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(62,'Lúcia','Carvalho','Sao Paulo','Brazil','(11) 555-1189')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(63,'Horst','Kloss','Cunewalde','Germany','0372-035188')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(64,'Sergio','Gutiérrez','Buenos Aires','Argentina','(1) 123-5555')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(65,'Paula','Wilson','Albuquerque','USA','(505) 555-5939')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(66,'Maurizio','Moroni','Reggio Emilia','Italy','0522-556721')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(67,'Janete','Limeira','Rio de Janeiro','Brazil','(21) 555-3412')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(68,'Michael','Holz','Genève','Switzerland','0897-034214')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(69,'Alejandra','Camino','Madrid','Spain','(91) 745 6200')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(70,'Jonas','Bergulfsen','Stavern','Norway','07-98 92 35')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(71,'Jose','Pavarotti','Boise','USA','(208) 555-8097')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(72,'Hari','Kumar','London','UK','(171) 555-1717')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(73,'Jytte','Petersen','Kobenhavn','Denmark','31 12 34 56')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(74,'Dominique','Perrier','Paris','France','(1) 47.55.60.10')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(75,'Art','Braunschweiger','Lander','USA','(307) 555-4680')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(76,'Pascale','Cartrain','Charleroi','Belgium','(071) 23 67 22 20')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(77,'Liz','Nixon','Portland','USA','(503) 555-3612')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(78,'Liu','Wong','Butte','USA','(406) 555-5834')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(79,'Karin','Josephs','Münster','Germany','0251-031259')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(80,'Miguel','Angel Paolino','México D.F.','Mexico','(5) 555-2933')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(81,'Anabela','Domingues','Sao Paulo','Brazil','(11) 555-2167')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(82,'Helvetius','Nagy','Kirkland','USA','(206) 555-8257')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(83,'Palle','Ibsen','Århus','Denmark','86 21 32 43')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(84,'Mary','Saveley','Lyon','France','78.32.54.86')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(85,'Paul','Henriot','Reims','France','26.47.15.10')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(86,'Rita','Müller','Stuttgart','Germany','0711-020361')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(87,'Pirkko','Koskitalo','Oulu','Finland','981-443655')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(88,'Paula','Parente','Resende','Brazil','(14) 555-8122')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(89,'Karl','Jablonski','Seattle','USA','(206) 555-4112')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(90,'Matti','Karttunen','Helsinki','Finland','90-224 8858')
;
INSERT INTO Customer (Id,FirstName,LastName,City,Country,Phone)VALUES(91,'Zbyszek','Piestrzeniewicz','Warszawa','Poland','(26) 642-7012')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(1,'Exotic Liquids','Charlotte Cooper','London','UK','(171) 555-2222',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(2,'New Orleans Cajun Delights','Shelley Burke','New Orleans','USA','(100) 555-4822',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(3,'Grandma Kelly''s Homestead','Regina Murphy','Ann Arbor','USA','(313) 555-5735','(313) 555-3349')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(4,'Tokyo Traders','Yoshi Nagase','Tokyo','Japan','(03) 3555-5011',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Oviedo','Spain','(98) 598 76 54',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(6,'Mayumi''s','Mayumi Ohno','Osaka','Japan','(06) 431-7877',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(7,'Pavlova, Ltd.','Ian Devling','Melbourne','Australia','(03) 444-2343','(03) 444-6588')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(8,'Specialty Biscuits, Ltd.','Peter Wilson','Manchester','UK','(161) 555-4448',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(9,'PB Knäckebröd AB','Lars Peterson','Göteborg','Sweden','031-987 65 43','031-987 65 91')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(10,'Refrescos Americanas LTDA','Carlos Diaz','Sao Paulo','Brazil','(11) 555 4640',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Berlin','Germany','(010) 9984510',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Frankfurt','Germany','(069) 992755',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Cuxhaven','Germany','(04721) 8713','(04721) 8714')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(14,'Formaggi Fortini s.r.l.','Elio Rossi','Ravenna','Italy','(0544) 60323','(0544) 60603')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(15,'Norske Meierier','Beate Vileid','Sandvika','Norway','(0)2-953010',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(16,'Bigfoot Breweries','Cheryl Saylor','Bend','USA','(503) 555-9931',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(17,'Svensk Sjöföda AB','Michael Björn','Stockholm','Sweden','08-123 45 67',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(18,'Aux joyeux ecclésiastiques','Guylène Nodier','Paris','France','(1) 03.83.00.68','(1) 03.83.00.62')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(19,'New England Seafood Cannery','Robb Merchant','Boston','USA','(617) 555-3267','(617) 555-3389')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(20,'Leka Trading','Chandra Leka','Singapore','Singapore','555-8787',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(21,'Lyngbysild','Niels Petersen','Lyngby','Denmark','43844108','43844115')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(22,'Zaanse Snoepfabriek','Dirk Luchte','Zaandam','Netherlands','(12345) 1212','(12345) 1210')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(23,'Karkki Oy','Anne Heikkonen','Lappeenranta','Finland','(953) 10956',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(24,'G''day, Mate','Wendy Mackenzie','Sydney','Australia','(02) 555-5914','(02) 555-4873')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(25,'Ma Maison','Jean-Guy Lauzon','Montréal','Canada','(514) 555-9022',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Salerno','Italy','(089) 6547665','(089) 6547667')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(27,'Escargots Nouveaux','Marie Delamare','Montceau','France','85.57.00.07',NULL)
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(28,'Gai pâturage','Eliane Noz','Annecy','France','38.76.98.06','38.76.98.58')
;
INSERT INTO Supplier (Id,CompanyName,ContactName,City,Country,Phone,Fax)VALUES(29,'Forêts d''érables','Chantal Goulet','Ste-Hyacinthe','Canada','(514) 555-2955','(514) 555-2921')
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(1,'Chai',1,18.00,'10 boxes x 20 bags',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(2,'Chang',1,19.00,'24 - 12 oz bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(3,'Aniseed Syrup',1,10.00,'12 - 550 ml bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(4,'Chef Anton''s Cajun Seasoning',2,22.00,'48 - 6 oz jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(5,'Chef Anton''s Gumbo Mix',2,21.35,'36 boxes',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(6,'Grandma''s Boysenberry Spread',3,25.00,'12 - 8 oz jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(7,'Uncle Bob''s Organic Dried Pears',3,30.00,'12 - 1 lb pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(8,'Northwoods Cranberry Sauce',3,40.00,'12 - 12 oz jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(9,'Mishi Kobe Niku',4,97.00,'18 - 500 g pkgs.',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(10,'Ikura',4,31.00,'12 - 200 ml jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(11,'Queso Cabrales',5,21.00,'1 kg pkg.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(12,'Queso Manchego La Pastora',5,38.00,'10 - 500 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(13,'Konbu',6,6.00,'2 kg box',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(14,'Tofu',6,23.25,'40 - 100 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(15,'Genen Shouyu',6,15.50,'24 - 250 ml bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(16,'Pavlova',7,17.45,'32 - 500 g boxes',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(17,'Alice Mutton',7,39.00,'20 - 1 kg tins',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(18,'Carnarvon Tigers',7,62.50,'16 kg pkg.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(19,'Teatime Chocolate Biscuits',8,9.20,'10 boxes x 12 pieces',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(20,'Sir Rodney''s Marmalade',8,81.00,'30 gift boxes',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(21,'Sir Rodney''s Scones',8,10.00,'24 pkgs. x 4 pieces',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(22,'Gustaf''s Knäckebröd',9,21.00,'24 - 500 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(23,'Tunnbröd',9,9.00,'12 - 250 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(24,'Guaraná Fantástica',10,4.50,'12 - 355 ml cans',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(25,'NuNuCa Nuß-Nougat-Creme',11,14.00,'20 - 450 g glasses',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(26,'Gumbär Gummibärchen',11,31.23,'100 - 250 g bags',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(27,'Schoggi Schokolade',11,43.90,'100 - 100 g pieces',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(28,'Rössle Sauerkraut',12,45.60,'25 - 825 g cans',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(29,'Thüringer Rostbratwurst',12,123.79,'50 bags x 30 sausgs.',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(30,'Nord-Ost Matjeshering',13,25.89,'10 - 200 g glasses',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(31,'Gorgonzola Telino',14,12.50,'12 - 100 g pkgs',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(32,'Mascarpone Fabioli',14,32.00,'24 - 200 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(33,'Geitost',15,2.50,'500 g',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(34,'Sasquatch Ale',16,14.00,'24 - 12 oz bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(35,'Steeleye Stout',16,18.00,'24 - 12 oz bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(36,'Inlagd Sill',17,19.00,'24 - 250 g  jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(37,'Gravad lax',17,26.00,'12 - 500 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(38,'Côte de Blaye',18,263.50,'12 - 75 cl bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(39,'Chartreuse verte',18,18.00,'750 cc per bottle',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(40,'Boston Crab Meat',19,18.40,'24 - 4 oz tins',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(41,'Jack''s New England Clam Chowder',19,9.65,'12 - 12 oz cans',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(42,'Singaporean Hokkien Fried Mee',20,14.00,'32 - 1 kg pkgs.',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(43,'Ipoh Coffee',20,46.00,'16 - 500 g tins',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(44,'Gula Malacca',20,19.45,'20 - 2 kg bags',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(45,'Rogede sild',21,9.50,'1k pkg.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(46,'Spegesild',21,12.00,'4 - 450 g glasses',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(47,'Zaanse koeken',22,9.50,'10 - 4 oz boxes',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(48,'Chocolade',22,12.75,'10 pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(49,'Maxilaku',23,20.00,'24 - 50 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(50,'Valkoinen suklaa',23,16.25,'12 - 100 g bars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(51,'Manjimup Dried Apples',24,53.00,'50 - 300 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(52,'Filo Mix',24,7.00,'16 - 2 kg boxes',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(53,'Perth Pasties',24,32.80,'48 pieces',1)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(54,'Tourtière',25,7.45,'16 pies',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(55,'Pâté chinois',25,24.00,'24 boxes x 2 pies',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(56,'Gnocchi di nonna Alice',26,38.00,'24 - 250 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(57,'Ravioli Angelo',26,19.50,'24 - 250 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(58,'Escargots de Bourgogne',27,13.25,'24 pieces',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(59,'Raclette Courdavault',28,55.00,'5 kg pkg.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(60,'Camembert Pierrot',28,34.00,'15 - 300 g rounds',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(61,'Sirop d''érable',29,28.50,'24 - 500 ml bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(62,'Tarte au sucre',29,49.30,'48 pies',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(63,'Vegie-spread',7,43.90,'15 - 625 g jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(64,'Wimmers gute Semmelknödel',12,33.25,'20 bags x 4 pieces',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(65,'Louisiana Fiery Hot Pepper Sauce',2,21.05,'32 - 8 oz bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(66,'Louisiana Hot Spiced Okra',2,17.00,'24 - 8 oz jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(67,'Laughing Lumberjack Lager',16,14.00,'24 - 12 oz bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(68,'Scottish Longbreads',8,12.50,'10 boxes x 8 pieces',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(69,'Gudbrandsdalsost',15,36.00,'10 kg pkg.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(70,'Outback Lager',7,15.00,'24 - 355 ml bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(71,'Flotemysost',15,21.50,'10 - 500 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(72,'Mozzarella di Giovanni',14,34.80,'24 - 200 g pkgs.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(73,'Röd Kaviar',17,15.00,'24 - 150 g jars',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(74,'Longlife Tofu',4,10.00,'5 kg pkg.',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(75,'Rhönbräu Klosterbier',12,7.75,'24 - 0.5 l bottles',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(76,'Lakkalikööri',23,18.00,'500 ml',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(77,'Original Frankfurter grüne Soße',12,13.00,'12 boxes',0)
;
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(78,'Stroopwafels',22,9.75,'24 pieces',0)
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(1,'Jul  4 2012 12:00:00:000AM',85,440.00,'542378')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(2,'Jul  5 2012 12:00:00:000AM',79,1863.40,'542379')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(3,'Jul  8 2012 12:00:00:000AM',34,1813.00,'542380')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(4,'Jul  8 2012 12:00:00:000AM',84,670.80,'542381')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(5,'Jul  9 2012 12:00:00:000AM',76,3730.00,'542382')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(6,'Jul 10 2012 12:00:00:000AM',34,1444.80,'542383')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(7,'Jul 11 2012 12:00:00:000AM',14,625.20,'542384')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(8,'Jul 12 2012 12:00:00:000AM',68,2490.50,'542385')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(9,'Jul 15 2012 12:00:00:000AM',88,517.80,'542386')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(10,'Jul 16 2012 12:00:00:000AM',35,1119.90,'542387')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(11,'Jul 17 2012 12:00:00:000AM',20,2018.60,'542388')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(12,'Jul 18 2012 12:00:00:000AM',13,100.80,'542389')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(13,'Jul 19 2012 12:00:00:000AM',56,1746.20,'542390')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(14,'Jul 19 2012 12:00:00:000AM',61,448.00,'542391')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(15,'Jul 22 2012 12:00:00:000AM',65,624.80,'542392')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(16,'Jul 23 2012 12:00:00:000AM',20,2464.80,'542393')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(17,'Jul 24 2012 12:00:00:000AM',24,724.50,'542394')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(18,'Jul 25 2012 12:00:00:000AM',7,1176.00,'542395')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(19,'Jul 26 2012 12:00:00:000AM',87,364.80,'542396')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(20,'Jul 29 2012 12:00:00:000AM',25,4031.00,'542397')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(21,'Jul 30 2012 12:00:00:000AM',33,1101.20,'542398')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(22,'Jul 31 2012 12:00:00:000AM',89,676.00,'542399')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(23,'Aug  1 2012 12:00:00:000AM',87,1376.00,'542400')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(24,'Aug  1 2012 12:00:00:000AM',75,48.00,'542401')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(25,'Aug  2 2012 12:00:00:000AM',65,1456.00,'542402')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(26,'Aug  5 2012 12:00:00:000AM',63,2142.40,'542403')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(27,'Aug  6 2012 12:00:00:000AM',85,538.60,'542404')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(28,'Aug  7 2012 12:00:00:000AM',49,307.20,'542405')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(29,'Aug  8 2012 12:00:00:000AM',80,420.00,'542406')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(30,'Aug  9 2012 12:00:00:000AM',52,1200.80,'542407')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(31,'Aug 12 2012 12:00:00:000AM',5,1488.80,'542408')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(32,'Aug 13 2012 12:00:00:000AM',44,468.00,'542409')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(33,'Aug 14 2012 12:00:00:000AM',5,613.20,'542410')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(34,'Aug 14 2012 12:00:00:000AM',69,86.50,'542411')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(35,'Aug 15 2012 12:00:00:000AM',69,155.40,'542412')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(36,'Aug 16 2012 12:00:00:000AM',46,1414.80,'542413')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(37,'Aug 19 2012 12:00:00:000AM',44,1452.00,'542414')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(38,'Aug 20 2012 12:00:00:000AM',63,2179.20,'542415')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(39,'Aug 21 2012 12:00:00:000AM',63,3016.00,'542416')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(40,'Aug 22 2012 12:00:00:000AM',67,924.00,'542417')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(41,'Aug 23 2012 12:00:00:000AM',66,89.00,'542418')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(42,'Aug 26 2012 12:00:00:000AM',11,479.40,'542419')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(43,'Aug 27 2012 12:00:00:000AM',15,2169.00,'542420')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(44,'Aug 27 2012 12:00:00:000AM',61,552.80,'542421')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(45,'Aug 28 2012 12:00:00:000AM',81,1296.00,'542422')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(46,'Aug 29 2012 12:00:00:000AM',80,848.70,'542423')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(47,'Aug 30 2012 12:00:00:000AM',65,1887.60,'542424')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(48,'Sep  2 2012 12:00:00:000AM',85,121.60,'542425')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(49,'Sep  3 2012 12:00:00:000AM',46,1050.60,'542426')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(50,'Sep  4 2012 12:00:00:000AM',7,1420.00,'542427')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(51,'Sep  5 2012 12:00:00:000AM',37,3127.00,'542428')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(52,'Sep  6 2012 12:00:00:000AM',67,349.50,'542429')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(53,'Sep  9 2012 12:00:00:000AM',49,608.00,'542430')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(54,'Sep  9 2012 12:00:00:000AM',86,755.00,'542431')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(55,'Sep 10 2012 12:00:00:000AM',76,2708.80,'542432')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(56,'Sep 11 2012 12:00:00:000AM',30,1242.00,'542433')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(57,'Sep 12 2012 12:00:00:000AM',80,954.40,'542434')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(58,'Sep 13 2012 12:00:00:000AM',55,4157.00,'542435')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(59,'Sep 16 2012 12:00:00:000AM',69,498.50,'542436')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(60,'Sep 17 2012 12:00:00:000AM',48,424.00,'542437')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(61,'Sep 18 2012 12:00:00:000AM',2,88.80,'542438')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(62,'Sep 19 2012 12:00:00:000AM',37,1762.00,'542439')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(63,'Sep 20 2012 12:00:00:000AM',77,336.00,'542440')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(64,'Sep 20 2012 12:00:00:000AM',18,268.80,'542441')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(65,'Sep 23 2012 12:00:00:000AM',86,1614.80,'542442')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(66,'Sep 24 2012 12:00:00:000AM',63,182.40,'542443')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(67,'Sep 25 2012 12:00:00:000AM',65,2327.00,'542444')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(68,'Sep 26 2012 12:00:00:000AM',38,516.80,'542445')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(69,'Sep 27 2012 12:00:00:000AM',65,2835.00,'542446')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(70,'Sep 30 2012 12:00:00:000AM',48,288.00,'542447')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(71,'Oct  1 2012 12:00:00:000AM',38,240.40,'542448')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(72,'Oct  2 2012 12:00:00:000AM',80,1191.20,'542449')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(73,'Oct  3 2012 12:00:00:000AM',87,516.00,'542450')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(74,'Oct  3 2012 12:00:00:000AM',38,144.00,'542451')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(75,'Oct  4 2012 12:00:00:000AM',58,112.00,'542452')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(76,'Oct  7 2012 12:00:00:000AM',39,164.40,'542453')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(77,'Oct  8 2012 12:00:00:000AM',71,6155.90,'542454')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(78,'Oct  9 2012 12:00:00:000AM',39,1497.00,'542455')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(79,'Oct 10 2012 12:00:00:000AM',8,982.00,'542456')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(80,'Oct 11 2012 12:00:00:000AM',24,2262.50,'542457')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(81,'Oct 14 2012 12:00:00:000AM',28,1168.00,'542458')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(82,'Oct 15 2012 12:00:00:000AM',75,4819.40,'542459')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(83,'Oct 16 2012 12:00:00:000AM',46,1940.00,'542460')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(84,'Oct 16 2012 12:00:00:000AM',9,88.50,'542461')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(85,'Oct 17 2012 12:00:00:000AM',51,2233.60,'542462')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(86,'Oct 18 2012 12:00:00:000AM',87,954.00,'542463')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(87,'Oct 21 2012 12:00:00:000AM',84,144.80,'542464')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(88,'Oct 22 2012 12:00:00:000AM',37,2545.20,'542465')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(89,'Oct 23 2012 12:00:00:000AM',60,316.80,'542466')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(90,'Oct 24 2012 12:00:00:000AM',25,2467.00,'542467')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(91,'Oct 25 2012 12:00:00:000AM',55,934.50,'542468')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(92,'Oct 28 2012 12:00:00:000AM',51,3463.20,'542469')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(93,'Oct 29 2012 12:00:00:000AM',9,2564.40,'542470')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(94,'Oct 29 2012 12:00:00:000AM',73,412.00,'542471')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(95,'Oct 30 2012 12:00:00:000AM',25,2300.80,'542472')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(96,'Oct 31 2012 12:00:00:000AM',44,1586.00,'542473')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(97,'Nov  1 2012 12:00:00:000AM',89,2856.00,'542474')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(98,'Nov  4 2012 12:00:00:000AM',63,2924.80,'542475')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(99,'Nov  5 2012 12:00:00:000AM',65,1731.20,'542476')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(100,'Nov  6 2012 12:00:00:000AM',21,928.00,'542477')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(101,'Nov  7 2012 12:00:00:000AM',86,396.00,'542478')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(102,'Nov  8 2012 12:00:00:000AM',75,141.60,'542479')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(103,'Nov 11 2012 12:00:00:000AM',41,713.40,'542480')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(104,'Nov 11 2012 12:00:00:000AM',20,5677.60,'542481')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(105,'Nov 12 2012 12:00:00:000AM',28,154.00,'542482')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(106,'Nov 13 2012 12:00:00:000AM',59,10741.60,'542483')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(107,'Nov 14 2012 12:00:00:000AM',58,568.80,'542484')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(108,'Nov 15 2012 12:00:00:000AM',4,480.00,'542485')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(109,'Nov 18 2012 12:00:00:000AM',86,1106.40,'542486')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(110,'Nov 19 2012 12:00:00:000AM',46,1360.00,'542487')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(111,'Nov 20 2012 12:00:00:000AM',41,452.00,'542488')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(112,'Nov 21 2012 12:00:00:000AM',72,3654.40,'542489')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(113,'Nov 22 2012 12:00:00:000AM',7,7390.20,'542490')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(114,'Nov 22 2012 12:00:00:000AM',63,2273.60,'542491')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(115,'Nov 25 2012 12:00:00:000AM',9,1549.60,'542492')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(116,'Nov 26 2012 12:00:00:000AM',17,447.20,'542493')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(117,'Nov 26 2012 12:00:00:000AM',19,950.00,'542494')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(118,'Nov 27 2012 12:00:00:000AM',3,403.20,'542495')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(119,'Nov 28 2012 12:00:00:000AM',29,136.00,'542496')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(120,'Nov 28 2012 12:00:00:000AM',83,834.20,'542497')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(121,'Nov 29 2012 12:00:00:000AM',20,1834.20,'542498')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(122,'Dec  2 2012 12:00:00:000AM',75,2527.20,'542499')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(123,'Dec  3 2012 12:00:00:000AM',14,1174.00,'542500')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(124,'Dec  3 2012 12:00:00:000AM',41,91.20,'542501')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(125,'Dec  4 2012 12:00:00:000AM',62,12281.20,'542502')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(126,'Dec  5 2012 12:00:00:000AM',37,1708.00,'542503')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(127,'Dec  5 2012 12:00:00:000AM',91,459.00,'542504')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(128,'Dec  6 2012 12:00:00:000AM',36,338.00,'542505')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(129,'Dec  9 2012 12:00:00:000AM',51,420.00,'542506')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(130,'Dec  9 2012 12:00:00:000AM',72,1016.00,'542507')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(131,'Dec 10 2012 12:00:00:000AM',24,103.20,'542508')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(132,'Dec 11 2012 12:00:00:000AM',61,959.20,'542509')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(133,'Dec 12 2012 12:00:00:000AM',37,1419.80,'542510')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(134,'Dec 12 2012 12:00:00:000AM',46,112.00,'542511')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(135,'Dec 13 2012 12:00:00:000AM',20,2900.00,'542512')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(136,'Dec 16 2012 12:00:00:000AM',4,899.00,'542513')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(137,'Dec 16 2012 12:00:00:000AM',5,2222.40,'542514')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(138,'Dec 17 2012 12:00:00:000AM',75,864.00,'542515')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(139,'Dec 18 2012 12:00:00:000AM',21,166.00,'542516')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(140,'Dec 18 2012 12:00:00:000AM',70,1058.40,'542517')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(141,'Dec 19 2012 12:00:00:000AM',72,1274.00,'542518')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(142,'Dec 20 2012 12:00:00:000AM',10,1832.80,'542519')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(143,'Dec 23 2012 12:00:00:000AM',20,2275.20,'542520')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(144,'Dec 23 2012 12:00:00:000AM',17,86.40,'542521')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(145,'Dec 24 2012 12:00:00:000AM',59,1440.00,'542522')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(146,'Dec 25 2012 12:00:00:000AM',71,3302.60,'542523')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(147,'Dec 25 2012 12:00:00:000AM',36,442.00,'542524')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(148,'Dec 26 2012 12:00:00:000AM',35,2333.20,'542525')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(149,'Dec 27 2012 12:00:00:000AM',25,1903.80,'542526')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(150,'Dec 27 2012 12:00:00:000AM',60,843.20,'542527')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(151,'Dec 30 2012 12:00:00:000AM',71,2736.00,'542528')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(152,'Dec 31 2012 12:00:00:000AM',83,1765.60,'542529')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(153,'Jan  1 2013 12:00:00:000AM',19,3063.00,'542530')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(154,'Jan  1 2013 12:00:00:000AM',65,3868.60,'542531')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(155,'Jan  2 2013 12:00:00:000AM',20,2713.50,'542532')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(156,'Jan  3 2013 12:00:00:000AM',20,1005.90,'542533')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(157,'Jan  3 2013 12:00:00:000AM',49,1675.00,'542534')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(158,'Jan  6 2013 12:00:00:000AM',47,400.00,'542535')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(159,'Jan  7 2013 12:00:00:000AM',62,2018.20,'542536')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(160,'Jan  7 2013 12:00:00:000AM',56,1194.00,'542537')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(161,'Jan  8 2013 12:00:00:000AM',23,1622.40,'542538')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(162,'Jan  9 2013 12:00:00:000AM',54,319.20,'542539')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(163,'Jan 10 2013 12:00:00:000AM',10,802.00,'542540')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(164,'Jan 10 2013 12:00:00:000AM',10,1208.50,'542541')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(165,'Jan 13 2013 12:00:00:000AM',87,372.00,'542542')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(166,'Jan 14 2013 12:00:00:000AM',41,2123.20,'542543')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(167,'Jan 14 2013 12:00:00:000AM',21,231.40,'542544')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(168,'Jan 15 2013 12:00:00:000AM',36,102.40,'542545')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(169,'Jan 16 2013 12:00:00:000AM',87,720.00,'542546')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(170,'Jan 16 2013 12:00:00:000AM',73,11283.20,'542547')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(171,'Jan 17 2013 12:00:00:000AM',63,1814.80,'542548')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(172,'Jan 20 2013 12:00:00:000AM',68,2208.00,'542549')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(173,'Jan 21 2013 12:00:00:000AM',88,1897.60,'542550')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(174,'Jan 21 2013 12:00:00:000AM',61,1273.20,'542551')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(175,'Jan 22 2013 12:00:00:000AM',27,49.80,'542552')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(176,'Jan 23 2013 12:00:00:000AM',31,1020.00,'542553')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(177,'Jan 23 2013 12:00:00:000AM',51,11493.20,'542554')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(178,'Jan 24 2013 12:00:00:000AM',41,480.00,'542555')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(179,'Jan 27 2013 12:00:00:000AM',29,338.20,'542556')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(180,'Jan 27 2013 12:00:00:000AM',59,651.00,'542557')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(181,'Jan 28 2013 12:00:00:000AM',66,192.00,'542558')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(182,'Jan 29 2013 12:00:00:000AM',37,1748.50,'542559')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(183,'Jan 30 2013 12:00:00:000AM',20,5796.00,'542560')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(184,'Jan 30 2013 12:00:00:000AM',10,2523.00,'542561')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(185,'Jan 31 2013 12:00:00:000AM',75,485.00,'542562')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(186,'Feb  3 2013 12:00:00:000AM',60,851.20,'542563')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(187,'Feb  3 2013 12:00:00:000AM',24,360.00,'542564')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(188,'Feb  4 2013 12:00:00:000AM',16,631.60,'542565')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(189,'Feb  5 2013 12:00:00:000AM',7,2210.80,'542566')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(190,'Feb  5 2013 12:00:00:000AM',87,393.00,'542567')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(191,'Feb  6 2013 12:00:00:000AM',79,567.50,'542568')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(192,'Feb  7 2013 12:00:00:000AM',51,1078.00,'542569')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(193,'Feb 10 2013 12:00:00:000AM',71,5793.10,'542570')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(194,'Feb 10 2013 12:00:00:000AM',55,1755.00,'542571')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(195,'Feb 11 2013 12:00:00:000AM',20,1792.00,'542572')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(196,'Feb 12 2013 12:00:00:000AM',66,537.60,'542573')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(197,'Feb 12 2013 12:00:00:000AM',5,1031.70,'542574')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(198,'Feb 13 2013 12:00:00:000AM',5,174.90,'542575')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(199,'Feb 14 2013 12:00:00:000AM',79,273.60,'542576')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(200,'Feb 14 2013 12:00:00:000AM',67,914.40,'542577')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(201,'Feb 17 2013 12:00:00:000AM',64,443.40,'542578')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(202,'Feb 18 2013 12:00:00:000AM',7,1838.20,'542579')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(203,'Feb 19 2013 12:00:00:000AM',84,531.40,'542580')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(204,'Feb 19 2013 12:00:00:000AM',63,4277.40,'542581')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(205,'Feb 20 2013 12:00:00:000AM',71,2096.00,'542582')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(206,'Feb 21 2013 12:00:00:000AM',4,453.00,'542583')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(207,'Feb 21 2013 12:00:00:000AM',41,414.00,'542584')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(208,'Feb 24 2013 12:00:00:000AM',87,2684.00,'542585')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(209,'Feb 25 2013 12:00:00:000AM',39,656.00,'542586')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(210,'Feb 25 2013 12:00:00:000AM',39,1584.00,'542587')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(211,'Feb 26 2013 12:00:00:000AM',76,3891.00,'542588')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(212,'Feb 27 2013 12:00:00:000AM',84,1688.00,'542589')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(213,'Feb 28 2013 12:00:00:000AM',24,234.80,'542590')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(214,'Feb 28 2013 12:00:00:000AM',46,2051.60,'542591')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(215,'Mar  3 2013 12:00:00:000AM',16,156.00,'542592')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(216,'Mar  4 2013 12:00:00:000AM',76,713.30,'542593')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(217,'Mar  4 2013 12:00:00:000AM',28,1848.00,'542594')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(218,'Mar  5 2013 12:00:00:000AM',83,2719.00,'542595')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(219,'Mar  6 2013 12:00:00:000AM',15,216.00,'542596')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(220,'Mar  6 2013 12:00:00:000AM',49,235.20,'542597')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(221,'Mar  7 2013 12:00:00:000AM',39,717.60,'542598')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(222,'Mar 10 2013 12:00:00:000AM',89,1125.50,'542599')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(223,'Mar 11 2013 12:00:00:000AM',9,1820.80,'542600')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(224,'Mar 11 2013 12:00:00:000AM',11,1328.00,'542601')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(225,'Mar 12 2013 12:00:00:000AM',72,1051.20,'542602')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(226,'Mar 13 2013 12:00:00:000AM',38,230.40,'542603')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(227,'Mar 13 2013 12:00:00:000AM',58,1249.10,'542604')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(228,'Mar 14 2013 12:00:00:000AM',76,1770.80,'542605')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(229,'Mar 17 2013 12:00:00:000AM',35,182.40,'542606')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(230,'Mar 17 2013 12:00:00:000AM',60,672.00,'542607')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(231,'Mar 18 2013 12:00:00:000AM',84,496.00,'542608')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(232,'Mar 19 2013 12:00:00:000AM',65,10495.60,'542609')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(233,'Mar 20 2013 12:00:00:000AM',23,756.00,'542610')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(234,'Mar 20 2013 12:00:00:000AM',67,1472.00,'542611')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(235,'Mar 21 2013 12:00:00:000AM',43,147.00,'542612')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(236,'Mar 24 2013 12:00:00:000AM',89,704.00,'542613')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(237,'Mar 24 2013 12:00:00:000AM',11,386.20,'542614')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(238,'Mar 25 2013 12:00:00:000AM',47,1760.00,'542615')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(239,'Mar 26 2013 12:00:00:000AM',35,1272.00,'542616')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(240,'Mar 26 2013 12:00:00:000AM',62,925.10,'542617')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(241,'Mar 27 2013 12:00:00:000AM',25,1560.00,'542618')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(242,'Mar 28 2013 12:00:00:000AM',59,502.20,'542619')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(243,'Mar 31 2013 12:00:00:000AM',35,3163.20,'542620')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(244,'Mar 31 2013 12:00:00:000AM',28,305.30,'542621')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(245,'Apr  1 2013 12:00:00:000AM',10,896.00,'542622')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(246,'Apr  2 2013 12:00:00:000AM',41,676.00,'542623')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(247,'Apr  2 2013 12:00:00:000AM',15,912.00,'542624')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(248,'Apr  3 2013 12:00:00:000AM',42,278.00,'542625')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(249,'Apr  4 2013 12:00:00:000AM',81,200.00,'542626')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(250,'Apr  4 2013 12:00:00:000AM',44,1380.60,'542627')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(251,'Apr  7 2013 12:00:00:000AM',35,575.00,'542628')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(252,'Apr  8 2013 12:00:00:000AM',46,1412.00,'542629')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(253,'Apr  9 2013 12:00:00:000AM',41,550.80,'542630')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(254,'Apr  9 2013 12:00:00:000AM',6,149.00,'542631')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(255,'Apr 10 2013 12:00:00:000AM',58,816.30,'542632')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(256,'Apr 11 2013 12:00:00:000AM',37,2048.50,'542633')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(257,'Apr 11 2013 12:00:00:000AM',89,1388.50,'542634')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(258,'Apr 14 2013 12:00:00:000AM',51,147.90,'542635')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(259,'Apr 15 2013 12:00:00:000AM',39,462.00,'542636')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(260,'Apr 15 2013 12:00:00:000AM',3,881.25,'542637')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(261,'Apr 16 2013 12:00:00:000AM',56,240.00,'542638')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(262,'Apr 17 2013 12:00:00:000AM',6,136.80,'542639')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(263,'Apr 18 2013 12:00:00:000AM',71,4735.44,'542640')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(264,'Apr 18 2013 12:00:00:000AM',9,3000.00,'542641')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(265,'Apr 21 2013 12:00:00:000AM',21,618.00,'542642')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(266,'Apr 22 2013 12:00:00:000AM',86,2427.50,'542643')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(267,'Apr 22 2013 12:00:00:000AM',20,8623.45,'542644')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(268,'Apr 23 2013 12:00:00:000AM',63,10588.50,'542645')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(269,'Apr 24 2013 12:00:00:000AM',37,2614.50,'542646')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(270,'Apr 24 2013 12:00:00:000AM',53,352.00,'542647')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(271,'Apr 25 2013 12:00:00:000AM',80,4150.05,'542648')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(272,'Apr 28 2013 12:00:00:000AM',14,2356.00,'542649')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(273,'Apr 29 2013 12:00:00:000AM',70,200.00,'542650')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(274,'Apr 29 2013 12:00:00:000AM',12,225.50,'542651')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(275,'Apr 30 2013 12:00:00:000AM',44,2657.80,'542652')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(276,'May  1 2013 12:00:00:000AM',72,2715.90,'542653')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(277,'May  1 2013 12:00:00:000AM',5,3192.65,'542654')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(278,'May  2 2013 12:00:00:000AM',9,846.00,'542655')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(279,'May  5 2013 12:00:00:000AM',87,1344.00,'542656')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(280,'May  5 2013 12:00:00:000AM',63,1670.00,'542657')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(281,'May  6 2013 12:00:00:000AM',32,396.20,'542658')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(282,'May  7 2013 12:00:00:000AM',50,946.00,'542659')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(283,'May  8 2013 12:00:00:000AM',59,4180.00,'542660')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(284,'May  8 2013 12:00:00:000AM',54,110.00,'542661')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(285,'May  9 2013 12:00:00:000AM',19,796.35,'542662')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(286,'May 12 2013 12:00:00:000AM',24,2295.20,'542663')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(287,'May 12 2013 12:00:00:000AM',44,517.40,'542664')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(288,'May 13 2013 12:00:00:000AM',3,2156.50,'542665')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(289,'May 14 2013 12:00:00:000AM',44,2085.00,'542666')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(290,'May 14 2013 12:00:00:000AM',68,1823.80,'542667')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(291,'May 15 2013 12:00:00:000AM',11,139.80,'542668')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(292,'May 16 2013 12:00:00:000AM',11,355.50,'542669')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(293,'May 19 2013 12:00:00:000AM',63,10191.70,'542670')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(294,'May 19 2013 12:00:00:000AM',34,2162.80,'542671')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(295,'May 20 2013 12:00:00:000AM',39,493.80,'542672')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(296,'May 21 2013 12:00:00:000AM',46,1770.00,'542673')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(297,'May 21 2013 12:00:00:000AM',48,417.20,'542674')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(298,'May 22 2013 12:00:00:000AM',43,210.00,'542675')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(299,'May 23 2013 12:00:00:000AM',84,2812.00,'542676')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(300,'May 23 2013 12:00:00:000AM',72,1908.00,'542677')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(301,'May 26 2013 12:00:00:000AM',79,275.10,'542678')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(302,'May 27 2013 12:00:00:000AM',63,4181.50,'542679')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(303,'May 28 2013 12:00:00:000AM',30,749.00,'542680')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(304,'May 28 2013 12:00:00:000AM',28,1836.00,'542681')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(305,'May 29 2013 12:00:00:000AM',35,880.50,'542682')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(306,'May 30 2013 12:00:00:000AM',87,1546.30,'542683')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(307,'May 30 2013 12:00:00:000AM',56,1819.50,'542684')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(308,'Jun  2 2013 12:00:00:000AM',71,3680.50,'542685')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(309,'Jun  3 2013 12:00:00:000AM',73,835.20,'542686')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(310,'Jun  3 2013 12:00:00:000AM',44,1152.50,'542687')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(311,'Jun  4 2013 12:00:00:000AM',4,2142.90,'542688')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(312,'Jun  5 2013 12:00:00:000AM',7,547.80,'542689')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(313,'Jun  6 2013 12:00:00:000AM',25,1257.30,'542690')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(314,'Jun  6 2013 12:00:00:000AM',24,2844.50,'542691')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(315,'Jun  9 2013 12:00:00:000AM',66,543.00,'542692')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(316,'Jun 10 2013 12:00:00:000AM',67,965.00,'542693')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(317,'Jun 10 2013 12:00:00:000AM',65,1299.00,'542694')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(318,'Jun 11 2013 12:00:00:000AM',51,711.00,'542695')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(319,'Jun 12 2013 12:00:00:000AM',7,2040.00,'542696')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(320,'Jun 12 2013 12:00:00:000AM',37,3109.00,'542697')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(321,'Jun 13 2013 12:00:00:000AM',29,155.00,'542698')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(322,'Jun 16 2013 12:00:00:000AM',65,977.50,'542699')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(323,'Jun 17 2013 12:00:00:000AM',51,2595.00,'542700')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(324,'Jun 17 2013 12:00:00:000AM',20,647.75,'542701')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(325,'Jun 18 2013 12:00:00:000AM',5,1565.65,'542702')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(326,'Jun 19 2013 12:00:00:000AM',3,2082.00,'542703')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(327,'Jun 19 2013 12:00:00:000AM',82,764.30,'542704')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(328,'Jun 20 2013 12:00:00:000AM',52,2147.40,'542705')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(329,'Jun 23 2013 12:00:00:000AM',80,838.45,'542706')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(330,'Jun 23 2013 12:00:00:000AM',82,569.00,'542707')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(331,'Jun 24 2013 12:00:00:000AM',11,477.00,'542708')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(332,'Jun 25 2013 12:00:00:000AM',45,317.75,'542709')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(333,'Jun 26 2013 12:00:00:000AM',56,1067.10,'542710')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(334,'Jun 26 2013 12:00:00:000AM',21,387.50,'542711')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(335,'Jun 27 2013 12:00:00:000AM',6,330.00,'542712')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(336,'Jun 30 2013 12:00:00:000AM',87,2413.90,'542713')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(337,'Jun 30 2013 12:00:00:000AM',7,625.00,'542714')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(338,'Jul  1 2013 12:00:00:000AM',88,142.50,'542715')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(339,'Jul  2 2013 12:00:00:000AM',66,28.00,'542716')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(340,'Jul  2 2013 12:00:00:000AM',61,807.38,'542717')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(341,'Jul  3 2013 12:00:00:000AM',63,3900.00,'542718')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(342,'Jul  4 2013 12:00:00:000AM',32,72.00,'542719')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(343,'Jul  7 2013 12:00:00:000AM',51,1140.00,'542720')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(344,'Jul  7 2013 12:00:00:000AM',83,812.50,'542721')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(345,'Jul  8 2013 12:00:00:000AM',44,543.65,'542722')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(346,'Jul  9 2013 12:00:00:000AM',44,2493.00,'542723')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(347,'Jul  9 2013 12:00:00:000AM',55,565.50,'542724')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(348,'Jul 10 2013 12:00:00:000AM',20,6300.00,'542725')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(349,'Jul 11 2013 12:00:00:000AM',89,1476.10,'542726')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(350,'Jul 11 2013 12:00:00:000AM',59,800.10,'542727')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(351,'Jul 14 2013 12:00:00:000AM',65,2388.50,'542728')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(352,'Jul 15 2013 12:00:00:000AM',11,493.00,'542729')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(353,'Jul 16 2013 12:00:00:000AM',36,479.80,'542730')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(354,'Jul 16 2013 12:00:00:000AM',35,2285.00,'542731')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(355,'Jul 17 2013 12:00:00:000AM',83,65.00,'542732')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(356,'Jul 18 2013 12:00:00:000AM',71,1508.00,'542733')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(357,'Jul 18 2013 12:00:00:000AM',28,256.50,'542734')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(358,'Jul 21 2013 12:00:00:000AM',51,4326.00,'542735')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(359,'Jul 22 2013 12:00:00:000AM',81,1413.00,'542736')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(360,'Jul 22 2013 12:00:00:000AM',71,6475.40,'542737')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(361,'Jul 23 2013 12:00:00:000AM',79,1064.00,'542738')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(362,'Jul 24 2013 12:00:00:000AM',18,424.00,'542739')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(363,'Jul 25 2013 12:00:00:000AM',41,399.00,'542740')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(364,'Jul 25 2013 12:00:00:000AM',91,808.00,'542741')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(365,'Jul 28 2013 12:00:00:000AM',71,6375.00,'542742')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(366,'Jul 29 2013 12:00:00:000AM',35,358.00,'542743')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(367,'Jul 29 2013 12:00:00:000AM',6,464.00,'542744')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(368,'Jul 30 2013 12:00:00:000AM',90,120.00,'542745')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(369,'Jul 31 2013 12:00:00:000AM',32,5032.00,'542746')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(370,'Jul 31 2013 12:00:00:000AM',32,1650.00,'542747')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(371,'Aug  1 2013 12:00:00:000AM',51,2697.50,'542748')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(372,'Aug  4 2013 12:00:00:000AM',51,1260.00,'542749')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(373,'Aug  5 2013 12:00:00:000AM',42,57.50,'542750')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(374,'Aug  5 2013 12:00:00:000AM',38,758.50,'542751')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(375,'Aug  6 2013 12:00:00:000AM',67,605.00,'542752')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(376,'Aug  7 2013 12:00:00:000AM',25,1429.75,'542753')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(377,'Aug  7 2013 12:00:00:000AM',78,1393.24,'542754')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(378,'Aug  8 2013 12:00:00:000AM',2,479.75,'542755')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(379,'Aug 11 2013 12:00:00:000AM',5,1503.60,'542756')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(380,'Aug 11 2013 12:00:00:000AM',71,1264.50,'542757')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(381,'Aug 12 2013 12:00:00:000AM',7,450.00,'542758')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(382,'Aug 12 2013 12:00:00:000AM',30,2775.05,'542759')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(383,'Aug 13 2013 12:00:00:000AM',39,918.00,'542760')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(384,'Aug 14 2013 12:00:00:000AM',41,62.00,'542761')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(385,'Aug 14 2013 12:00:00:000AM',86,620.00,'542762')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(386,'Aug 15 2013 12:00:00:000AM',20,6483.05,'542763')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(387,'Aug 15 2013 12:00:00:000AM',23,4985.50,'542764')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(388,'Aug 18 2013 12:00:00:000AM',49,1380.25,'542765')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(389,'Aug 19 2013 12:00:00:000AM',87,629.50,'542766')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(390,'Aug 19 2013 12:00:00:000AM',62,2896.25,'542767')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(391,'Aug 20 2013 12:00:00:000AM',47,2720.05,'542768')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(392,'Aug 20 2013 12:00:00:000AM',70,500.00,'542769')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(393,'Aug 21 2013 12:00:00:000AM',86,945.00,'542770')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(394,'Aug 22 2013 12:00:00:000AM',35,2054.00,'542771')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(395,'Aug 22 2013 12:00:00:000AM',73,870.00,'542772')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(396,'Aug 25 2013 12:00:00:000AM',1,1086.00,'542773')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(397,'Aug 25 2013 12:00:00:000AM',88,1422.00,'542774')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(398,'Aug 26 2013 12:00:00:000AM',34,1535.00,'542775')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(399,'Aug 27 2013 12:00:00:000AM',37,1928.00,'542776')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(400,'Aug 27 2013 12:00:00:000AM',61,636.00,'542777')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(401,'Aug 28 2013 12:00:00:000AM',67,382.50,'542778')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(402,'Aug 28 2013 12:00:00:000AM',50,1434.00,'542779')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(403,'Aug 29 2013 12:00:00:000AM',21,1820.20,'542780')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(404,'Sep  1 2013 12:00:00:000AM',86,530.40,'542781')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(405,'Sep  1 2013 12:00:00:000AM',31,331.78,'542782')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(406,'Sep  2 2013 12:00:00:000AM',25,1203.50,'542783')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(407,'Sep  2 2013 12:00:00:000AM',5,668.70,'542784')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(408,'Sep  3 2013 12:00:00:000AM',66,193.00,'542785')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(409,'Sep  4 2013 12:00:00:000AM',32,671.35,'542786')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(410,'Sep  4 2013 12:00:00:000AM',71,4371.60,'542787')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(411,'Sep  5 2013 12:00:00:000AM',63,4668.00,'542788')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(412,'Sep  5 2013 12:00:00:000AM',62,1291.60,'542789')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(413,'Sep  8 2013 12:00:00:000AM',36,1701.00,'542790')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(414,'Sep  9 2013 12:00:00:000AM',37,703.25,'542791')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(415,'Sep  9 2013 12:00:00:000AM',48,125.00,'542792')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(416,'Sep 10 2013 12:00:00:000AM',9,2032.00,'542793')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(417,'Sep 10 2013 12:00:00:000AM',28,1515.75,'542794')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(418,'Sep 11 2013 12:00:00:000AM',48,1295.00,'542795')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(419,'Sep 12 2013 12:00:00:000AM',68,4666.94,'542796')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(420,'Sep 12 2013 12:00:00:000AM',20,1921.00,'542797')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(421,'Sep 15 2013 12:00:00:000AM',86,694.75,'542798')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(422,'Sep 15 2013 12:00:00:000AM',73,570.00,'542799')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(423,'Sep 16 2013 12:00:00:000AM',25,2301.75,'542800')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(424,'Sep 17 2013 12:00:00:000AM',26,920.10,'542801')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(425,'Sep 17 2013 12:00:00:000AM',5,4210.50,'542802')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(426,'Sep 18 2013 12:00:00:000AM',90,412.35,'542803')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(427,'Sep 18 2013 12:00:00:000AM',38,45.00,'542804')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(428,'Sep 19 2013 12:00:00:000AM',25,1423.00,'542805')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(429,'Sep 22 2013 12:00:00:000AM',80,534.85,'542806')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(430,'Sep 22 2013 12:00:00:000AM',3,956.90,'542807')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(431,'Sep 23 2013 12:00:00:000AM',71,5256.50,'542808')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(432,'Sep 23 2013 12:00:00:000AM',7,660.00,'542809')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(433,'Sep 24 2013 12:00:00:000AM',55,1682.50,'542810')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(434,'Sep 25 2013 12:00:00:000AM',32,1327.00,'542811')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(435,'Sep 25 2013 12:00:00:000AM',3,375.50,'542812')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(436,'Sep 26 2013 12:00:00:000AM',18,63.00,'542813')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(437,'Sep 26 2013 12:00:00:000AM',56,1768.00,'542814')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(438,'Sep 29 2013 12:00:00:000AM',31,801.10,'542815')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(439,'Sep 30 2013 12:00:00:000AM',59,1638.45,'542816')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(440,'Sep 30 2013 12:00:00:000AM',37,6201.90,'542817')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(441,'Oct  1 2013 12:00:00:000AM',83,3490.00,'542818')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(442,'Oct  1 2013 12:00:00:000AM',5,630.00,'542819')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(443,'Oct  2 2013 12:00:00:000AM',34,1150.00,'542820')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(444,'Oct  3 2013 12:00:00:000AM',63,10164.80,'542821')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(445,'Oct  3 2013 12:00:00:000AM',1,878.00,'542822')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(446,'Oct  6 2013 12:00:00:000AM',89,2334.00,'542823')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(447,'Oct  6 2013 12:00:00:000AM',63,4825.00,'542824')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(448,'Oct  7 2013 12:00:00:000AM',90,642.00,'542825')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(449,'Oct  8 2013 12:00:00:000AM',89,996.00,'542826')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(450,'Oct  8 2013 12:00:00:000AM',47,1073.90,'542827')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(451,'Oct  9 2013 12:00:00:000AM',20,3600.73,'542828')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(452,'Oct  9 2013 12:00:00:000AM',52,114.00,'542829')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(453,'Oct 10 2013 12:00:00:000AM',71,2048.00,'542830')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(454,'Oct 13 2013 12:00:00:000AM',37,3370.00,'542831')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(455,'Oct 13 2013 12:00:00:000AM',1,330.00,'542832')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(456,'Oct 14 2013 12:00:00:000AM',24,2545.00,'542833')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(457,'Oct 14 2013 12:00:00:000AM',62,595.50,'542834')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(458,'Oct 15 2013 12:00:00:000AM',35,378.00,'542835')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(459,'Oct 16 2013 12:00:00:000AM',55,1893.00,'542836')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(460,'Oct 16 2013 12:00:00:000AM',4,1704.00,'542837')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(461,'Oct 17 2013 12:00:00:000AM',77,180.40,'542838')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(462,'Oct 17 2013 12:00:00:000AM',31,3424.00,'542839')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(463,'Oct 20 2013 12:00:00:000AM',27,93.50,'542840')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(464,'Oct 21 2013 12:00:00:000AM',71,4451.70,'542841')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(465,'Oct 21 2013 12:00:00:000AM',37,1238.40,'542842')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(466,'Oct 22 2013 12:00:00:000AM',71,2827.90,'542843')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(467,'Oct 22 2013 12:00:00:000AM',71,2941.00,'542844')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(468,'Oct 23 2013 12:00:00:000AM',9,1296.00,'542845')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(469,'Oct 24 2013 12:00:00:000AM',64,706.00,'542846')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(470,'Oct 24 2013 12:00:00:000AM',25,1331.75,'542847')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(471,'Oct 27 2013 12:00:00:000AM',39,3463.00,'542848')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(472,'Oct 27 2013 12:00:00:000AM',45,1125.67,'542849')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(473,'Oct 28 2013 12:00:00:000AM',61,550.00,'542850')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(474,'Oct 29 2013 12:00:00:000AM',63,972.50,'542851')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(475,'Oct 29 2013 12:00:00:000AM',71,1570.00,'542852')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(476,'Oct 30 2013 12:00:00:000AM',89,468.45,'542853')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(477,'Oct 30 2013 12:00:00:000AM',51,638.50,'542854')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(478,'Oct 31 2013 12:00:00:000AM',21,287.80,'542855')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(479,'Nov  3 2013 12:00:00:000AM',19,655.00,'542856')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(480,'Nov  3 2013 12:00:00:000AM',66,1710.00,'542857')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(481,'Nov  4 2013 12:00:00:000AM',62,1296.75,'542858')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(482,'Nov  4 2013 12:00:00:000AM',47,1850.00,'542859')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(483,'Nov  5 2013 12:00:00:000AM',9,509.75,'542860')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(484,'Nov  6 2013 12:00:00:000AM',14,1990.00,'542861')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(485,'Nov  6 2013 12:00:00:000AM',9,360.00,'542862')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(486,'Nov  7 2013 12:00:00:000AM',5,1459.00,'542863')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(487,'Nov  7 2013 12:00:00:000AM',31,1498.35,'542864')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(488,'Nov 10 2013 12:00:00:000AM',45,596.00,'542865')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(489,'Nov 11 2013 12:00:00:000AM',37,997.00,'542866')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(490,'Nov 11 2013 12:00:00:000AM',85,139.80,'542867')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(491,'Nov 12 2013 12:00:00:000AM',74,52.35,'542868')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(492,'Nov 12 2013 12:00:00:000AM',85,240.00,'542869')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(493,'Nov 13 2013 12:00:00:000AM',89,1770.00,'542870')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(494,'Nov 14 2013 12:00:00:000AM',4,285.00,'542871')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(495,'Nov 14 2013 12:00:00:000AM',10,3118.00,'542872')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(496,'Nov 17 2013 12:00:00:000AM',4,336.00,'542873')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(497,'Nov 17 2013 12:00:00:000AM',83,920.00,'542874')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(498,'Nov 18 2013 12:00:00:000AM',63,4529.80,'542875')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(499,'Nov 19 2013 12:00:00:000AM',14,2311.70,'542876')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(500,'Nov 19 2013 12:00:00:000AM',59,1912.85,'542877')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(501,'Nov 20 2013 12:00:00:000AM',71,2196.00,'542878')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(502,'Nov 20 2013 12:00:00:000AM',38,1080.00,'542879')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(503,'Nov 21 2013 12:00:00:000AM',87,1871.25,'542880')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(504,'Nov 24 2013 12:00:00:000AM',68,1701.46,'542881')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(505,'Nov 24 2013 12:00:00:000AM',53,252.00,'542882')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(506,'Nov 25 2013 12:00:00:000AM',27,88.00,'542883')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(507,'Nov 25 2013 12:00:00:000AM',49,55.20,'542884')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(508,'Nov 26 2013 12:00:00:000AM',9,2598.00,'542885')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(509,'Nov 27 2013 12:00:00:000AM',75,2487.50,'542886')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(510,'Nov 27 2013 12:00:00:000AM',71,3082.00,'542887')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(511,'Nov 28 2013 12:00:00:000AM',68,1644.60,'542888')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(512,'Nov 28 2013 12:00:00:000AM',2,320.00,'542889')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(513,'Dec  1 2013 12:00:00:000AM',50,3304.00,'542890')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(514,'Dec  2 2013 12:00:00:000AM',65,629.50,'542891')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(515,'Dec  2 2013 12:00:00:000AM',24,4337.00,'542892')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(516,'Dec  3 2013 12:00:00:000AM',23,616.00,'542893')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(517,'Dec  3 2013 12:00:00:000AM',20,2540.00,'542894')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(518,'Dec  4 2013 12:00:00:000AM',63,1684.00,'542895')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(519,'Dec  5 2013 12:00:00:000AM',56,2310.00,'542896')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(520,'Dec  5 2013 12:00:00:000AM',76,28.00,'542897')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(521,'Dec  8 2013 12:00:00:000AM',4,1477.00,'542898')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(522,'Dec  8 2013 12:00:00:000AM',83,1704.00,'542899')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(523,'Dec  9 2013 12:00:00:000AM',34,315.00,'542900')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(524,'Dec 10 2013 12:00:00:000AM',20,344.00,'542901')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(525,'Dec 10 2013 12:00:00:000AM',44,3603.22,'542902')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(526,'Dec 11 2013 12:00:00:000AM',20,2216.25,'542903')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(527,'Dec 11 2013 12:00:00:000AM',24,875.00,'542904')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(528,'Dec 12 2013 12:00:00:000AM',78,228.00,'542905')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(529,'Dec 15 2013 12:00:00:000AM',20,6984.50,'542906')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(530,'Dec 15 2013 12:00:00:000AM',31,280.00,'542907')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(531,'Dec 16 2013 12:00:00:000AM',5,96.50,'542908')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(532,'Dec 16 2013 12:00:00:000AM',52,1335.00,'542909')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(533,'Dec 16 2013 12:00:00:000AM',46,720.00,'542910')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(534,'Dec 17 2013 12:00:00:000AM',87,1132.35,'542911')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(535,'Dec 17 2013 12:00:00:000AM',12,12.50,'542912')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(536,'Dec 18 2013 12:00:00:000AM',34,1442.50,'542913')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(537,'Dec 18 2013 12:00:00:000AM',49,1650.00,'542914')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(538,'Dec 18 2013 12:00:00:000AM',33,387.50,'542915')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(539,'Dec 19 2013 12:00:00:000AM',62,1913.85,'542916')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(540,'Dec 19 2013 12:00:00:000AM',41,2760.80,'542917')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(541,'Dec 22 2013 12:00:00:000AM',63,770.00,'542918')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(542,'Dec 22 2013 12:00:00:000AM',23,3687.00,'542919')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(543,'Dec 22 2013 12:00:00:000AM',31,850.00,'542920')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(544,'Dec 23 2013 12:00:00:000AM',25,1926.06,'542921')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(545,'Dec 23 2013 12:00:00:000AM',91,399.85,'542922')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(546,'Dec 24 2013 12:00:00:000AM',4,191.10,'542923')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(547,'Dec 24 2013 12:00:00:000AM',61,393.45,'542924')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(548,'Dec 24 2013 12:00:00:000AM',20,2499.25,'542925')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(549,'Dec 25 2013 12:00:00:000AM',35,2878.08,'542926')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(550,'Dec 25 2013 12:00:00:000AM',17,420.00,'542927')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(551,'Dec 26 2013 12:00:00:000AM',38,446.60,'542928')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(552,'Dec 26 2013 12:00:00:000AM',39,1585.00,'542929')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(553,'Dec 26 2013 12:00:00:000AM',72,1632.15,'542930')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(554,'Dec 29 2013 12:00:00:000AM',8,4035.80,'542931')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(555,'Dec 29 2013 12:00:00:000AM',73,3923.75,'542932')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(556,'Dec 30 2013 12:00:00:000AM',88,1255.80,'542933')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(557,'Dec 30 2013 12:00:00:000AM',72,2290.40,'542934')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(558,'Dec 30 2013 12:00:00:000AM',77,2775.00,'542935')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(559,'Dec 31 2013 12:00:00:000AM',84,572.10,'542936')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(560,'Dec 31 2013 12:00:00:000AM',27,18.40,'542937')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(561,'Jan  1 2014 12:00:00:000AM',55,1660.00,'542938')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(562,'Jan  1 2014 12:00:00:000AM',88,140.00,'542939')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(563,'Jan  1 2014 12:00:00:000AM',42,187.00,'542940')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(564,'Jan  2 2014 12:00:00:000AM',47,852.00,'542941')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(565,'Jan  2 2014 12:00:00:000AM',66,1852.00,'542942')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(566,'Jan  5 2014 12:00:00:000AM',67,648.00,'542943')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(567,'Jan  5 2014 12:00:00:000AM',84,2070.00,'542944')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(568,'Jan  5 2014 12:00:00:000AM',71,40.00,'542945')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(569,'Jan  6 2014 12:00:00:000AM',32,8891.00,'542946')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(570,'Jan  6 2014 12:00:00:000AM',39,11490.70,'542947')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(571,'Jan  7 2014 12:00:00:000AM',49,833.00,'542948')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(572,'Jan  7 2014 12:00:00:000AM',12,477.00,'542949')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(573,'Jan  7 2014 12:00:00:000AM',65,1140.00,'542950')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(574,'Jan  8 2014 12:00:00:000AM',75,678.00,'542951')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(575,'Jan  8 2014 12:00:00:000AM',82,237.90,'542952')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(576,'Jan  9 2014 12:00:00:000AM',46,3107.50,'542953')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(577,'Jan  9 2014 12:00:00:000AM',24,250.80,'542954')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(578,'Jan  9 2014 12:00:00:000AM',17,1030.76,'542955')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(579,'Jan 12 2014 12:00:00:000AM',7,730.00,'542956')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(580,'Jan 12 2014 12:00:00:000AM',9,843.00,'542957')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(581,'Jan 13 2014 12:00:00:000AM',64,932.00,'542958')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(582,'Jan 13 2014 12:00:00:000AM',38,1764.00,'542959')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(583,'Jan 13 2014 12:00:00:000AM',81,1974.00,'542960')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(584,'Jan 14 2014 12:00:00:000AM',70,2684.40,'542961')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(585,'Jan 14 2014 12:00:00:000AM',41,568.95,'542962')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(586,'Jan 15 2014 12:00:00:000AM',56,1007.70,'542963')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(587,'Jan 15 2014 12:00:00:000AM',81,1508.12,'542964')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(588,'Jan 15 2014 12:00:00:000AM',1,851.00,'542965')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(589,'Jan 16 2014 12:00:00:000AM',20,4705.50,'542966')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(590,'Jan 16 2014 12:00:00:000AM',5,1254.00,'542967')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(591,'Jan 19 2014 12:00:00:000AM',47,2584.50,'542968')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(592,'Jan 19 2014 12:00:00:000AM',81,919.50,'542969')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(593,'Jan 19 2014 12:00:00:000AM',47,264.00,'542970')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(594,'Jan 20 2014 12:00:00:000AM',76,4581.00,'542971')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(595,'Jan 20 2014 12:00:00:000AM',80,975.00,'542972')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(596,'Jan 21 2014 12:00:00:000AM',84,212.00,'542973')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(597,'Jan 21 2014 12:00:00:000AM',59,735.00,'542974')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(598,'Jan 21 2014 12:00:00:000AM',63,4059.00,'542975')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(599,'Jan 22 2014 12:00:00:000AM',76,1112.00,'542976')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(600,'Jan 22 2014 12:00:00:000AM',71,6164.90,'542977')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(601,'Jan 23 2014 12:00:00:000AM',16,931.50,'542978')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(602,'Jan 23 2014 12:00:00:000AM',39,1052.14,'542979')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(603,'Jan 23 2014 12:00:00:000AM',84,740.00,'542980')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(604,'Jan 26 2014 12:00:00:000AM',67,2740.00,'542981')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(605,'Jan 26 2014 12:00:00:000AM',65,2984.00,'542982')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(606,'Jan 27 2014 12:00:00:000AM',6,625.00,'542983')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(607,'Jan 27 2014 12:00:00:000AM',20,3490.00,'542984')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(608,'Jan 27 2014 12:00:00:000AM',55,2275.25,'542985')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(609,'Jan 28 2014 12:00:00:000AM',3,660.00,'542986')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(610,'Jan 28 2014 12:00:00:000AM',5,2630.95,'542987')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(611,'Jan 29 2014 12:00:00:000AM',40,649.00,'542988')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(612,'Jan 29 2014 12:00:00:000AM',25,1438.25,'542989')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(613,'Jan 29 2014 12:00:00:000AM',26,519.00,'542990')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(614,'Jan 30 2014 12:00:00:000AM',89,3523.40,'542991')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(615,'Jan 30 2014 12:00:00:000AM',44,581.00,'542992')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(616,'Feb  2 2014 12:00:00:000AM',35,519.00,'542993')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(617,'Feb  2 2014 12:00:00:000AM',4,282.00,'542994')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(618,'Feb  2 2014 12:00:00:000AM',63,17250.00,'542995')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(619,'Feb  3 2014 12:00:00:000AM',5,1461.60,'542996')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(620,'Feb  3 2014 12:00:00:000AM',48,98.40,'542997')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(621,'Feb  4 2014 12:00:00:000AM',62,2004.60,'542998')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(622,'Feb  4 2014 12:00:00:000AM',72,1630.00,'542999')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(623,'Feb  4 2014 12:00:00:000AM',91,160.00,'543000')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(624,'Feb  5 2014 12:00:00:000AM',9,2083.40,'543001')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(625,'Feb  5 2014 12:00:00:000AM',30,2166.80,'543002')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(626,'Feb  6 2014 12:00:00:000AM',90,336.80,'543003')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(627,'Feb  6 2014 12:00:00:000AM',30,310.00,'543004')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(628,'Feb  6 2014 12:00:00:000AM',5,729.50,'543005')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(629,'Feb  9 2014 12:00:00:000AM',9,917.00,'543006')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(630,'Feb  9 2014 12:00:00:000AM',67,2086.00,'543007')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(631,'Feb 10 2014 12:00:00:000AM',63,1620.00,'543008')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(632,'Feb 10 2014 12:00:00:000AM',90,611.30,'543009')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(633,'Feb 10 2014 12:00:00:000AM',24,1875.00,'543010')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(634,'Feb 11 2014 12:00:00:000AM',12,150.00,'543011')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(635,'Feb 11 2014 12:00:00:000AM',71,988.40,'543012')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(636,'Feb 12 2014 12:00:00:000AM',48,36.00,'543013')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(637,'Feb 12 2014 12:00:00:000AM',45,1450.60,'543014')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(638,'Feb 12 2014 12:00:00:000AM',76,1209.00,'543015')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(639,'Feb 13 2014 12:00:00:000AM',34,3127.50,'543016')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(640,'Feb 13 2014 12:00:00:000AM',29,70.00,'543017')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(641,'Feb 16 2014 12:00:00:000AM',30,605.00,'543018')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(642,'Feb 16 2014 12:00:00:000AM',65,11380.00,'543019')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(643,'Feb 16 2014 12:00:00:000AM',18,860.10,'543020')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(644,'Feb 17 2014 12:00:00:000AM',44,388.35,'543021')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(645,'Feb 17 2014 12:00:00:000AM',50,2200.00,'543022')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(646,'Feb 18 2014 12:00:00:000AM',39,5502.11,'543023')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(647,'Feb 18 2014 12:00:00:000AM',71,2898.00,'543024')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(648,'Feb 18 2014 12:00:00:000AM',20,6379.40,'543025')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(649,'Feb 19 2014 12:00:00:000AM',50,750.50,'543026')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(650,'Feb 19 2014 12:00:00:000AM',37,10835.24,'543027')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(651,'Feb 20 2014 12:00:00:000AM',54,30.00,'543028')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(652,'Feb 20 2014 12:00:00:000AM',46,144.00,'543029')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(653,'Feb 20 2014 12:00:00:000AM',88,45.00,'543030')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(654,'Feb 23 2014 12:00:00:000AM',35,934.50,'543031')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(655,'Feb 23 2014 12:00:00:000AM',24,1015.80,'543032')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(656,'Feb 24 2014 12:00:00:000AM',34,932.05,'543033')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(657,'Feb 24 2014 12:00:00:000AM',89,1924.25,'543034')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(658,'Feb 24 2014 12:00:00:000AM',88,360.00,'543035')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(659,'Feb 25 2014 12:00:00:000AM',91,427.50,'543036')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(660,'Feb 25 2014 12:00:00:000AM',74,108.50,'543037')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(661,'Feb 26 2014 12:00:00:000AM',66,698.00,'543038')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(662,'Feb 26 2014 12:00:00:000AM',70,670.00,'543039')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(663,'Feb 26 2014 12:00:00:000AM',90,452.90,'543040')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(664,'Feb 26 2014 12:00:00:000AM',30,858.00,'543041')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(665,'Feb 26 2014 12:00:00:000AM',37,8267.40,'543042')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(666,'Feb 26 2014 12:00:00:000AM',62,958.75,'543043')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(667,'Feb 27 2014 12:00:00:000AM',62,537.50,'543044')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(668,'Feb 27 2014 12:00:00:000AM',80,539.50,'543045')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(669,'Feb 27 2014 12:00:00:000AM',64,686.70,'543046')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(670,'Mar  2 2014 12:00:00:000AM',69,365.89,'543047')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(671,'Mar  2 2014 12:00:00:000AM',10,1930.00,'543048')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(672,'Mar  2 2014 12:00:00:000AM',47,1122.80,'543049')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(673,'Mar  3 2014 12:00:00:000AM',4,390.00,'543050')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(674,'Mar  3 2014 12:00:00:000AM',83,1936.00,'543051')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(675,'Mar  3 2014 12:00:00:000AM',34,742.50,'543052')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(676,'Mar  3 2014 12:00:00:000AM',41,936.00,'543053')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(677,'Mar  4 2014 12:00:00:000AM',5,2034.50,'543054')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(678,'Mar  4 2014 12:00:00:000AM',34,559.00,'543055')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(679,'Mar  4 2014 12:00:00:000AM',2,514.40,'543056')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(680,'Mar  5 2014 12:00:00:000AM',40,800.00,'543057')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(681,'Mar  5 2014 12:00:00:000AM',29,137.50,'543058')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(682,'Mar  5 2014 12:00:00:000AM',25,1174.75,'543059')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(683,'Mar  6 2014 12:00:00:000AM',76,2455.00,'543060')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(684,'Mar  6 2014 12:00:00:000AM',68,837.00,'543061')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(685,'Mar  6 2014 12:00:00:000AM',9,1925.50,'543062')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(686,'Mar  6 2014 12:00:00:000AM',38,920.60,'543063')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(687,'Mar  9 2014 12:00:00:000AM',44,500.00,'543064')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(688,'Mar  9 2014 12:00:00:000AM',88,700.00,'543065')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(689,'Mar  9 2014 12:00:00:000AM',32,570.00,'543066')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(690,'Mar 10 2014 12:00:00:000AM',12,644.80,'543067')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(691,'Mar 10 2014 12:00:00:000AM',63,3642.50,'543068')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(692,'Mar 10 2014 12:00:00:000AM',49,750.00,'543069')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(693,'Mar 11 2014 12:00:00:000AM',9,360.00,'543070')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(694,'Mar 11 2014 12:00:00:000AM',71,4769.00,'543071')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(695,'Mar 11 2014 12:00:00:000AM',66,560.00,'543072')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(696,'Mar 11 2014 12:00:00:000AM',11,711.00,'543073')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(697,'Mar 12 2014 12:00:00:000AM',10,1139.10,'543074')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(698,'Mar 12 2014 12:00:00:000AM',52,245.00,'543075')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(699,'Mar 12 2014 12:00:00:000AM',83,1407.50,'543076')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(700,'Mar 13 2014 12:00:00:000AM',11,220.00,'543077')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(701,'Mar 13 2014 12:00:00:000AM',30,2362.25,'543078')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(702,'Mar 13 2014 12:00:00:000AM',10,4422.00,'543079')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(703,'Mar 16 2014 12:00:00:000AM',49,110.00,'543080')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(704,'Mar 16 2014 12:00:00:000AM',68,482.90,'543081')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(705,'Mar 16 2014 12:00:00:000AM',1,491.20,'543082')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(706,'Mar 16 2014 12:00:00:000AM',4,4675.00,'543083')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(707,'Mar 17 2014 12:00:00:000AM',47,1902.10,'543084')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(708,'Mar 17 2014 12:00:00:000AM',24,93.00,'543085')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(709,'Mar 17 2014 12:00:00:000AM',6,677.00,'543086')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(710,'Mar 18 2014 12:00:00:000AM',35,1762.70,'543087')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(711,'Mar 18 2014 12:00:00:000AM',54,781.00,'543088')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(712,'Mar 18 2014 12:00:00:000AM',31,155.00,'543089')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(713,'Mar 19 2014 12:00:00:000AM',35,276.60,'543090')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(714,'Mar 19 2014 12:00:00:000AM',62,1122.00,'543091')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(715,'Mar 19 2014 12:00:00:000AM',63,3584.00,'543092')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(716,'Mar 19 2014 12:00:00:000AM',28,68.00,'543093')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(717,'Mar 20 2014 12:00:00:000AM',74,2052.50,'543094')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(718,'Mar 20 2014 12:00:00:000AM',55,848.00,'543095')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(719,'Mar 20 2014 12:00:00:000AM',14,1255.60,'543096')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(720,'Mar 23 2014 12:00:00:000AM',79,910.40,'543097')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(721,'Mar 23 2014 12:00:00:000AM',20,1408.00,'543098')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(722,'Mar 23 2014 12:00:00:000AM',15,108.00,'543099')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(723,'Mar 24 2014 12:00:00:000AM',8,280.00,'543100')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(724,'Mar 24 2014 12:00:00:000AM',26,1733.06,'543101')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(725,'Mar 24 2014 12:00:00:000AM',40,251.50,'543102')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(726,'Mar 24 2014 12:00:00:000AM',40,291.55,'543103')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(727,'Mar 25 2014 12:00:00:000AM',75,439.00,'543104')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(728,'Mar 25 2014 12:00:00:000AM',10,717.50,'543105')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(729,'Mar 25 2014 12:00:00:000AM',35,912.00,'543106')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(730,'Mar 26 2014 12:00:00:000AM',24,2233.00,'543107')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(731,'Mar 26 2014 12:00:00:000AM',50,1500.70,'543108')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(732,'Mar 26 2014 12:00:00:000AM',20,4813.50,'543109')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(733,'Mar 27 2014 12:00:00:000AM',24,310.00,'543110')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(734,'Mar 27 2014 12:00:00:000AM',34,15810.00,'543111')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(735,'Mar 27 2014 12:00:00:000AM',10,1014.00,'543112')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(736,'Mar 27 2014 12:00:00:000AM',71,796.50,'543113')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(737,'Mar 30 2014 12:00:00:000AM',71,1809.75,'543114')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(738,'Mar 30 2014 12:00:00:000AM',37,2248.20,'543115')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(739,'Mar 30 2014 12:00:00:000AM',54,2220.00,'543116')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(740,'Mar 31 2014 12:00:00:000AM',19,2772.00,'543117')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(741,'Mar 31 2014 12:00:00:000AM',65,3772.00,'543118')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(742,'Mar 31 2014 12:00:00:000AM',61,1353.60,'543119')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(743,'Apr  1 2014 12:00:00:000AM',20,4931.00,'543120')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(744,'Apr  1 2014 12:00:00:000AM',63,2870.00,'543121')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(745,'Apr  1 2014 12:00:00:000AM',77,69.60,'543122')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(746,'Apr  1 2014 12:00:00:000AM',24,6527.25,'543123')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(747,'Apr  2 2014 12:00:00:000AM',83,990.00,'543124')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(748,'Apr  2 2014 12:00:00:000AM',58,1196.00,'543125')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(749,'Apr  2 2014 12:00:00:000AM',63,560.00,'543126')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(750,'Apr  3 2014 12:00:00:000AM',46,1980.00,'543127')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(751,'Apr  3 2014 12:00:00:000AM',91,686.00,'543128')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(752,'Apr  3 2014 12:00:00:000AM',56,1261.00,'543129')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(753,'Apr  6 2014 12:00:00:000AM',65,1075.00,'543130')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(754,'Apr  6 2014 12:00:00:000AM',24,2769.00,'543131')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(755,'Apr  6 2014 12:00:00:000AM',71,1902.00,'543132')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(756,'Apr  6 2014 12:00:00:000AM',78,326.00,'543133')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(757,'Apr  7 2014 12:00:00:000AM',50,295.38,'543134')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(758,'Apr  7 2014 12:00:00:000AM',90,586.00,'543135')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(759,'Apr  7 2014 12:00:00:000AM',32,391.58,'543136')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(760,'Apr  8 2014 12:00:00:000AM',60,2633.90,'543137')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(761,'Apr  8 2014 12:00:00:000AM',20,4903.50,'543138')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(762,'Apr  8 2014 12:00:00:000AM',30,702.00,'543139')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(763,'Apr  9 2014 12:00:00:000AM',66,645.00,'543140')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(764,'Apr  9 2014 12:00:00:000AM',1,960.00,'543141')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(765,'Apr  9 2014 12:00:00:000AM',25,2974.00,'543142')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(766,'Apr  9 2014 12:00:00:000AM',69,361.00,'543143')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(767,'Apr 10 2014 12:00:00:000AM',47,270.20,'543144')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(768,'Apr 10 2014 12:00:00:000AM',70,622.35,'543145')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(769,'Apr 10 2014 12:00:00:000AM',4,491.50,'543146')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(770,'Apr 13 2014 12:00:00:000AM',20,6750.00,'543147')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(771,'Apr 13 2014 12:00:00:000AM',48,1575.00,'543148')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(772,'Apr 13 2014 12:00:00:000AM',64,76.00,'543149')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(773,'Apr 14 2014 12:00:00:000AM',56,744.00,'543150')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(774,'Apr 14 2014 12:00:00:000AM',63,6941.49,'543151')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(775,'Apr 14 2014 12:00:00:000AM',34,1402.00,'543152')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(776,'Apr 14 2014 12:00:00:000AM',11,1500.00,'543153')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(777,'Apr 15 2014 12:00:00:000AM',19,1966.81,'543154')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(778,'Apr 15 2014 12:00:00:000AM',87,300.00,'543155')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(779,'Apr 15 2014 12:00:00:000AM',27,1030.00,'543156')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(780,'Apr 16 2014 12:00:00:000AM',10,1170.30,'543157')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(781,'Apr 16 2014 12:00:00:000AM',39,2160.00,'543158')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(782,'Apr 16 2014 12:00:00:000AM',14,1286.80,'543159')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(783,'Apr 17 2014 12:00:00:000AM',71,16321.90,'543160')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(784,'Apr 17 2014 12:00:00:000AM',71,2393.50,'543161')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(785,'Apr 17 2014 12:00:00:000AM',89,8902.50,'543162')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(786,'Apr 17 2014 12:00:00:000AM',68,3592.00,'543163')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(787,'Apr 20 2014 12:00:00:000AM',55,554.40,'543164')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(788,'Apr 20 2014 12:00:00:000AM',76,1754.50,'543165')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(789,'Apr 20 2014 12:00:00:000AM',17,1692.00,'543166')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(790,'Apr 21 2014 12:00:00:000AM',30,60.00,'543167')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(791,'Apr 21 2014 12:00:00:000AM',76,751.00,'543168')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(792,'Apr 21 2014 12:00:00:000AM',47,3090.00,'543169')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(793,'Apr 22 2014 12:00:00:000AM',32,200.00,'543170')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(794,'Apr 22 2014 12:00:00:000AM',14,1887.00,'543171')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(795,'Apr 22 2014 12:00:00:000AM',15,405.75,'543172')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(796,'Apr 22 2014 12:00:00:000AM',74,210.00,'543173')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(797,'Apr 23 2014 12:00:00:000AM',91,591.60,'543174')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(798,'Apr 23 2014 12:00:00:000AM',10,1309.50,'543175')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(799,'Apr 23 2014 12:00:00:000AM',86,1564.00,'543176')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(800,'Apr 24 2014 12:00:00:000AM',19,1090.50,'543177')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(801,'Apr 24 2014 12:00:00:000AM',10,525.00,'543178')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(802,'Apr 24 2014 12:00:00:000AM',31,342.00,'543179')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(803,'Apr 27 2014 12:00:00:000AM',24,900.00,'543180')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(804,'Apr 27 2014 12:00:00:000AM',41,45.00,'543181')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(805,'Apr 27 2014 12:00:00:000AM',34,1665.00,'543182')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(806,'Apr 27 2014 12:00:00:000AM',59,3658.75,'543183')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(807,'Apr 28 2014 12:00:00:000AM',12,305.00,'543184')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(808,'Apr 28 2014 12:00:00:000AM',35,1727.50,'543185')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(809,'Apr 28 2014 12:00:00:000AM',19,3740.00,'543186')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(810,'Apr 29 2014 12:00:00:000AM',53,45.00,'543187')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(811,'Apr 29 2014 12:00:00:000AM',6,858.00,'543188')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(812,'Apr 29 2014 12:00:00:000AM',67,1838.00,'543189')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(813,'Apr 30 2014 12:00:00:000AM',27,266.00,'543190')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(814,'Apr 30 2014 12:00:00:000AM',32,510.00,'543191')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(815,'Apr 30 2014 12:00:00:000AM',66,508.00,'543192')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(816,'Apr 30 2014 12:00:00:000AM',37,1445.50,'543193')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(817,'May  1 2014 12:00:00:000AM',71,4722.30,'543194')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(818,'May  1 2014 12:00:00:000AM',46,252.56,'543195')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(819,'May  1 2014 12:00:00:000AM',89,928.75,'543196')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(820,'May  4 2014 12:00:00:000AM',17,86.85,'543197')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(821,'May  4 2014 12:00:00:000AM',62,2384.80,'543198')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(822,'May  4 2014 12:00:00:000AM',80,360.00,'543199')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(823,'May  5 2014 12:00:00:000AM',44,1873.50,'543200')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(824,'May  5 2014 12:00:00:000AM',46,510.00,'543201')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(825,'May  5 2014 12:00:00:000AM',20,5218.00,'543202')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(826,'May  5 2014 12:00:00:000AM',58,300.00,'543203')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(827,'May  6 2014 12:00:00:000AM',73,244.30,'543204')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(828,'May  6 2014 12:00:00:000AM',68,586.00,'543205')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(829,'May  6 2014 12:00:00:000AM',9,1057.00,'543206')
;
INSERT INTO Orders (Id,OrderDate,CustomerId,TotalAmount,OrderNumber)VALUES(830,'May  6 2014 12:00:00:000AM',65,1374.60,'543207')
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1,1,11,14.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2,1,42,9.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(3,1,72,34.80,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(4,2,14,18.60,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(5,2,51,42.40,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(6,3,41,7.70,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(7,3,51,42.40,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(8,3,65,16.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(9,4,22,16.80,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(10,4,57,15.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(11,4,65,16.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(12,5,20,64.80,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(13,5,33,2.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(14,5,60,27.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(15,6,31,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(16,6,39,14.40,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(17,6,49,16.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(18,7,24,3.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(19,7,55,19.20,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(20,7,74,8.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(21,8,2,15.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(22,8,16,13.90,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(23,8,36,15.20,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(24,8,59,44.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(25,9,53,26.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(26,9,77,10.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(27,10,27,35.10,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(28,10,39,14.40,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(29,10,77,10.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(30,11,2,15.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(31,11,5,17.00,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(32,11,32,25.60,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(33,12,21,8.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(34,12,37,20.80,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(35,13,41,7.70,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(36,13,57,15.60,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(37,13,62,39.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(38,13,70,12.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(39,14,21,8.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(40,14,35,14.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(41,15,5,17.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(42,15,7,24.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(43,15,56,30.40,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(44,16,16,13.90,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(45,16,24,3.60,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(46,16,30,20.70,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(47,16,74,8.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(48,17,2,15.20,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(49,17,41,7.70,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(50,18,17,31.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(51,18,70,12.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(52,19,12,30.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(53,20,40,14.70,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(54,20,59,44.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(55,20,76,14.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(56,21,29,99.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(57,21,72,27.80,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(58,22,33,2.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(59,22,72,27.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(60,23,36,15.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(61,23,43,36.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(62,24,33,2.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(63,25,20,64.80,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(64,25,31,10.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(65,25,72,27.80,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(66,26,10,24.80,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(67,26,31,10.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(68,26,33,2.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(69,26,40,14.70,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(70,26,76,14.40,33)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(71,27,71,17.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(72,27,72,27.80,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(73,28,24,3.60,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(74,28,59,44.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(75,29,10,24.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(76,29,13,4.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(77,30,28,36.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(78,30,62,39.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(79,31,44,15.50,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(80,31,59,44.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(81,31,63,35.10,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(82,31,73,12.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(83,32,17,31.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(84,33,24,3.60,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(85,33,55,19.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(86,33,75,6.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(87,34,19,7.30,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(88,34,24,3.60,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(89,34,35,14.40,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(90,35,30,20.70,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(91,35,57,15.60,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(92,36,15,12.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(93,36,19,7.30,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(94,36,60,27.20,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(95,36,72,27.80,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(96,37,27,35.10,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(97,37,44,15.50,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(98,37,60,27.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(99,37,67,11.20,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(100,38,1,14.40,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(101,38,40,14.70,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(102,38,53,26.20,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(103,39,35,14.40,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(104,39,62,39.40,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(105,40,16,13.90,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(106,40,34,11.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(107,40,46,9.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(108,41,54,5.90,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(109,41,68,10.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(110,42,3,8.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(111,42,64,26.60,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(112,43,5,17.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(113,43,29,99.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(114,43,49,16.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(115,43,77,10.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(116,44,13,4.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(117,44,44,15.50,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(118,44,51,42.40,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(119,45,20,64.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(120,46,18,50.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(121,46,24,3.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(122,46,63,35.10,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(123,46,75,6.20,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(124,47,1,14.40,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(125,47,17,31.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(126,47,43,36.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(127,47,60,27.20,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(128,47,75,6.20,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(129,48,56,30.40,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(130,49,11,16.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(131,49,16,13.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(132,49,69,28.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(133,50,39,14.40,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(134,50,72,27.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(135,51,2,15.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(136,51,36,15.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(137,51,59,44.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(138,51,62,39.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(139,52,19,7.30,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(140,52,70,12.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(141,53,66,13.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(142,53,68,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(143,54,40,14.70,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(144,54,56,30.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(145,55,17,31.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(146,55,28,36.40,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(147,55,43,36.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(148,56,40,14.70,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(149,56,65,16.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(150,56,68,10.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(151,57,49,16.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(152,57,59,44.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(153,57,71,17.20,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(154,58,18,50.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(155,58,29,99.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(156,58,39,14.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(157,59,30,20.70,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(158,59,53,26.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(159,59,54,5.90,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(160,60,62,39.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(161,60,68,10.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(162,61,69,28.80,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(163,61,70,12.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(164,62,4,17.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(165,62,6,20.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(166,62,42,11.20,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(167,62,43,36.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(168,62,71,17.20,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(169,63,16,13.90,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(170,63,62,39.40,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(171,64,42,11.20,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(172,64,69,28.80,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(173,65,28,36.40,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(174,65,43,36.80,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(175,65,53,26.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(176,65,75,6.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(177,66,36,15.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(178,67,32,25.60,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(179,67,58,10.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(180,67,62,39.40,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(181,68,34,11.20,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(182,68,70,12.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(183,69,41,7.70,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(184,69,62,39.40,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(185,70,1,14.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(186,71,41,7.70,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(187,71,76,14.40,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(188,72,17,31.20,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(189,72,28,36.40,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(190,72,76,14.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(191,73,71,17.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(192,74,35,14.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(193,75,52,5.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(194,76,15,12.40,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(195,76,25,11.20,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(196,76,39,14.40,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(197,77,16,13.90,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(198,77,35,14.40,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(199,77,46,9.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(200,77,59,44.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(201,77,63,35.10,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(202,78,6,20.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(203,78,13,4.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(204,78,14,18.60,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(205,78,31,10.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(206,78,72,27.80,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(207,79,4,17.60,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(208,79,57,15.60,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(209,79,75,6.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(210,80,2,15.20,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(211,80,11,16.80,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(212,80,30,20.70,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(213,80,58,10.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(214,81,59,44.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(215,81,65,16.80,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(216,81,68,10.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(217,82,19,7.30,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(218,82,30,20.70,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(219,82,38,210.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(220,82,56,30.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(221,83,26,24.90,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(222,83,72,27.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(223,84,54,5.90,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(224,85,18,50.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(225,85,42,11.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(226,85,47,7.60,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(227,86,14,18.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(228,86,21,8.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(229,86,71,17.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(230,87,52,5.60,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(231,87,68,10.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(232,88,2,15.20,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(233,88,31,10.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(234,88,32,25.60,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(235,88,51,42.40,48)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(236,89,4,17.60,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(237,90,23,7.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(238,90,26,24.90,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(239,90,36,15.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(240,90,37,20.80,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(241,90,72,27.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(242,91,17,31.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(243,91,30,20.70,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(244,92,4,17.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(245,92,17,31.20,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(246,92,62,39.40,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(247,93,18,50.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(248,93,41,7.70,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(249,93,43,36.80,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(250,94,33,2.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(251,94,59,44.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(252,95,2,15.20,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(253,95,31,10.00,56)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(254,95,36,15.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(255,95,55,19.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(256,96,64,26.60,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(257,96,68,10.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(258,96,76,14.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(259,97,4,17.60,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(260,97,8,32.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(261,98,8,32.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(262,98,19,7.30,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(263,98,42,11.20,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(264,99,17,31.20,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(265,99,56,30.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(266,100,25,11.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(267,100,39,14.40,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(268,100,40,14.70,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(269,100,75,6.20,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(270,101,1,14.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(271,101,23,7.20,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(272,102,54,5.90,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(273,103,50,13.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(274,103,69,28.80,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(275,104,38,210.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(276,104,41,7.70,13)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(277,104,44,15.50,77)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(278,104,65,16.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(279,105,24,3.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(280,105,54,5.90,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(281,106,11,16.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(282,106,38,210.80,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(283,107,1,14.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(284,107,29,99.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(285,108,24,3.60,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(286,108,57,15.60,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(287,109,31,10.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(288,109,55,19.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(289,109,69,28.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(290,110,10,24.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(291,110,26,24.90,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(292,110,60,27.20,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(293,111,24,3.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(294,111,34,11.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(295,111,36,15.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(296,112,16,13.90,56)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(297,112,31,10.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(298,112,60,27.20,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(299,113,28,36.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(300,113,29,99.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(301,113,38,210.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(302,113,49,16.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(303,113,54,5.90,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(304,114,39,14.40,54)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(305,114,60,27.20,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(306,115,25,11.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(307,115,51,42.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(308,115,54,5.90,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(309,116,31,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(310,116,75,6.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(311,116,76,14.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(312,117,69,28.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(313,117,71,17.20,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(314,118,11,16.80,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(315,119,65,16.80,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(316,119,77,10.40,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(317,120,34,11.20,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(318,120,54,5.90,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(319,120,65,16.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(320,120,77,10.40,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(321,121,21,8.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(322,121,28,36.40,13)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(323,121,57,15.60,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(324,121,64,26.60,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(325,122,29,99.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(326,122,56,30.40,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(327,123,1,14.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(328,123,64,26.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(329,123,74,8.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(330,124,36,15.20,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(331,125,20,64.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(332,125,38,210.80,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(333,125,60,27.20,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(334,125,72,27.80,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(335,126,58,10.60,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(336,126,71,17.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(337,127,31,10.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(338,127,58,10.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(339,128,14,18.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(340,128,54,5.90,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(341,129,31,10.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(342,130,28,36.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(343,130,39,14.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(344,131,71,17.20,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(345,132,41,7.70,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(346,132,63,35.10,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(347,132,65,16.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(348,133,30,20.70,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(349,133,53,26.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(350,133,60,27.20,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(351,133,70,12.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(352,134,74,8.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(353,135,5,17.00,32)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(354,135,18,50.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(355,135,29,99.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(356,135,33,2.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(357,135,74,8.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(358,136,13,4.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(359,136,50,13.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(360,136,56,30.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(361,137,20,64.80,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(362,137,60,27.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(363,138,7,24.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(364,138,60,27.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(365,138,68,10.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(366,139,24,3.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(367,139,34,11.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(368,140,24,3.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(369,140,28,36.40,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(370,140,59,44.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(371,140,71,17.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(372,141,45,7.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(373,141,52,5.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(374,141,53,26.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(375,142,10,24.80,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(376,142,55,19.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(377,142,62,39.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(378,142,70,12.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(379,143,31,10.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(380,143,35,14.40,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(381,143,46,9.60,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(382,143,72,27.80,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(383,144,13,4.80,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(384,145,69,28.80,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(385,146,2,15.20,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(386,146,14,18.60,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(387,146,25,11.20,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(388,146,26,24.90,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(389,146,31,10.00,32)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(390,147,13,4.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(391,147,62,39.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(392,148,46,9.60,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(393,148,53,26.20,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(394,148,69,28.80,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(395,149,23,7.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(396,149,71,17.20,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(397,149,72,27.80,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(398,150,21,8.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(399,150,51,42.40,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(400,151,35,14.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(401,151,55,19.20,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(402,152,68,10.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(403,152,71,17.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(404,152,76,14.40,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(405,152,77,10.40,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(406,153,29,99.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(407,153,35,14.40,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(408,153,49,16.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(409,154,30,20.70,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(410,154,56,30.40,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(411,154,65,16.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(412,154,71,17.20,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(413,155,23,7.20,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(414,155,63,35.10,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(415,156,16,13.90,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(416,156,48,10.20,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(417,157,26,24.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(418,157,42,11.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(419,157,49,16.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(420,158,3,8.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(421,159,1,14.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(422,159,21,8.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(423,159,28,36.40,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(424,159,36,15.20,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(425,159,40,14.70,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(426,160,11,16.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(427,160,69,28.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(428,160,71,17.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(429,161,37,20.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(430,161,54,5.90,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(431,161,62,39.40,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(432,162,14,18.60,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(433,162,21,8.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(434,163,33,2.00,49)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(435,163,59,44.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(436,164,41,7.70,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(437,164,44,15.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(438,164,59,44.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(439,165,14,18.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(440,166,1,14.40,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(441,166,62,39.40,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(442,166,76,14.40,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(443,167,19,7.30,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(444,167,33,2.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(445,168,17,31.20,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(446,168,33,2.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(447,169,19,7.30,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(448,169,53,26.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(449,169,57,15.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(450,170,38,210.80,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(451,170,46,9.60,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(452,170,68,10.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(453,170,77,10.40,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(454,171,2,15.20,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(455,171,47,7.60,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(456,171,61,22.80,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(457,171,74,8.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(458,172,60,27.20,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(459,172,69,28.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(460,173,9,77.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(461,173,13,4.80,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(462,173,70,12.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(463,173,73,12.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(464,174,19,7.30,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(465,174,26,24.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(466,174,53,26.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(467,174,77,10.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(468,175,26,24.90,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(469,176,31,10.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(470,176,59,44.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(471,177,35,14.40,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(472,177,38,210.80,49)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(473,177,68,10.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(474,178,55,19.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(475,178,76,14.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(476,179,56,30.40,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(477,179,64,26.60,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(478,180,14,18.60,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(479,181,46,9.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(480,182,50,13.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(481,182,63,35.10,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(482,183,17,31.20,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(483,183,21,8.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(484,183,56,30.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(485,183,59,44.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(486,184,17,31.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(487,184,40,14.70,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(488,184,47,7.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(489,185,26,24.90,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(490,185,54,5.90,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(491,186,56,30.40,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(492,187,11,16.80,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(493,187,76,14.40,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(494,188,2,15.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(495,188,22,16.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(496,188,72,27.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(497,189,46,9.60,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(498,189,56,30.40,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(499,189,64,26.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(500,189,75,6.20,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(501,190,53,26.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(502,191,19,7.30,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(503,191,34,11.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(504,191,57,15.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(505,192,12,30.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(506,192,16,13.90,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(507,192,64,26.60,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(508,192,74,8.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(509,193,2,15.20,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(510,193,16,13.90,49)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(511,193,29,99.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(512,193,61,22.80,90)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(513,194,27,35.10,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(514,195,11,16.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(515,195,54,5.90,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(516,195,66,13.60,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(517,196,11,16.80,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(518,196,28,36.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(519,197,17,31.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(520,197,26,24.90,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(521,197,35,14.40,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(522,197,41,7.70,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(523,198,39,14.40,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(524,198,54,5.90,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(525,199,19,7.30,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(526,199,24,3.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(527,199,31,10.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(528,199,52,5.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(529,200,19,7.30,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(530,200,65,16.80,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(531,200,71,17.20,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(532,201,26,24.90,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(533,201,40,14.70,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(534,202,10,24.80,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(535,202,52,5.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(536,202,62,39.40,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(537,203,10,24.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(538,203,54,5.90,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(539,204,55,19.20,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(540,204,64,26.60,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(541,204,65,16.80,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(542,204,77,10.40,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(543,205,28,36.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(544,205,44,15.50,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(545,206,48,10.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(546,206,70,12.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(547,207,16,13.90,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(548,207,33,2.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(549,207,46,9.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(550,208,39,14.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(551,208,53,26.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(552,208,61,22.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(553,208,71,17.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(554,209,21,8.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(555,209,49,16.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(556,210,59,44.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(557,211,26,24.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(558,211,28,36.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(559,211,43,36.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(560,211,56,30.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(561,211,71,17.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(562,212,7,24.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(563,212,46,9.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(564,212,72,27.80,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(565,213,68,10.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(566,213,75,6.20,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(567,214,21,8.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(568,214,30,20.70,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(569,214,55,19.20,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(570,215,13,4.80,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(571,215,23,7.20,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(572,216,19,7.30,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(573,216,42,11.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(574,217,4,17.60,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(575,217,43,36.80,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(576,217,56,30.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(577,217,60,27.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(578,218,24,3.60,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(579,218,29,99.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(580,218,40,14.70,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(581,218,45,7.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(582,218,50,13.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(583,219,11,16.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(584,219,46,9.60,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(585,220,24,3.60,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(586,220,25,11.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(587,221,30,20.70,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(588,221,43,36.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(589,222,2,15.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(590,222,16,13.90,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(591,222,44,15.50,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(592,223,18,50.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(593,223,23,7.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(594,223,64,26.60,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(595,224,7,24.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(596,224,56,30.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(597,225,24,3.60,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(598,225,51,42.40,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(599,226,33,2.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(600,226,71,17.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(601,227,14,18.60,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(602,227,28,36.40,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(603,227,40,14.70,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(604,227,75,6.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(605,228,31,10.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(606,228,66,13.60,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(607,228,76,14.40,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(608,229,55,19.20,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(609,229,70,12.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(610,230,1,14.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(611,230,21,8.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(612,230,39,14.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(613,231,10,24.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(614,232,38,210.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(615,232,53,26.20,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(616,232,59,44.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(617,232,64,26.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(618,233,47,7.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(619,233,59,44.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(620,234,49,16.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(621,234,60,27.20,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(622,235,40,14.70,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(623,236,34,11.20,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(624,236,77,10.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(625,237,21,8.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(626,237,40,14.70,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(627,237,51,42.40,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(628,238,2,15.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(629,238,3,8.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(630,238,55,19.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(631,238,70,12.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(632,239,11,16.80,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(633,239,51,42.40,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(634,239,74,8.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(635,240,19,7.30,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(636,240,26,24.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(637,240,54,5.90,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(638,241,59,44.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(639,241,73,12.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(640,242,11,16.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(641,242,16,13.90,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(642,243,59,44.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(643,243,68,10.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(644,243,75,6.20,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(645,244,44,15.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(646,244,77,10.40,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(647,245,25,11.20,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(648,245,42,11.20,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(649,246,65,16.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(650,246,66,13.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(651,246,69,28.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(652,247,56,30.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(653,248,23,7.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(654,248,41,7.70,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(655,248,77,10.40,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(656,249,31,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(657,250,56,30.40,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(658,250,72,27.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(659,250,77,10.40,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(660,251,24,4.50,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(661,251,40,18.40,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(662,251,42,14.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(663,252,28,45.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(664,252,49,20.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(665,253,15,15.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(666,253,28,45.60,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(667,254,54,7.45,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(668,255,45,9.50,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(669,255,53,32.80,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(670,255,67,14.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(671,256,14,23.25,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(672,256,65,21.05,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(673,257,2,19.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(674,257,21,10.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(675,257,53,32.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(676,257,61,28.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(677,258,62,49.30,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(678,259,25,14.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(679,259,70,15.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(680,260,43,46.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(681,260,48,12.75,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(682,261,13,6.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(683,261,39,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(684,262,28,45.60,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(685,263,29,123.79,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(686,263,75,7.75,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(687,264,4,22.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(688,264,7,30.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(689,264,8,40.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(690,265,24,4.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(691,265,46,12.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(692,265,47,9.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(693,265,60,34.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(694,266,21,10.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(695,266,32,32.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(696,266,61,28.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(697,267,20,81.00,39)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(698,267,28,45.60,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(699,267,56,38.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(700,267,65,21.05,39)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(701,267,75,7.75,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(702,268,9,97.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(703,268,16,17.45,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(704,268,27,43.90,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(705,268,33,2.50,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(706,268,60,34.00,84)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(707,269,18,62.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(708,269,41,9.65,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(709,269,42,14.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(710,270,52,7.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(711,270,59,55.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(712,270,70,15.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(713,271,24,4.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(714,271,38,263.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(715,271,44,19.45,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(716,272,10,31.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(717,272,56,38.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(718,272,60,34.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(719,273,24,4.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(720,273,53,32.80,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(721,274,35,18.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(722,274,41,9.65,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(723,274,68,12.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(724,275,1,18.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(725,275,8,40.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(726,275,30,25.89,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(727,275,40,18.40,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(728,276,17,39.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(729,276,20,81.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(730,276,37,26.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(731,276,41,9.65,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(732,277,10,31.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(733,277,30,25.89,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(734,277,43,46.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(735,277,54,7.45,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(736,278,36,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(737,278,40,18.40,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(738,279,1,18.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(739,279,13,6.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(740,279,56,38.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(741,280,4,22.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(742,280,36,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(743,281,11,21.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(744,281,33,2.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(745,281,72,34.80,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(746,282,55,24.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(747,282,68,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(748,282,69,36.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(749,283,17,39.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(750,283,43,46.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(751,283,61,28.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(752,283,76,18.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(753,284,59,55.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(754,285,30,25.89,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(755,285,66,17.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(756,286,4,22.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(757,286,72,34.80,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(758,286,73,15.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(759,287,30,25.89,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(760,287,40,18.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(761,287,54,7.45,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(762,288,11,21.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(763,288,40,18.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(764,288,57,19.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(765,288,59,55.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(766,289,12,38.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(767,289,31,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(768,289,33,2.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(769,289,60,34.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(770,290,31,12.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(771,290,51,53.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(772,290,58,13.25,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(773,290,72,34.80,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(774,290,73,15.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(775,291,70,15.00,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(776,291,72,34.80,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(777,292,13,6.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(778,292,21,10.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(779,292,33,2.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(780,292,49,20.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(781,293,3,10.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(782,293,26,31.23,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(783,293,38,263.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(784,293,68,12.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(785,294,24,4.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(786,294,38,263.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(787,294,65,21.05,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(788,294,71,21.50,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(789,295,11,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(790,295,54,7.45,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(791,296,12,38.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(792,296,23,9.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(793,297,28,45.60,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(794,297,67,14.00,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(795,298,11,21.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(796,299,7,30.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(797,299,35,18.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(798,299,62,49.30,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(799,300,32,32.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(800,300,36,19.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(801,301,34,14.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(802,301,41,9.65,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(803,302,31,12.50,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(804,302,45,9.50,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(805,302,51,53.00,48)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(806,303,17,39.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(807,303,19,9.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(808,303,21,10.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(809,303,61,28.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(810,304,16,17.45,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(811,304,35,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(812,304,44,19.45,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(813,305,69,36.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(814,305,75,7.75,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(815,306,11,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(816,306,16,17.45,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(817,306,22,21.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(818,306,31,12.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(819,306,35,18.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(820,307,16,17.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(821,307,23,9.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(822,307,62,49.30,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(823,307,77,13.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(824,308,14,23.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(825,308,19,9.20,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(826,308,24,4.50,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(827,308,51,53.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(828,308,56,38.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(829,309,72,34.80,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(830,310,64,33.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(831,310,75,7.75,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(832,311,47,9.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(833,311,51,53.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(834,311,52,7.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(835,311,53,32.80,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(836,311,73,15.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(837,312,41,9.65,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(838,312,55,24.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(839,313,30,25.89,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(840,313,62,49.30,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(841,314,44,19.45,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(842,314,51,53.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(843,315,33,2.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(844,315,62,49.30,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(845,316,36,19.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(846,316,52,7.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(847,317,17,39.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(848,317,31,12.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(849,317,55,24.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(850,318,24,4.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(851,318,64,33.25,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(852,319,11,21.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(853,319,18,62.50,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(854,319,76,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(855,320,31,12.50,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(856,320,51,53.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(857,320,59,55.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(858,321,10,31.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(859,322,31,12.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(860,322,76,18.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(861,323,11,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(862,323,56,38.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(863,324,14,23.25,11)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(864,324,42,14.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(865,325,16,17.45,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(866,325,32,32.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(867,325,40,18.40,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(868,325,75,7.75,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(869,326,17,39.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(870,326,34,14.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(871,326,53,32.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(872,327,33,2.50,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(873,327,40,18.40,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(874,327,62,49.30,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(875,327,64,33.25,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(876,328,59,55.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(877,328,63,43.90,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(878,328,72,34.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(879,328,76,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(880,329,1,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(881,329,31,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(882,329,44,19.45,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(883,330,39,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(884,330,75,7.75,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(885,330,77,13.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(886,331,35,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(887,331,57,19.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(888,332,15,15.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(889,332,75,7.75,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(890,333,14,23.25,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(891,333,41,9.65,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(892,333,65,21.05,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(893,334,75,7.75,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(894,335,57,19.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(895,335,76,18.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(896,336,29,123.79,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(897,336,60,34.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(898,336,69,36.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(899,337,31,12.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(900,338,47,9.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(901,339,52,7.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(902,340,26,31.23,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(903,340,35,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(904,340,77,13.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(905,341,18,62.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(906,341,42,14.00,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(907,342,35,18.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(908,343,1,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(909,343,77,13.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(910,344,3,10.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(911,344,7,30.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(912,344,54,7.45,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(913,345,15,15.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(914,345,26,31.23,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(915,346,20,81.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(916,346,69,36.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(917,346,76,18.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(918,347,52,7.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(919,347,58,13.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(920,348,35,18.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(921,348,61,28.50,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(922,348,69,36.00,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(923,349,56,38.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(924,349,63,43.90,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(925,349,75,7.75,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(926,350,24,4.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(927,350,57,19.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(928,350,65,21.05,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(929,351,27,43.90,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(930,351,71,21.50,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(931,352,62,49.30,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(932,353,54,7.45,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(933,353,73,15.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(934,354,13,6.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(935,354,59,55.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(936,355,77,13.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(937,356,22,21.00,48)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(938,356,49,20.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(939,357,48,12.75,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(940,357,76,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(941,358,16,17.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(942,358,59,55.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(943,358,60,34.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(944,358,71,21.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(945,359,4,22.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(946,359,55,24.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(947,359,62,49.30,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(948,360,7,30.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(949,360,17,39.00,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(950,360,33,2.50,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(951,360,40,18.40,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(952,360,72,34.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(953,361,56,38.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(954,362,1,18.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(955,362,10,31.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(956,362,21,10.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(957,363,36,19.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(958,364,1,18.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(959,364,2,19.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(960,364,60,34.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(961,365,10,31.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(962,365,36,19.00,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(963,365,49,20.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(964,365,60,34.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(965,365,76,18.00,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(966,366,13,6.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(967,366,75,7.75,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(968,367,11,21.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(969,367,21,10.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(970,367,39,18.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(971,368,55,24.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(972,369,38,263.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(973,369,56,38.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(974,369,70,15.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(975,369,71,21.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(976,370,59,55.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(977,371,6,25.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(978,371,56,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(979,371,68,12.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(980,372,21,10.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(981,372,22,21.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(982,373,24,4.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(983,373,52,7.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(984,374,19,9.20,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(985,374,23,9.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(986,374,70,15.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(987,374,71,21.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(988,375,2,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(989,375,68,12.50,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(990,376,14,23.25,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(991,376,19,9.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(992,376,21,10.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(993,376,24,4.50,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(994,376,35,18.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(995,377,28,45.60,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(996,377,29,123.79,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(997,377,44,19.45,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(998,378,14,23.25,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(999,378,42,14.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1000,378,60,34.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1001,379,53,32.80,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1002,379,60,34.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1003,379,71,21.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1004,380,62,49.30,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1005,380,73,15.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1006,381,1,18.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1007,382,29,123.79,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1008,382,64,33.25,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1009,383,55,24.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1010,383,76,18.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1011,384,75,7.75,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1012,385,2,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1013,385,33,2.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1014,386,12,38.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1015,386,13,6.00,13)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1016,386,26,31.23,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1017,386,62,49.30,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1018,387,7,30.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1019,387,18,62.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1020,387,51,53.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1021,387,75,7.75,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1022,388,4,22.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1023,388,5,21.35,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1024,388,22,21.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1025,389,4,22.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1026,389,58,13.25,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1027,390,11,21.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1028,390,50,16.25,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1029,390,56,38.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1030,391,45,9.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1031,391,65,21.05,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1032,391,72,34.80,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1033,392,18,62.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1034,393,69,36.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1035,393,70,15.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1036,394,2,19.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1037,394,40,18.40,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1038,395,21,10.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1039,395,61,28.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1040,396,28,45.60,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1041,396,39,18.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1042,396,46,12.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1043,397,18,62.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1044,397,43,46.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1045,397,46,12.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1046,398,18,62.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1047,398,36,19.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1048,399,1,18.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1049,399,10,31.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1050,399,71,21.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1051,399,77,13.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1052,400,19,9.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1053,400,39,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1054,401,22,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1055,401,24,4.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1056,402,28,45.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1057,402,72,34.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1058,403,30,25.89,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1059,403,53,32.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1060,403,54,7.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1061,404,19,9.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1062,404,22,21.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1063,405,30,25.89,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1064,405,42,14.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1065,406,16,17.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1066,406,60,34.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1067,407,4,22.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1068,407,39,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1069,407,54,7.45,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1070,408,41,9.65,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1071,409,14,23.25,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1072,409,44,19.45,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1073,409,47,9.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1074,410,15,15.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1075,410,41,9.65,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1076,410,46,12.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1077,410,47,9.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1078,410,56,38.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1079,410,60,34.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1080,411,21,10.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1081,411,40,18.40,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1082,411,60,34.00,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1083,411,77,13.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1084,412,31,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1085,412,40,18.40,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1086,412,70,15.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1087,413,20,81.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1088,414,39,18.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1089,414,58,13.25,49)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1090,415,68,12.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1091,416,40,18.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1092,416,42,14.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1093,416,51,53.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1094,417,10,31.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1095,417,56,38.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1096,417,65,21.05,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1097,418,51,53.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1098,418,59,55.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1099,418,76,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1100,419,29,123.79,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1101,419,65,21.05,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1102,420,69,36.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1103,420,71,21.50,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1104,421,31,12.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1105,421,55,24.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1106,421,64,33.25,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1107,422,36,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1108,423,23,9.00,32)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1109,423,46,12.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1110,423,67,14.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1111,423,73,15.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1112,423,75,7.75,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1113,424,16,17.45,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1114,424,62,49.30,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1115,424,65,21.05,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1116,425,38,263.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1117,425,71,21.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1118,426,16,17.45,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1119,426,42,14.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1120,426,43,46.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1121,427,23,9.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1122,428,14,23.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1123,428,53,32.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1124,428,58,13.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1125,429,10,31.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1126,429,19,9.20,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1127,429,44,19.45,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1128,430,26,31.23,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1129,430,33,2.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1130,431,12,38.00,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1131,431,33,2.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1132,431,41,9.65,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1133,431,54,7.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1134,432,59,55.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1135,433,16,17.45,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1136,433,31,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1137,433,42,14.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1138,434,19,9.20,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1139,434,21,10.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1140,434,64,33.25,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1141,435,33,2.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1142,435,66,17.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1143,435,75,7.75,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1144,436,52,7.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1145,437,40,18.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1146,437,47,9.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1147,437,60,34.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1148,438,10,31.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1149,438,41,9.65,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1150,438,47,9.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1151,439,17,39.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1152,439,26,31.23,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1153,440,9,97.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1154,440,29,123.79,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1155,440,36,19.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1156,441,10,31.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1157,441,28,45.60,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1158,441,34,14.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1159,442,1,18.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1160,443,56,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1161,443,77,13.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1162,444,1,18.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1163,444,29,123.79,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1164,444,43,46.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1165,444,44,19.45,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1166,444,62,49.30,48)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1167,445,63,43.90,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1168,446,9,97.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1169,446,54,7.45,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1170,446,69,36.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1171,446,73,15.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1172,447,7,30.00,90)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1173,447,59,55.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1174,447,70,15.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1175,448,8,40.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1176,448,12,38.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1177,448,24,4.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1178,449,17,39.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1179,449,46,12.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1180,450,19,9.20,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1181,450,35,18.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1182,450,58,13.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1183,450,70,15.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1184,451,11,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1185,451,17,39.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1186,451,29,123.79,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1187,451,65,21.05,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1188,451,70,15.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1189,452,47,9.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1190,453,1,18.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1191,453,34,14.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1192,453,68,12.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1193,453,71,21.50,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1194,454,59,55.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1195,454,71,21.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1196,454,76,18.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1197,455,3,10.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1198,455,76,18.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1199,456,2,19.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1200,456,59,55.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1201,456,73,15.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1202,457,4,22.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1203,457,24,4.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1204,457,48,12.75,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1205,458,31,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1206,458,32,32.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1207,459,16,17.45,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1208,459,43,46.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1209,459,59,55.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1210,460,55,24.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1211,460,57,19.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1212,460,70,15.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1213,461,5,21.35,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1214,461,36,19.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1215,462,8,40.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1216,462,51,53.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1217,462,60,34.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1218,463,19,9.20,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1219,463,47,9.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1220,464,19,9.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1221,464,41,9.65,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1222,464,53,32.80,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1223,465,53,32.80,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1224,465,56,38.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1225,466,10,31.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1226,466,26,31.23,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1227,466,45,9.50,110)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1228,466,46,12.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1229,467,2,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1230,467,17,39.00,27)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1231,467,47,9.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1232,467,56,38.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1233,467,58,13.25,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1234,468,10,31.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1235,468,71,21.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1236,469,21,10.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1237,469,51,53.00,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1238,469,61,28.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1239,470,21,10.00,32)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1240,470,54,7.45,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1241,470,69,36.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1242,471,12,38.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1243,471,16,17.45,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1244,471,36,19.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1245,471,62,49.30,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1246,472,18,62.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1247,472,30,25.89,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1248,472,54,7.45,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1249,473,35,18.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1250,473,71,21.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1251,474,44,19.45,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1252,475,2,19.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1253,475,31,12.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1254,475,68,12.50,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1255,475,75,7.75,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1256,476,26,31.23,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1257,477,10,31.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1258,477,61,28.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1259,478,41,9.65,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1260,478,52,7.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1261,478,55,24.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1262,479,4,22.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1263,479,11,21.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1264,480,17,39.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1265,480,56,38.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1266,480,59,55.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1267,481,30,25.89,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1268,481,40,18.40,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1269,481,55,24.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1270,481,60,34.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1271,482,1,18.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1272,482,21,10.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1273,482,50,16.25,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1274,483,16,17.45,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1275,483,31,12.50,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1276,483,65,21.05,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1277,484,21,10.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1278,484,51,53.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1279,485,76,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1280,486,14,23.25,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1281,486,28,45.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1282,486,52,7.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1283,487,6,25.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1284,487,30,25.89,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1285,487,76,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1286,488,61,28.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1287,488,77,13.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1288,489,65,21.05,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1289,489,75,7.75,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1290,490,13,6.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1291,490,41,9.65,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1292,491,16,17.45,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1293,492,36,19.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1294,492,52,7.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1295,493,28,45.60,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1296,493,35,18.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1297,493,45,9.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1298,493,56,38.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1299,494,2,19.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1300,495,3,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1301,495,60,34.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1302,495,72,34.80,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1303,496,46,12.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1304,497,40,18.40,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1305,498,18,62.50,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1306,498,44,19.45,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1307,498,59,55.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1308,498,72,34.80,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1309,499,13,6.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1310,499,42,14.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1311,499,62,49.30,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1312,499,69,36.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1313,500,31,12.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1314,500,41,9.65,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1315,500,63,43.90,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1316,500,69,36.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1317,501,23,9.00,44)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1318,501,40,18.40,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1319,501,56,38.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1320,502,56,38.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1321,502,59,55.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1322,502,76,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1323,503,14,23.25,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1324,503,45,9.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1325,503,59,55.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1326,504,26,31.23,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1327,504,30,25.89,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1328,504,50,16.25,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1329,504,73,15.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1330,505,1,18.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1331,505,69,36.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1332,506,45,9.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1333,506,74,10.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1334,507,40,18.40,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1335,508,47,9.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1336,508,56,38.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1337,508,57,19.50,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1338,508,69,36.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1339,509,18,62.50,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1340,509,36,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1341,509,68,12.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1342,509,69,36.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1343,510,34,14.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1344,510,59,55.00,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1345,510,62,49.30,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1346,510,64,33.25,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1347,511,26,31.23,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1348,511,52,7.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1349,511,70,15.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1350,512,32,32.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1351,513,25,14.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1352,513,27,43.90,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1353,513,43,46.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1354,514,25,14.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1355,514,75,7.75,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1356,515,39,18.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1357,515,47,9.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1358,515,51,53.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1359,515,56,38.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1360,516,21,10.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1361,516,22,21.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1362,516,24,4.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1363,517,3,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1364,517,39,18.00,130)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1365,518,65,21.05,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1366,519,2,19.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1367,519,7,30.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1368,519,68,12.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1369,520,42,14.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1370,521,22,21.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1371,521,31,12.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1372,521,60,34.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1373,521,71,21.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1374,522,41,9.65,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1375,522,52,7.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1376,522,61,28.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1377,522,62,49.30,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1378,523,11,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1379,524,71,21.50,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1380,525,29,123.79,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1381,525,59,55.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1382,526,17,39.00,33)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1383,526,31,12.50,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1384,526,75,7.75,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1385,527,31,12.50,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1386,527,66,17.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1387,528,10,31.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1388,528,67,14.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1389,529,31,12.50,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1390,529,42,14.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1391,529,45,9.50,27)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1392,529,51,53.00,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1393,530,42,14.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1394,531,41,9.65,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1395,532,16,17.45,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1396,532,62,49.30,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1397,533,70,15.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1398,533,77,13.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1399,534,54,7.45,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1400,534,56,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1401,534,74,10.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1402,535,31,12.50,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1403,536,31,12.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1404,536,38,263.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1405,537,36,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1406,537,39,18.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1407,537,72,34.80,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1408,538,10,31.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1409,538,75,7.75,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1410,539,8,40.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1411,539,30,25.89,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1412,539,75,7.75,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1413,540,2,19.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1414,540,29,123.79,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1415,541,19,9.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1416,541,75,7.75,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1417,542,18,62.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1418,542,35,18.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1419,542,63,43.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1420,542,68,12.50,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1421,543,7,30.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1422,543,56,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1423,544,29,123.79,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1424,544,41,9.65,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1425,545,2,19.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1426,545,54,7.45,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1427,545,68,12.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1428,546,41,9.65,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1429,546,52,7.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1430,547,14,23.25,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1431,547,54,7.45,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1432,548,16,17.45,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1433,548,17,39.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1434,549,26,31.23,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1435,549,44,19.45,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1436,549,64,33.25,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1437,549,69,36.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1438,550,11,21.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1439,551,62,49.30,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1440,551,72,34.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1441,552,13,6.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1442,552,24,4.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1443,552,59,55.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1444,553,11,21.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1445,553,51,53.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1446,553,54,7.45,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1447,554,17,39.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1448,554,29,123.79,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1449,555,30,25.89,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1450,555,51,53.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1451,555,55,24.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1452,555,62,49.30,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1453,556,19,9.20,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1454,556,25,14.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1455,556,59,55.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1456,557,10,31.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1457,557,28,45.60,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1458,557,49,20.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1459,558,34,14.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1460,558,38,263.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1461,559,2,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1462,559,65,21.05,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1463,559,74,10.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1464,560,40,18.40,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1465,561,56,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1466,561,76,18.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1467,562,52,7.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1468,563,13,6.00,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1469,563,25,14.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1470,563,70,15.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1471,564,19,9.20,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1472,564,23,9.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1473,564,40,18.40,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1474,565,31,12.50,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1475,565,72,34.80,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1476,565,77,13.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1477,566,2,19.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1478,566,46,12.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1479,567,41,9.65,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1480,567,43,46.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1481,567,48,12.75,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1482,567,61,28.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1483,568,33,2.50,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1484,569,38,263.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1485,569,62,49.30,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1486,570,26,31.23,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1487,570,38,263.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1488,570,40,18.40,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1489,570,62,49.30,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1490,571,32,32.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1491,571,41,9.65,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1492,572,43,46.00,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1493,572,75,7.75,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1494,573,56,38.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1495,574,35,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1496,574,51,53.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1497,575,62,49.30,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1498,575,70,15.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1499,576,11,21.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1500,576,57,19.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1501,576,59,55.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1502,576,77,13.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1503,577,41,9.65,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1504,577,70,15.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1505,578,26,31.23,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1506,578,53,32.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1507,579,31,12.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1508,579,57,19.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1509,580,10,31.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1510,580,39,18.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1511,581,20,81.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1512,581,38,263.50,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1513,582,2,19.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1514,582,8,40.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1515,582,13,6.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1516,582,60,34.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1517,583,6,25.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1518,583,39,18.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1519,583,60,34.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1520,583,68,12.50,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1521,584,19,9.20,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1522,584,35,18.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1523,584,38,263.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1524,584,43,46.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1525,585,13,6.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1526,585,25,14.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1527,585,44,19.45,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1528,585,64,33.25,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1529,586,7,30.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1530,586,31,12.50,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1531,586,53,32.80,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1532,587,29,123.79,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1533,587,30,25.89,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1534,588,59,55.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1535,588,77,13.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1536,589,22,21.00,52)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1537,589,35,18.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1538,589,57,19.50,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1539,589,60,34.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1540,589,64,33.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1541,590,13,6.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1542,590,40,18.40,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1543,590,47,9.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1544,590,76,18.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1545,591,1,18.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1546,591,18,62.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1547,591,36,19.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1548,592,58,13.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1549,592,72,34.80,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1550,593,25,14.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1551,593,39,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1552,594,10,31.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1553,594,56,38.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1554,594,59,55.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1555,594,77,13.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1556,595,11,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1557,595,43,46.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1558,595,68,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1559,595,70,15.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1560,596,51,53.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1561,597,22,21.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1562,598,23,9.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1563,598,35,18.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1564,598,42,14.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1565,598,58,13.25,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1566,598,64,33.25,48)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1567,599,4,22.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1568,599,70,15.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1569,599,74,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1570,600,1,18.00,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1571,600,19,9.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1572,600,37,26.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1573,600,45,9.50,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1574,600,60,34.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1575,600,71,21.50,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1576,601,5,21.35,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1577,601,9,97.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1578,602,3,10.00,49)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1579,602,26,31.23,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1580,603,25,14.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1581,603,33,2.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1582,603,70,15.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1583,604,2,19.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1584,604,25,14.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1585,604,57,19.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1586,604,59,55.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1587,605,2,19.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1588,605,17,39.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1589,605,62,49.30,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1590,606,18,62.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1591,607,10,31.00,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1592,607,13,6.00,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1593,608,16,17.45,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1594,608,31,12.50,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1595,608,56,38.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1596,608,65,21.05,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1597,609,2,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1598,609,42,14.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1599,610,3,10.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1600,610,26,31.23,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1601,610,29,123.79,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1602,611,7,30.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1603,611,27,43.90,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1604,611,70,15.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1605,612,24,4.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1606,612,54,7.45,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1607,612,64,33.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1608,613,51,53.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1609,613,76,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1610,614,17,39.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1611,614,18,62.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1612,614,21,10.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1613,614,33,2.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1614,614,62,49.30,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1615,615,11,21.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1616,615,52,7.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1617,616,1,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1618,616,58,13.25,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1619,617,35,18.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1620,617,67,14.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1621,618,38,263.50,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1622,618,39,18.00,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1623,619,2,19.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1624,619,24,4.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1625,619,30,25.89,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1626,620,53,32.80,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1627,621,26,31.23,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1628,621,35,18.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1629,621,49,20.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1630,622,1,18.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1631,622,11,21.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1632,622,23,9.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1633,622,68,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1634,623,35,18.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1635,623,51,53.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1636,624,6,25.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1637,624,16,17.45,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1638,624,17,39.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1639,625,55,24.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1640,625,62,49.30,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1641,625,64,33.25,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1642,625,65,21.05,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1643,626,21,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1644,626,28,45.60,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1645,627,10,31.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1646,628,19,9.20,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1647,628,47,9.50,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1648,628,49,20.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1649,629,46,12.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1650,629,64,33.25,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1651,630,16,17.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1652,630,18,62.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1653,631,20,81.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1654,632,40,18.40,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1655,632,65,21.05,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1656,632,76,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1657,633,23,9.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1658,633,61,28.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1659,633,70,15.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1660,634,73,15.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1661,635,42,14.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1662,635,49,20.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1663,635,54,7.45,32)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1664,636,24,4.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1665,637,21,10.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1666,637,56,38.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1667,637,65,21.05,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1668,638,2,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1669,638,24,4.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1670,638,70,15.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1671,638,77,13.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1672,639,10,31.00,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1673,639,31,12.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1674,639,77,13.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1675,640,25,14.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1676,641,2,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1677,641,68,12.50,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1678,642,11,21.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1679,642,38,263.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1680,643,17,39.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1681,643,34,14.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1682,643,41,9.65,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1683,644,30,25.89,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1684,645,59,55.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1685,646,8,40.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1686,646,24,4.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1687,646,29,123.79,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1688,646,30,25.89,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1689,646,36,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1690,647,13,6.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1691,647,69,36.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1692,647,75,7.75,120)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1693,648,24,4.50,110)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1694,648,39,18.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1695,648,40,18.40,91)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1696,648,60,34.00,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1697,649,45,9.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1698,649,56,38.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1699,650,29,123.79,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1700,650,30,25.89,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1701,651,13,6.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1702,652,39,18.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1703,653,70,15.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1704,654,41,9.65,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1705,654,71,21.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1706,655,55,24.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1707,655,62,49.30,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1708,656,13,6.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1709,656,65,21.05,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1710,656,68,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1711,657,58,13.25,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1712,657,62,49.30,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1713,658,1,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1714,659,61,28.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1715,660,75,7.75,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1716,661,7,30.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1717,661,52,7.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1718,662,7,30.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1719,662,16,17.45,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1720,662,41,9.65,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1721,663,19,9.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1722,663,49,20.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1723,663,61,28.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1724,664,1,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1725,664,17,39.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1726,664,67,14.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1727,665,11,21.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1728,665,29,123.79,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1729,666,4,22.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1730,666,33,2.50,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1731,666,58,13.25,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1732,667,71,21.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1733,668,17,39.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1734,668,33,2.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1735,668,54,7.45,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1736,669,16,17.45,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1737,669,32,32.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1738,669,57,19.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1739,670,30,25.89,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1740,670,60,34.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1741,671,1,18.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1742,671,60,34.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1743,672,16,17.45,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1744,672,25,14.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1745,672,40,18.40,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1746,673,50,16.25,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1747,674,35,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1748,674,63,43.90,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1749,675,17,39.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1750,675,24,4.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1751,676,42,14.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1752,676,43,46.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1753,676,67,14.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1754,677,10,31.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1755,677,28,45.60,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1756,677,75,7.75,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1757,678,36,19.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1758,678,52,7.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1759,679,11,21.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1760,679,13,6.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1761,679,19,9.20,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1762,679,72,34.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1763,680,20,81.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1764,680,52,7.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1765,680,76,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1766,681,47,9.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1767,681,76,18.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1768,682,21,10.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1769,682,75,7.75,49)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1770,682,77,13.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1771,683,21,10.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1772,683,27,43.90,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1773,683,55,24.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1774,683,58,13.25,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1775,684,13,6.00,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1776,684,57,19.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1777,685,16,17.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1778,685,62,49.30,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1779,685,72,34.80,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1780,685,75,7.75,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1781,686,53,32.80,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1782,686,61,28.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1783,687,6,25.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1784,688,1,18.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1785,688,18,62.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1786,688,23,9.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1787,689,36,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1788,690,28,45.60,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1789,690,34,14.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1790,691,13,6.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1791,691,43,46.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1792,691,60,34.00,49)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1793,691,71,21.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1794,692,2,19.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1795,692,67,14.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1796,693,7,30.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1797,693,13,6.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1798,694,31,12.50,44)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1799,694,62,49.30,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1800,694,68,12.50,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1801,694,72,34.80,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1802,695,49,20.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1803,696,13,6.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1804,696,22,21.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1805,696,46,12.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1806,697,11,21.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1807,697,44,19.45,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1808,697,56,38.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1809,698,13,6.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1810,698,31,12.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1811,699,10,31.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1812,699,24,4.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1813,699,77,13.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1814,700,59,55.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1815,701,50,16.25,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1816,701,51,53.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1817,701,55,24.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1818,702,6,25.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1819,702,10,31.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1820,702,17,39.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1821,702,62,49.30,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1822,703,4,22.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1823,704,33,2.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1824,704,41,9.65,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1825,704,75,7.75,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1826,705,6,25.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1827,705,28,45.60,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1828,706,20,81.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1829,706,31,12.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1830,707,16,17.45,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1831,707,31,12.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1832,707,45,9.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1833,707,60,34.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1834,708,75,7.75,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1835,709,21,10.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1836,709,47,9.50,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1837,709,51,53.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1838,710,30,25.89,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1839,710,35,18.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1840,710,64,33.25,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1841,711,5,21.35,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1842,711,7,30.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1843,711,72,34.80,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1844,712,75,7.75,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1845,713,24,4.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1846,713,41,9.65,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1847,714,52,7.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1848,714,76,18.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1849,715,7,30.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1850,715,13,6.00,77)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1851,715,53,32.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1852,715,69,36.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1853,715,76,18.00,44)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1854,716,60,34.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1855,717,18,62.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1856,717,38,263.50,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1857,717,69,36.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1858,718,51,53.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1859,719,37,26.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1860,719,56,38.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1861,719,62,49.30,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1862,720,19,9.20,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1863,720,49,20.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1864,721,12,38.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1865,721,24,4.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1866,721,64,33.25,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1867,722,46,12.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1868,723,52,7.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1869,724,29,123.79,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1870,725,17,39.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1871,725,33,2.50,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1872,726,26,31.23,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1873,726,41,9.65,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1874,726,75,7.75,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1875,727,63,43.90,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1876,728,8,40.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1877,728,75,7.75,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1878,729,28,45.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1879,730,39,18.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1880,730,47,9.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1881,730,51,53.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1882,730,63,43.90,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1883,731,8,40.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1884,731,21,10.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1885,731,40,18.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1886,731,44,19.45,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1887,732,7,30.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1888,732,12,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1889,732,24,4.50,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1890,732,27,43.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1891,732,31,12.50,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1892,732,63,43.90,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1893,733,75,7.75,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1894,734,38,263.50,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1895,735,7,30.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1896,735,43,46.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1897,736,13,6.00,84)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1898,736,57,19.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1899,737,16,17.45,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1900,737,24,4.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1901,737,36,19.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1902,738,16,17.45,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1903,738,18,62.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1904,738,32,32.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1905,739,11,21.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1906,739,20,81.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1907,739,76,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1908,739,77,13.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1909,740,7,30.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1910,740,43,46.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1911,740,72,34.80,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1912,741,7,30.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1913,741,62,49.30,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1914,742,6,25.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1915,742,11,21.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1916,742,41,9.65,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1917,743,21,10.00,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1918,743,34,14.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1919,743,55,24.00,65)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1920,743,61,28.50,66)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1921,744,2,19.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1922,744,70,15.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1923,744,76,18.00,90)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1924,745,72,34.80,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1925,746,29,123.79,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1926,746,41,9.65,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1927,747,59,55.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1928,748,51,53.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1929,748,60,34.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1930,749,42,14.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1931,750,32,32.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1932,750,46,12.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1933,750,52,7.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1934,751,24,4.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1935,751,61,28.50,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1936,751,74,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1937,751,75,7.75,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1938,752,41,9.65,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1939,752,51,53.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1940,752,77,13.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1941,753,4,22.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1942,753,24,4.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1943,753,77,13.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1944,754,7,30.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1945,754,22,21.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1946,754,46,12.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1947,754,55,24.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1948,755,13,6.00,56)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1949,755,35,18.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1950,755,42,14.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1951,755,55,24.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1952,756,1,18.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1953,756,40,18.40,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1954,756,52,7.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1955,757,26,31.23,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1956,757,76,18.00,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1957,758,1,18.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1958,758,59,55.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1959,759,1,18.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1960,759,29,123.79,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1961,760,8,40.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1962,760,29,123.79,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1963,760,42,14.00,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1964,761,28,45.60,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1965,761,34,14.00,90)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1966,761,71,21.50,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1967,762,24,4.50,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1968,762,36,19.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1969,762,60,34.00,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1970,763,7,30.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1971,763,24,4.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1972,764,58,13.25,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1973,764,71,21.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1974,765,19,9.20,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1975,765,60,34.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1976,765,71,21.50,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1977,766,23,9.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1978,766,42,14.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1979,766,45,9.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1980,766,68,12.50,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1981,767,41,9.65,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1982,768,30,25.89,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1983,768,77,13.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1984,769,31,12.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1985,769,36,19.00,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1986,770,3,10.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1987,770,59,55.00,110)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1988,770,70,15.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1989,771,12,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1990,771,18,62.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1991,771,56,38.00,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1992,772,46,12.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1993,772,49,20.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1994,773,10,31.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1995,774,2,19.00,11)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1996,774,20,81.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1997,774,26,31.23,63)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1998,774,51,53.00,44)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(1999,774,72,34.80,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2000,775,19,9.20,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2001,775,69,36.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2002,776,7,30.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2003,776,43,46.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2004,777,26,31.23,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2005,777,33,2.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2006,777,65,21.05,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2007,777,71,21.50,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2008,778,1,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2009,778,13,6.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2010,779,18,62.50,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2011,779,51,53.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2012,780,24,4.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2013,780,62,49.30,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2014,781,55,24.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2015,781,59,55.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2016,782,56,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2017,782,63,43.90,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2018,783,2,19.00,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2019,783,5,21.35,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2020,783,29,123.79,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2021,783,59,55.00,100)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2022,784,1,18.00,45)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2023,784,13,6.00,80)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2024,784,24,4.50,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2025,784,64,33.25,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2026,784,71,21.50,16)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2027,785,36,19.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2028,785,38,263.50,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2029,785,59,55.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2030,786,53,32.80,70)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2031,786,69,36.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2032,787,21,10.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2033,787,44,19.45,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2034,787,61,28.50,6)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2035,788,1,18.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2036,788,35,18.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2037,788,42,14.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2038,788,54,7.45,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2039,789,13,6.00,7)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2040,789,59,55.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2041,790,70,15.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2042,791,40,18.40,5)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2043,791,52,7.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2044,791,71,21.50,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2045,792,28,45.60,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2046,792,35,18.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2047,792,49,20.00,60)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2048,792,57,19.50,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2049,793,21,10.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2050,794,2,19.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2051,794,63,43.90,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2052,795,44,19.45,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2053,795,61,28.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2054,796,11,21.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2055,797,62,49.30,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2056,798,33,2.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2057,798,51,53.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2058,799,12,38.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2059,799,32,32.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2060,799,35,18.00,18)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2061,800,1,18.00,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2062,800,5,21.35,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2063,801,68,12.50,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2064,802,2,19.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2065,802,12,38.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2066,803,76,18.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2067,804,24,4.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2068,805,43,46.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2069,805,61,28.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2070,806,18,62.50,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2071,806,32,32.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2072,806,64,33.25,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2073,807,33,2.50,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2074,807,67,14.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2075,808,24,4.50,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2076,808,25,14.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2077,808,51,53.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2078,808,57,19.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2079,809,7,30.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2080,809,55,24.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2081,809,60,34.00,50)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2082,810,70,15.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2083,811,21,10.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2084,811,60,34.00,21)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2085,811,61,28.50,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2086,812,13,6.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2087,812,17,39.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2088,812,60,34.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2089,813,60,34.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2090,813,77,13.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2091,814,60,34.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2092,815,53,32.80,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2093,815,70,15.00,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2094,816,34,14.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2095,816,40,18.40,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2096,816,41,9.65,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2097,817,17,39.00,77)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2098,817,41,9.65,12)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2099,817,53,32.80,25)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2100,817,55,24.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2101,817,68,12.50,55)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2102,818,30,25.89,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2103,818,54,7.45,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2104,819,16,17.45,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2105,819,19,9.20,42)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2106,819,34,14.00,35)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2107,820,41,9.65,9)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2108,821,28,45.60,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2109,821,43,46.00,36)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2110,821,77,13.00,28)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2111,822,39,18.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2112,823,1,18.00,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2113,823,2,19.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2114,823,16,17.45,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2115,823,31,12.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2116,824,7,30.00,15)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2117,824,13,6.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2118,825,2,19.00,8)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2119,825,41,9.65,40)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2120,825,50,16.25,22)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2121,825,64,33.25,130)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2122,826,11,21.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2123,826,24,4.50,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2124,827,16,17.45,14)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2125,828,2,19.00,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2126,828,46,12.00,30)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2127,828,76,18.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2128,829,6,25.00,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2129,829,14,23.25,20)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2130,829,19,9.20,10)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2131,830,2,19.00,24)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2132,830,3,10.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2133,830,4,22.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2134,830,6,25.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2135,830,7,30.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2136,830,8,40.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2137,830,10,31.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2138,830,12,38.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2139,830,13,6.00,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2140,830,14,23.25,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2141,830,16,17.45,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2142,830,20,81.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2143,830,23,9.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2144,830,32,32.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2145,830,39,18.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2146,830,41,9.65,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2147,830,46,12.00,3)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2148,830,52,7.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2149,830,55,24.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2150,830,60,34.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2151,830,64,33.25,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2152,830,66,17.00,1)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2153,830,73,15.00,2)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2154,830,75,7.75,4)
;
INSERT INTO OrderItem (Id,OrderId,ProductId,UnitPrice,Quantity)VALUES(2155,830,77,13.00,2)
;