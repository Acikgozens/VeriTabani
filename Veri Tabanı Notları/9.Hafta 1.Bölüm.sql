/*
	View (Sanal Tablo) ?
	create, Drop ve alter gerekli işlemler
*/

Drop view V_UrunDetay

-- Personel Detay
select * from Bolge
select * from Bolgeler
select * from PersonelBolgeler
select * from Personeller

create view V_PersonelDetay
as
select Bolge.BolgeID,Bolge.BolgeTanimi,
Bolgeler.TerritoryID,Bolgeler.TerritoryTanimi,
Personeller.PersonelID,Personeller.Adi +' '+ Personeller.SoyAdi as PersonelAdSoyad
from Bolge, Bolgeler,PersonelBolgeler,Personeller
where Bolge.BolgeID = Bolgeler.BolgeID 
	and Bolgeler.TerritoryID = PersonelBolgeler.TerritoryID
	and PersonelBolgeler.PersonelID = Personeller.PersonelID

select * from V_PersonelDetay

-- ürün detay
select * from Urunler
select * from Kategoriler
select * from Tedarikciler

-- join ile birleştirelim
create view V_UrunDetay
as
select Kategoriler.KategoriID, Kategoriler.KategoriAdi,
		Tedarikciler.TedarikciID, Tedarikciler.SirketAdi,
		Urunler.UrunID,Urunler.UrunAdi,Urunler.BirimFiyati
from Urunler inner join Kategoriler on Urunler.KategoriID = Kategoriler.KategoriID
	inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID


select * from V_UrunDetay where BirimFiyati > 15

--Satis Detayi

select * from [Satis Detaylari]
select * from Satislar
select * from Musteriler

alter view V_SatisDetay
as
select Sd.SatisID,sd.BirimFiyati as SatisBirimFiyati, sd.Miktar,sd.İndirim,sd.UrunID as SatisUrunId,
		sl.SatisTarihi,sl.NakliyeUcreti,sl.SevkUlkesi,
		mu.MusteriID,mu.SirketAdi as MusteriSirketAdi, sl.PersonelID as SatisPersonelId
from [Satis Detaylari] sd inner join Satislar sl on sd.SatisID = sl.SatisID
	inner join Musteriler mu on sl.MusteriID = mu.MusteriID

select *
from V_SatisDetay


create view V_ButunBilgiler
as
select *
from V_PersonelDetay vp,V_SatisDetay vs,V_UrunDetay vu
where vp.PersonelID = vs.SatisPersonelId and vs.SatisUrunId = vu.UrunID


select * from V_ButunBilgiler

select *
from Bolge inner join Bolgeler on Bolge.BolgeID = Bolgeler.BolgeID
			inner join PersonelBolgeler on PersonelBolgeler.TerritoryID = Bolgeler.TerritoryID
			inner join Personeller on Personeller.PersonelID = PersonelBolgeler.PersonelID
			inner join Satislar on Satislar.PersonelID = Personeller.PersonelID
			inner join [Satis Detaylari] on [Satis Detaylari].SatisID = Satislar.SatisID
			inner join Musteriler on Musteriler.MusteriID = Satislar.MusteriID
			inner join Urunler on Urunler.UrunID = [Satis Detaylari].UrunID
			inner join Kategoriler on Kategoriler.KategoriID = Urunler.KategoriID
			inner join Tedarikciler on Tedarikciler.TedarikciID = Urunler.TedarikciID
