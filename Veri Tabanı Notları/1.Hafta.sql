
select * -- neleri se�ilecek
from Kategoriler -- hangi tablodan

select KategoriID, KategoriAdi, Tanimi
from Kategoriler


-- Seafood kategorisindeki �r�nleri getirme
select * 
from Urunler 
where KategoriID = 8

-- tek sat�r kod
/*
�oklu Sat�r Kod
*/

-- Id, UnvanEki Adi Soyadi
select PersonelID, UnvanEki+Adi+' '+SoyAdi as AdSoyad,Unvan
from Personeller


/*
a > b -> A b�y�kt�r B
a < b -> B b�y�kt�r A
a <= b -> A B�y�k e�ittir B
a >= b -> A B�y�k e�ittir B
a != b -> A B'ye e�it De�ilse
*/

-- Nakliye �creti

Select * 
from Satislar
where NakliyeUcreti <10

-- Nakliye �creti 10 Lira alt�nda ve Sevk �lkesi USA olan sat��lar 

select * 
from Satislar
where NakliyeUcreti <10 and SevkUlkesi = 'USA'

--Dipnot: SQL 'de metinsel ifadeler tek t�rnak i�erisinde yaz�l�r.	

-- Sat��lardaki Brazil, USA ve France sevkiyatlar� g�ster

select * 
from Satislar
where SevkUlkesi = 'Brazil' 
OR SevkUlkesi = 'USA' 
OR SevkUlkesi= 'France'

-- in ile yap�m�

select * 
from Satislar
where SevkUlkesi in ('USA' , 'Brazil' , 'France')

--Sat��lardaki Brazil, USA , France Sevkiyatlar� hari� di�er b�t�n sevkiyat hangileridir.

select *
from Satislar
where SevkUlkesi !='USA' and SevkUlkesi !='Brazil' and SevkUlkesi !='France'

--not in
select * 
from Satislar
where SevkUlkesi not in ('USA', 'Brazil', 'France')

--like komutu
-- M��teri Ad� T ile ba�layanlar�

select *
from Musteriler
where MusteriAdi like 'T%'

-- M��teri Ad� T ile bitenler
select *
from Musteriler
where MusteriAdi like '%T'

--M��teri ad� T ile ba�lamayanlar
select * 
from Musteriler
where MusteriAdi not like 'T%'

-- M��teri ad� i�erisinde et olan getirenler
select *
from Musteriler
where MusteriAdi like '%et%' 

--M��teri ad� i�erisinde et olan ve or olmayan
select *
from Musteriler
where MusteriAdi like '%et%' and MusteriAdi not like '%ro%'

-- P ile ba�layan r ve daha nk ve sonunda n ile bitenleri getirin.

select *
from Musteriler
where MusteriAdi like 'P%r%nk%n'

--1996-1997 aras�ndaki sat��lar

select * 
from Satislar
where SatisTarihi > '1996-01-01' and SatisTarihi < '1996-12-31'

--between
select * 
from Satislar
where SatisTarihi between '1996-01-01' and '1996-12-31' 

/*
Toplam Sat�� Adedi ?
Max Nakliye �creti 
Min NakLiye �creti
Toplam Nakliye �creti
*/

-- Count -> Adedi
-- Max -> Maksimum De�eri
-- Min -> Minimum De�eri
-- Sum -> De�erleri toplayarak toplam de�eri verir

select COUNT(*) as Sat��Adedi, 
MAX(NakliyeUcreti) as MaksNakliyeUcreti, 
MIN(NakliyeUcreti) as MinNakliyeUcreti, 
SUM(NakliyeUcreti) as ToplamBakliyeUcreti 
from Satislar

/*
	1- 1996 ve 1997 aras�nda min,max ve toplam nakliye �cretleri
	2- 1997 ve 1998 aras�nda min,max ve toplam nakliye �cretleri
*/

select MIN(NakliyeUcreti)as MinNakliye�creti,
MAX(NakliyeUcreti)as MaksNakliye�creti,
SUM(NakliyeUcreti) as ToplamNakliye�Creti 
from Satislar where SatisTarihi between '1996-01-01' and '1997-12-31'