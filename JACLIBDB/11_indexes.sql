/* Purpose: indexes.
Script Date: April 10 ,2019
Developped by Matthew, Sergei, Levar, Tony
 */

 use JAClib
 ;
 go


-- nclix_language
create nonclustered index nclix_language on material.Items (language);
 go

-- nclix_City
create nonclustered index nclix_City on customer.Faculty (City);
 go

-- nclix_City_S
create nonclustered index nclix_City_S on customer.Students (City);
 go

-- nclix_Authors_FN
create nonclustered index nclix_Authors_FN on material.Authors (FirstName);
 go

-- nclix_Authors_LN
create nonclustered index nclix_Authors_LN on material.Authors (LastName);
 go

-- unclix_PublisherName
create Unique nonclustered index unclix_PublisherName on material.Publishers (PublisherName);
 go


-- nclix_Title
create nonclustered index nclix_Title on material.Titles (Title);
 go

-- nclix_Genre
create nonclustered index nclix_Genre on material.Titles (Genre);
 go


