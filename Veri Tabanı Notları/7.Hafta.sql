 create database HR210027
 use HR210027

 /*
 create= yaratmak
 alter=Tablo güncellemek için
 drop= silmek

 */

 /*
 metinsel ifadeler
 char ->
 nchar ->
 varchar ->
 nvarchar ->
 */


create table tblOgrenci(
   Id int identity primary key,
   Adi nvarchar(50) not null,
   Soyadi nvarchar(50),
   Email varchar(100),
   OlusturmaTarihi datetime default getdate(),
   DogumTarihi date,
   Cinsiyet char(1) default 'B' ,-- cinsiyet E:Erkek, K:Kadýn,B:Belirtilmemiþ
   Durumu bit
   )

   -- Tablo güncellemesi için 
   alter table tblOgrenci add Numara char(8)
   
   --column güncelleme
    alter table [dbo].[tblOgrenci] alter column [Numara] char(8) not null ;

   --örnek öðrenci kaydý ekleme
   insert into tblOgrenci ([Adi],[Soyadi],[Email],[DogumTarihi],[Cinsiyet],[Durumu],Numara)
   values('Tuncay','Tanin','tuncay@gmail.com','2000-12-30','E',1,'H5')
   select*from tblOgrenci
   /*
   
   1-Ogrenci
   2-Ogretmen
   3-Dersler
   4-Ogrencinin Dersleri
   
   */
   create table tblOgretmen(
   Id int identity primary key,
   Adi nvarchar(50) not null,
   Soyadi nvarchar(50),
   Email varchar(100),
   OlusturmaTarihi datetime default getdate(),
   DogumTarihi date,
   Cinsiyet char(1) default 'B',
   Alani nvarchar(100),
   MedeniDurumu char(1) default 'Bekar',
   Durumu bit
   )
   create table tblDersler(
   Id int identity primary key,
   DersAdi char(20),
   DersKonusu nvarchar(100),
   Durumu bit
   )
   create table tblOgrencininDersleri(
   Id int identity primary key,
   OgretmenId int,
   OgrenciId int,
   DersId int,
   VizeNotu decimal(5,2) default 0,
   FinalNotu decimal(5,2) default 0,
   DonemSonu decimal(5,2) default 0,
   GecmeNotu char(2)
   )

