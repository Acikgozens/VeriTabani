/*
		1. SubQuery - AltSorgu yöntemi
		2. Where clause (En yaygın kullananlardan )
		3. Join ler ile

*/
-- Seafood kategorisinde ürünler hangisidir?



select * 
from Urunler 
where KategoriID in (select KategoriID
						from Kategoriler
						where KategoriAdi = 'Seafood')


-- seafood kategorisindeki tedaricikerim hangileridir






select *
from Tedarikciler
where TedarikciID in (select TedarikciID
						from Urunler
						where KategoriID in (select KategoriID
											from Kategoriler
											where KategoriAdi ='Seafood'))

-- Tokyo Traders tedarik ettiği ürünler hangileridir ?



select *
from Urunler
where TedarikciID in (select TedarikciID 
						from Tedarikciler
						where SirketAdi = 'Tokyo Traders')

/*
	2.Where clasu işlem yapalım
*/

--  -- seafod kategorisindeki ürünleri ve tedarikciler kimlerdir
--- Urun Adi, KAtegori Adi ve Tedarikci Adi

select Urunler.UrunAdi, Kategoriler.KategoriAdi, Tedarikciler.SirketAdi
from Urunler,Kategoriler,Tedarikciler
where Urunler.KategoriID = Kategoriler.KategoriID
and Urunler.TedarikciID = Tedarikciler.TedarikciID



 --Seafood ürünleri tedarik eden tedarikçiler

 select Urunler.UrunAdi, Kategoriler.KategoriAdi, Tedarikciler.SirketAdi
from Urunler,Kategoriler,Tedarikciler
where Urunler.KategoriID = Kategoriler.KategoriID
and Urunler.TedarikciID = Tedarikciler.TedarikciID
and Kategoriler.KategoriAdi ='Seafood'



--Eastern bölgesinde çalışan personeller

select distinct Personeller.Adi, Personeller.SoyAdi,Bolge.BolgeTanimi, Bolgeler.TerritoryTanimi
	--	,Bolge.BolgeTanimi, Bolgeler.TerritoryTanimi
from Bolge, Bolgeler,PersonelBolgeler,Personeller
where Bolge.BolgeID = Bolgeler.BolgeID
and Bolgeler.TerritoryID = PersonelBolgeler.TerritoryID
and PersonelBolgeler.PersonelID = Personeller.PersonelID
and Bolge.BolgeTanimi ='Eastern'



 -- Urun Adi , Musteri Adi, Personel Adi, Satis Tarihi, Nakliye Ücreti, Nakliye Şirket Adi

 select ur.UrunAdi,mu.MusteriAdi,po.Adi+' ' + po.SoyAdi as Personel, 
		sa.SatisTarihi,sa.NakliyeUcreti,na.SirketAdi
 from Urunler ur,Musteriler mu,Personeller po ,
		Satislar sa,Nakliyeciler na, [Satis Detaylari] sd
 where sa.MusteriID = mu.MusteriID
 and sa.PersonelID = po.PersonelID
 and sa.SatisID = sd.SatisID
 and sd.UrunID = ur.UrunID
 and na.NakliyeciID = sa.ShipVia
