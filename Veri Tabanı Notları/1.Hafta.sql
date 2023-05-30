
select * -- neleri seçilecek
from Kategoriler -- hangi tablodan

select KategoriID, KategoriAdi, Tanimi
from Kategoriler


-- Seafood kategorisindeki ürünleri getirme
select * 
from Urunler 
where KategoriID = 8

-- tek satır kod
/*
Çoklu Satır Kod
*/

-- Id, UnvanEki Adi Soyadi
select PersonelID, UnvanEki+Adi+' '+SoyAdi as AdSoyad,Unvan
from Personeller


/*
a > b -> A büyüktür B
a < b -> B büyüktür A
a <= b -> A Büyük eşittir B
a >= b -> A Büyük eşittir B
a != b -> A B'ye eşit Değilse
*/

-- Nakliye ücreti

Select * 
from Satislar
where NakliyeUcreti <10

-- Nakliye ücreti 10 Lira altında ve Sevk Ülkesi USA olan satışlar 

select * 
from Satislar
where NakliyeUcreti <10 and SevkUlkesi = 'USA'

--Dipnot: SQL 'de metinsel ifadeler tek tırnak içerisinde yazılır.	

-- Satışlardaki Brazil, USA ve France sevkiyatları göster

select * 
from Satislar
where SevkUlkesi = 'Brazil' 
OR SevkUlkesi = 'USA' 
OR SevkUlkesi= 'France'

-- in ile yapımı

select * 
from Satislar
where SevkUlkesi in ('USA' , 'Brazil' , 'France')

--Satışlardaki Brazil, USA , France Sevkiyatları hariç diğer bütün sevkiyat hangileridir.

select *
from Satislar
where SevkUlkesi !='USA' and SevkUlkesi !='Brazil' and SevkUlkesi !='France'

--not in
select * 
from Satislar
where SevkUlkesi not in ('USA', 'Brazil', 'France')

--like komutu
-- Müşteri Adı T ile başlayanları

select *
from Musteriler
where MusteriAdi like 'T%'

-- Müşteri Adı T ile bitenler
select *
from Musteriler
where MusteriAdi like '%T'

--Müşteri adı T ile başlamayanlar
select * 
from Musteriler
where MusteriAdi not like 'T%'

-- Müşteri adı içerisinde et olan getirenler
select *
from Musteriler
where MusteriAdi like '%et%' 

--Müşteri adı içerisinde et olan ve or olmayan
select *
from Musteriler
where MusteriAdi like '%et%' and MusteriAdi not like '%ro%'

-- P ile başlayan r ve daha nk ve sonunda n ile bitenleri getirin.

select *
from Musteriler
where MusteriAdi like 'P%r%nk%n'

--1996-1997 arasındaki satışlar

select * 
from Satislar
where SatisTarihi > '1996-01-01' and SatisTarihi < '1996-12-31'

--between
select * 
from Satislar
where SatisTarihi between '1996-01-01' and '1996-12-31' 

/*
Toplam Satış Adedi ?
Max Nakliye Ücreti 
Min NakLiye Ücreti
Toplam Nakliye Ücreti
*/

-- Count -> Adedi
-- Max -> Maksimum Değeri
-- Min -> Minimum Değeri
-- Sum -> Değerleri toplayarak toplam değeri verir

select COUNT(*) as SatışAdedi, 
MAX(NakliyeUcreti) as MaksNakliyeUcreti, 
MIN(NakliyeUcreti) as MinNakliyeUcreti, 
SUM(NakliyeUcreti) as ToplamBakliyeUcreti 
from Satislar

/*
	1- 1996 ve 1997 arasında min,max ve toplam nakliye ücretleri
	2- 1997 ve 1998 arasında min,max ve toplam nakliye ücretleri
*/

select MIN(NakliyeUcreti)as MinNakliyeÜcreti,
MAX(NakliyeUcreti)as MaksNakliyeÜcreti,
SUM(NakliyeUcreti) as ToplamNakliyeÜCreti 
from Satislar where SatisTarihi between '1996-01-01' and '1997-12-31'