/* Purpose: Insert Data John Abbott Library Database.
Script Date: April 3rd ,2019
Developped by Matthew, Sergei, Levar, Tony
 */

 use JAClib
 ;
 go

 /************** NO.1 Table Members **************************************/
 INSERT INTO customer.Members(MemberID,FirstName,LastName) VALUES
  (1,'Josy','Vardie')
 ,(2,'Keenan','Lunk')
 ,(3,'Kaiser','Stert')
 ,(4,'Florence','Zannuto')
 ,(5,'Harris','Braybrook')
 ,(6,'Kyrstin','Kensitt')
 ,(7,'Alisun','Duesberry')
 ,(8,'Lianna','Manifold')
 ,(9,'Stephannie','Jerred')
 ,(10,'Jobey','Isham')
 ,(11,'Daphne','Avye')
,(12,'Nola','Isabella')
,(13,'Rajah','Scarlett')
,(14,'Gavin','George')
,(15,'Nash','Leo')
,(16,'Mechelle','Callum')
,(17,'Garrison','Lamar')
,(18,'Willa','Mechelle')
,(19,'Sydnee','Dora')
,(20,'Eaton','Tatyana')
 ,(21,'Briar','Howard');
go

 /************** NO.2 Table Students **************************************/
 INSERT INTO customer.Students(StudentID,MemberID,StudentNumber,Address,City,Province,PostalCode,ExpirationDate,Phone) VALUES
 (1,1,1607102540599,'4908 Aenean Ave','Montreal','Qc','V6E 5T8','Aug 19, 2019','555-1234')
,(2,2,1697100532599,'P.O. Box 400, 9566 Leo, Avenue','Hull','Qc','P6A 5J4','Sep 15, 2018','582-3245')
,(3,3,1619062561699,'Ap #159-1551 Tempus Avenue','Montreal','Qc','A8A 4B0','Nov 26, 2018','342 1276')
,(4,4,1635122488699,'Ap #540-3786 Ut Road','Montreal','Qc','V1N 3N9','Mar 7, 2020','564-3215')
,(5,5,1681110260699,'P.O. Box 632, 3732 Facilisis Rd.','Montreal','Qc','N6S 5B4','Jan 24, 2019','765-1234')
,(6,6,1603041210899,'P.O. Box 591, 796 Risus. Rd.','Pierrefonds','Qc','V0R 1E8','Oct 17, 2019','987-1234')
,(7,7,1632102891899,'3354 Fringilla. St.','Laval','Qc','M9E 9T6','Dec 30, 2019','456-2345')
,(8,8,1682100910099,'P.O. Box 872, 5082 Dolor. Rd.','Montreal','Qc','J0R 4N2','Mar 30, 2019','435-6543')
,(9,9,1692031113299,'Ap #236-5621 Conubia Avenue','Gatineau','Qc','V1B 5Z5','Jun 19, 2018','345-2367')
,(10,10,1664031043999,'P.O. Box 677, 7850 Dictum Street','Montreal','Qc','P4E 0S2','Oct 22, 2018','987-2365');
go

/************** NO.3 Table Faculty **************************************/
INSERT INTO customer.Faculty(FacultyID,MemberID,Address,City,Province,PostalCode,ExpirationDate,Phone) VALUES
 (1,11,'Ap #686-3894 Erat Street','Outremont','Qc','K8L 2S5','Oct 5, 2018','555-3245')
,(2,12,'Ap #551-8267 Sed Av.','Montreal','Qc','M8M 0W6','Jan 21, 2019','434-7689')
,(3,13,'190-3864 Pede Street','Westmount','Qc','L0T 8V7','Jun 27, 2019','765-3456')
,(4,14,'Ap #284-7318 Sed Rd.','Montreal','Qc','V8M 1J3','May 1, 2019','876-9876')
,(5,15,'Ap #811-6252 At Rd.','Sherbrooke','Qc','J3W 8Y8','Jul 13, 2018','213-4354')
,(6,16,'P.O. Box 542, 6256 Vitae Road','Mansfield-et-Pontefract','Qc','J3G 8R3','Apr 5, 2019','435-6578')
,(7,17,'Ap #584-5999 Nulla. Rd.','Pointe-Claire','Qc','S8Y 6V5','May 17, 2019','657-9988')
,(8,18,'Ap #357-8325 Nunc St.','Montreal','Qc','K4J 7B9','Feb 20, 2019','435-5444')
,(9,19,'P.O. Box 381, 3985 Felis Rd.','Anjou','Qc','P5H 7B9','Aug 10, 2019','767-8899')
,(10,20,'958-3470 Dolor Road','Montreal','Qc','L7G 8S9','Mar 20, 2019','515-3232')
,(11,21,'Ap #306-4269 Tellus Rd.','Montreal','Qc','M4T 7L9','Mar 21, 2019','878-4466');
go

  /************** NO.4 Table Author **************************************/
  INSERT INTO material.Authors(AuthorID,FirstName,LastName)
  VALUES
 (1,'Philip','Dick')
,(2,'Douglas','Adams')
,(3,'Ray','Bradbury')
,(4,'Harper','Lee')
,(5,'Ken','Kesey')
,(6,'Thomas','Harris')
,(7,'Max','Brooks')
,(8,'Robert','Jordan')
,(9,'JRR','Tolkien')
,(10,'Brandon','Sanderson')
,(11,'Isaac','Asimov')
,(12,'Arthur','Clarke')
,(13,'George','Orwell')
,(14,'John','Steinbeck')
,(15,'Kurt','Vonnegut')
,(16,'Ernest','Hemmingway')
,(17,'Stephen','King')
,(18,'Frank','Herbert')
,(19,'William','Gibson')
,(20,'Carl','Sagan');
go

   /************** NO.5 Table Publishers **************************************/
   INSERT INTO material.Publishers(PublisherID,PublisherName,City,Region,PostalCode,Phone)
   VALUES
 (1,'Consequat Consulting','Barrie','Ontario','P4M 5R5','(978) 533-5451')
,(2,'Nec Malesuada Ut Company','Thorold','Ontario','P2A 9C7','(921) 898-0796')
,(3,'Lorem Institute','Winnipeg','Manitoba','R9Y 3V9','(582) 460-6785')
,(4,'Ac Turpis Corp.','Russell','Ontario','P7B 2M8','(828) 312-9950')
,(5,'Odio Sagittis Consulting','Vegreville','Alberta','T9E 0R9','(900) 905-5972')
,(6,'Sollicitudin Orci Institute','Nakusp','British Columbia','V0N 6K6','(632) 967-1514')
,(7,'Dui Cras Foundation','Leamington','Ontario','M6C 7W5','(845) 811-7353')
,(8,'Vivamus Nisi Mauris Corp.','Ville de Maniwaki','Quebec','J7E 9Z4','(741) 885-0825')
,(9,'Et Magnis Dis Corporation','Newbury','Ontario','P0E 0Z0','(352) 135-1296')
,(10,'Montes Nascetur Consulting','Minto','Ontario','N1N 1P4','(688) 904-1245')
,(11,'Auctor Ullamcorper Consulting','Saint-Pierre','Quebec','J1N 4B8','(242) 424-0904')
,(12,'Et Company','Hope','British Columbia','V1H 0K6','(158) 753-2148')
,(13,'At Auctor Ltd','Labrecque','Quebec','G2J 7S7','(894) 233-0554')
,(14,'Suspendisse Ac Institute','Cobourg','Ontario','M3W 8J1','(285) 681-8818')
,(15,'Vel Foundation','Baie-Comeau','Quebec','H3Z 6B7','(423) 285-0489')
,(16,'Phasellus At Augue Incorporated','Bowden','Alberta','T1A 8V9','(889) 469-7697')
,(17,'Aliquet Proin Velit Ltd','Cornwall','Ontario','L7P 6A9','(585) 356-6915')
,(18,'Odio A Purus LLP','Welland','Ontario','M6B 5A3','(235) 725-6659')
,(19,'Aliquet Libero Integer Associates','Kawartha Lakes','Ontario','K3K 3T1','(771) 714-5858')
,(20,'Mauris Eu LLP','Qu�bec City','Quebec','J6E 3M9','(620) 612-3380');
go

   /************** NO.6 Table Titles **************************************/
   INSERT INTO material.Titles(TitleID,AuthorID,PublisherID,Title,Genre,Summary)
   VALUES
    (1,1,1,'Do Androids Dream of Electric Sheep?','Science Fiction','eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper')
   ,(2,2,2,'The Hitchhikers Guide to the Galaxy','Science Fiction','eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper')
   ,(3,3,3,'Fahrenheit 451','Science Fiction','eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper')
   ,(4,4,4,'To Kill a Mockingbird','Fiction','non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum')
   ,(5,5,5,'One Flew Over the Cuckoos Nest','Fiction','aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer')
   ,(6,6,6,'The Silence of the Lambs','Horror','quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna.')
   ,(7,7,7,'World War Z','Horror','nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.')
   ,(8,8,8,'Eye Of The World','Fantasy','Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,')
   ,(9,9,9,'The Fellowship of the Ring','Fantasy','a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem')
   ,(10,10,10,'The Way of Kings','Fantasy','pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum')
   ,(11,11,11,'Foundation','Science Fiction','id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis')
   ,(12,12,12,'2001: A Space Odyssey','Science Fiction','dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis')
   ,(13,13,13,'1984','Fiction','tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque.')
   ,(14,14,14,'The Grapes of Wrath','Fiction','lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet')
   ,(15,15,15,'Slaughterhouse-Five','Fiction','eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat')
   ,(16,16,16,'The Old Man and the Sea','Fiction','ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit')
   ,(17,17,17,'The Stand','Science Fiction','metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus')
   ,(18,18,18,'Dune','Science Fiction','Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam')
   ,(19,19,19,'Neuromancer','Cyberpunk','iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec')
   ,(20,20,20,'Contact','Science Fiction','congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat');
   go
   /************** NO.7 Table Item **************************************/
   INSERT INTO material.Items(ItemID,TitleID,PublisherID,Language,ISBN,Cover,Loanable) VALUES
    (1,1,1,'Azeri','277284667-9','http://dummyimage.com/205x203.bmp/ff4444/ffffff','false')
   ,(2,2,2,'Tetum','068412629-X','http://dummyimage.com/142x107.png/5fa2dd/ffffff','true')
   ,(3,3,3,'Hindi','380115460-2','http://dummyimage.com/202x233.jpg/cc0000/ffffff','false')
   ,(4,4,4,'M?ori','386948957-X','http://dummyimage.com/192x179.bmp/ff4444/ffffff','false')
   ,(5,5,5,'Luxembourgish','762287580-5','http://dummyimage.com/210x163.bmp/5fa2dd/ffffff','true')
   ,(6,6,6,'Kashmiri','093439269-2','http://dummyimage.com/196x114.bmp/cc0000/ffffff','true')
   ,(7,7,7,'Swati','717798318-X','http://dummyimage.com/240x245.jpg/cc0000/ffffff','false')
   ,(8,8,8,'Haitian Creole','383771869-7','http://dummyimage.com/133x160.png/dddddd/000000','true')
   ,(9,9,9,'Dutch','236368074-X','http://dummyimage.com/230x228.jpg/cc0000/ffffff','true')
   ,(10,10,10,'Japanese','117460044-6','http://dummyimage.com/160x171.bmp/cc0000/ffffff','true')
   ,(11,11,11,'Finnish','975097202-3','http://dummyimage.com/134x115.bmp/5fa2dd/ffffff','false')
   ,(12,12,12,'Hebrew','255558537-0','http://dummyimage.com/127x110.bmp/dddddd/000000','true')
   ,(13,13,13,'Kashmiri','219614197-6','http://dummyimage.com/155x191.bmp/ff4444/ffffff','true')
   ,(14,14,14,'Tswana','963381744-7','http://dummyimage.com/118x172.png/5fa2dd/ffffff','false')
   ,(15,15,15,'Lithuanian','275610172-9','http://dummyimage.com/132x145.jpg/dddddd/000000','true')
   ,(16,16,16,'Tswana','854999635-1','http://dummyimage.com/169x219.jpg/dddddd/000000','false')
   ,(17,17,17,'Irish Gaelic','229361362-3','http://dummyimage.com/177x221.bmp/cc0000/ffffff','true')
   ,(18,18,18,'Amharic','490229033-2','http://dummyimage.com/132x223.png/cc0000/ffffff','false')
   ,(19,19,19,'Azeri','739376089-4','http://dummyimage.com/118x203.png/5fa2dd/ffffff','true')
   ,(20,20,20,'Lao','349983757-9','http://dummyimage.com/144x118.jpg/ff4444/ffffff','true');
go
   /************** NO.8 Table Copies **************************************/
   INSERT INTO employee.Copies(CopyID,ItemID,TitleID,OnLoan) VALUES
    (1,1,1,'false')
   ,(2,2,2,'false')
   ,(3,3,3,'true')
   ,(4,4,4,'false')
   ,(5,5,5,'true')
   ,(6,6,6,'true')
   ,(7,7,7,'false')
   ,(8,8,8,'true')
   ,(9,9,9,'false')
   ,(10,10,10,'false')
   ,(11,11,11,'true')
   ,(12,12,12,'true')
   ,(13,13,13,'false')
   ,(14,14,14,'true')
   ,(15,15,15,'true')
   ,(16,16,16,'false')
   ,(17,17,17,'false')
   ,(18,18,18,'false')
   ,(19,19,19,'false')
   ,(20,20,20,'true');
   go
   /************** NO.9 Table Loans **************************************/
   INSERT INTO employee.Loans(CopyID,ItemID,TitleID,MemberID,OutDate,ReturnedDate,DueDate) VALUES
    (1,1,1,1,'2019-04-06 00:00:00','2018-07-05 02:07:47','2018-07-05 03:07:47')
   ,(2,2,2,2,'2019-04-06 00:00:00','2019-03-11 18:14:08','2019-03-11 22:14:08')
   ,(3,3,3,3,'2019-04-06 00:00:00','2019-01-16 13:21:58','2019-01-14 04:21:58')
   ,(4,4,4,4,'2019-04-06 00:00:00',NULL,'2018-05-23 20:26:42')
   ,(5,5,5,5,'2019-04-06 00:00:00',NULL,'2018-06-04 06:44:34')
   ,(6,6,6,6,'2019-04-06 00:00:00','2018-08-03 15:44:36','2018-08-03 17:44:36')
   ,(7,7,7,7,'2019-04-06 00:00:00','2018-08-25 14:14:25','2018-08-20 14:14:25')
   ,(8,8,8,8,'2019-04-06 00:00:00',NULL,'2018-07-25 04:50:36')
   ,(9,9,9,9,'2019-04-06 00:00:00',NULL,'2019-04-07 06:57:25')
   ,(10,10,10,10,'2019-04-06 00:00:00',NULL,'2018-05-21 12:32:49')
   ,(11,11,11,11,'2019-04-06 00:00:00',NULL,'2018-10-03 12:55:35')
   ,(12,12,12,12,'2019-04-06 00:00:00',NULL,'2019-03-26 15:30:58')
   ,(13,13,13,13,'2019-04-06 00:00:00','2018-12-07 15:15:04','2018-12-06 15:15:04')
   ,(14,14,14,14,'2019-04-06 00:00:00','2018-04-19 07:16:21','2018-04-19 08:16:21')
   ,(15,15,15,15,'2019-04-06 00:00:00',NULL,'2018-05-02 02:49:56')
   ,(16,16,16,16,'2019-04-06 00:00:00',NULL,'2018-07-05 17:51:27')
   ,(17,17,17,17,'2019-04-06 00:00:00',NULL,'2018-06-23 18:56:43')
   ,(18,18,18,18,'2019-04-06 00:00:00',NULL,'2018-10-20 19:53:20')
   ,(19,19,19,19,'2019-04-06 00:00:00',NULL,'2018-07-21 23:27:45')
   ,(20,20,20,20,'2019-04-06 00:00:00',NULL,'2018-10-18 23:45:35');
   go
   /************** NO.10 Table Reservations**************************************/
   INSERT INTO customer.Reservations(ItemID,MemberID,RDate,Notes) VALUES
    (1,1,'2019-04-24 04:02:42',NULL)
   ,(2,2,'2019-05-01 17:17:26','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis.')
   ,(3,3,'2019-04-30 10:44:59','Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.')
   ,(4,4,'2019-04-08 12:56:54','Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.')
   ,(5,5,'2019-05-08 16:55:36','Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.')
   ,(6,6,'2019-04-14 07:25:57','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.')
   ,(7,7,'2019-05-08 02:46:36','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.')
   ,(8,8,'2019-05-09 14:40:29','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.')
   ,(9,9,'2019-05-06 03:19:25',NULL)
   ,(10,10,'2019-04-22 11:40:09','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.')
   ,(11,11,'2019-04-29 05:32:05',NULL)
   ,(12,12,'2019-05-01 01:54:46','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. ')
   ,(13,13,'2019-05-09 16:04:10','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.')
   ,(14,14,'2019-05-13 12:09:11','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.')
   ,(15,15,'2019-05-15 13:40:46','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.')
   ,(16,16,'2019-04-26 01:57:58',NULL)
   ,(17,17,'2019-05-09 00:33:57','Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.')
   ,(18,18,'2019-05-03 20:09:57','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.')
   ,(19,19,'2019-04-29 01:18:53','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.')
   ,(20,20,'2019-05-04 18:24:02',NULL);
   go


/************** NO.11 Table LoanHistory **************************************/
INSERT INTO employee.LoanHistory(OutDate,ItemID,CopyID,TitleID,MemberID,DueDate,InTime,FineWaived,FinePaid,FineAssessed,Noted) VALUES
	('2019-05-15 02:42:35',3,3,3,3,'2019-05-21 15:57:30','2019-04-29 14:54:28','$5.95','$7.37','$9.66','Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.')
   ,('2019-04-08 12:31:41',4,4,4,4,'2019-05-15 01:14:12','2019-04-11 00:51:33','$5.05','$0.01','$7.40','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.')
   ,('2019-04-23 21:11:35',5,5,5,5,'2019-04-28 07:11:09','2019-04-19 05:46:44','$0.36','$5.91','$1.75','Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.')
   ,('2019-04-18 02:34:24',6,6,6,6,'2019-04-24 02:02:26','2019-04-26 03:33:58','$4.08','$4.50','$7.74','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.')
   ,('2019-04-29 03:52:45',8,8,8,8,'2019-04-30 04:12:40','2019-05-11 07:33:44','$8.08','$2.39','$8.56','Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.')
   ,('2019-04-09 21:28:30',10,10,10,10,'2019-05-13 07:22:53','2019-04-17 05:56:20','$3.05','$9.69','$9.57','Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.')
   ,('2019-05-15 21:18:21',11,11,11,11,'2019-04-24 01:20:27','2019-05-11 10:55:46','$5.05','$3.06','$2.56','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.')
   ,('2019-04-08 11:04:18',12,12,12,12,'2019-05-19 22:28:01','2019-04-29 18:25:52','$3.82','$0.02','$5.21','Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.')
   ,('2019-04-15 08:05:39',13,13,13,13,'2019-05-06 02:56:39','2019-04-20 01:16:55','$6.85','$3.49','$0.92','Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.')
   ,('2019-05-12 14:26:55',14,14,14,14,'2019-05-27 16:47:51','2019-04-26 17:17:21','$5.43','$2.87','$5.46','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.')
   ,('2019-04-10 10:12:05',15,15,15,15,'2019-04-16 13:58:46','2019-04-28 07:24:38','$4.62','$6.12','$9.95','Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.')
   ,('2019-04-20 03:25:16',20,20,20,20,'2019-04-27 00:58:45','2019-04-22 01:54:06','$1.67','$9.09','$8.19','Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.');
   go
