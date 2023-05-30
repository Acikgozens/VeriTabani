
select *  -- neleri seçilecek
from Kategoriler -- hangi tablodan

select KategoriID,KategoriAdi,Tanimi 
from Kategoriler

-- Seafood kategorisindeki ürünleri getirme
select * 
from Urunler
where KategoriID = 8


-- tek satır kod
/*
Çoklu satır kod
*/

-- Id ,UnvanEki Adi Soyadi , Unvani
select PersonelID,UnvanEki+Adi+' '+SoyAdi  as AdSoyad,Unvan
from Personeller

/*

a > b  -> A büyüktür B
a < b - > B büyüktür A
a <= b  -> B Büyük eşit A
a >= b  -> A büyük eşittir B

a != b -> A B'ye eşit değilse


*/

-- Nakliye ücreti 10 lira altında olan satışlar
select *
from Satislar
Where NakliyeUcreti <10


--Nakliye ücreti 10 lira altında ve  Sevk Ülkesi USA olan satışlar hangileridir ?
select *
from Satislar
Where NakliyeUcreti <10 and SevkUlkesi ='USA'

--Dipnot: SQL 'de metinsel ifadeler tek tırnak içerisinde yazılır.

-- Satislardaki Brazil, USA ve France sevkiyatları göster

select *
from Satislar
where SevkUlkesi = 'USA' 
OR SevkUlkesi = 'Brazil'
OR SevkUlkesi = 'France'
-- in ile yapımı
select *
from Satislar
where SevkUlkesi in ( 'USA' ,'Brazil', 'France')


---- Satislardaki Brazil, USA ve France sevkiyatları  hariç diğer bütün sevkilat hangileridir ?

select *
from Satislar
where SevkUlkesi !='USA' and SevkUlkesi !='Brazil' and SevkUlkesi  != 'France'

-- not in
select *
from Satislar
where SevkUlkesi not in ( 'USA' ,'Brazil', 'France')



-- like komutu
-- Müşteri Adi T ile başlayanları

select *
from Musteriler
where MusteriAdi like 'T%'

-- Müşteri Adi T ile bitenler
select *
from Musteriler
where MusteriAdi like '%T'

-- Müşteri Adi T ile başlamayanlar
select *
from Musteriler
where MusteriAdi not like 'T%'


-- Müşteri Adi içerisinde et olan getirenler
select *
from Musteriler
where MusteriAdi like '%et%'

-- Müşteri Adi içerisinde et olan ve ro olmayan
select *
from Musteriler
where MusteriAdi like '%et%' and MusteriAdi not like '%ro%'

-- P ile başyaan daha  r  ve daha nk  ve sonunda n ile bitenleri getirin

select *
from Musteriler
where MusteriAdi like 'P%r%nk%n'

-- between

-- 1996 -1997 arasındaki satışlar

select * 
from Satislar
where SatisTarihi >= '1996-01-01' and SatisTarihi <= '1996-12-31'

-- between
select * 
from Satislar
where SatisTarihi between '1996-01-01' and  '1996-12-31'


/*

Toplam Satış Adedi ?
Max Nakliye Ücreti
Min Nakliye Ücreti
Toplam Nakliye Ücreti
*/

-- Count -> Adedi
-- Max -> Maksimum Değeri
-- Min --> Minimum Değeri veri
-- Sum -> Değerleri toplayarak toplam değeri verir
select COUNT(*) as SatışAdedi, 
MAX(NakliyeUcreti) as MaksNakliyeUcreti,
MIN(NakliyeUcreti) as MinNakliyeUcreti, 
SUM(NakliyeUcreti) as ToplamNakliyeUcreti
from Satislar


/*
	1- 1996 ve 1997 arasında min,max ve toplam Nakliye Ücretleri
	2- 1997  ve 1998  arasında min,max ve toplam Nakliye Ücretleri
*/

