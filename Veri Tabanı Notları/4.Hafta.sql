select*
from Urunler
where KategoriID = 8


select*
from urunler
where KategoriID in (select KategoriID
                          from Kategoriler
						  where KategoriAdi= 'Seafood')
--Seafood kategorisindeki tedarikcilerim hangileridir

Select*
from Tedarikciler
where TedarikciID in (select TedarikciID
                      from Urunler
                      where KategoriID in (select KategoriID
					                       from Kategoriler
										   where KategoriAdi = 'Seafood'))
--Tokyo Traders�n tedarik etti�i �r�nler hangileridir ?

select*
from Urunler 
where TedarikciID in (select TedarikciId
                      from Tedarikciler
                      where SirketAdi = 'Tokyo Traders')
--seafood kategorisindeki �r�nleri ve tedarik�iler kimdir ve onlar�n �r�n ad�,kategori adi,tedarik�i ad� 

select*
from Urunler,Kategoriler,Tedarikciler
where Urunler.KategoriID = Kategoriler.KategoriID
and Urunler.TedarikciID= Tedarikciler.TedarikciID
--Seafood �r�nlerini tedarik eden tedarik�iler

select*
from Urunler,Kategoriler,Tedarikciler
where Urunler.KategoriID = Kategoriler.KategoriID
and Urunler.TedarikciID= Tedarikciler.TedarikciID
and Kategoriler.KategoriAdi = 'Seafood'
--Eastern b�lgesinde �al��an personeller 

select distinct Personeller.Adi, Personeller.SoyAdi
-- ,bolge.bolgeTanimi,Bolgeler.TerritoryTanimi
from Bolge,Bolgeler,PersonelBolgeler,Personeller
where Bolge.BolgeID = Bolgeler.BolgeID
and Bolgeler.TerritoryID = PersonelBolgeler.TerritoryID
and PersonelBolgeler.PersonelID = Personeller.PersonelID
and Bolge.BolgeTanimi = 'Eastern'
--Urun Adi , Musteri Adi, Personel Adi,Sat�s Tarihi,Nakliye �creti,Nakliye Sirketini getiren sorgu
select ur.UrunAdi,mu.MusteriAdi,po.Adi+' ' +po.SoyAdi as Personel,sa.SatisTarihi,sa.NakliyeUcreti,na.SirketAdi
from Urunler ur ,Musteriler mu ,Personeller po,Satislar sa,Nakliyeciler na, [Satis Detaylari] sd
where sa.MusteriID = mu.MusteriID
and sa.PersonelID = po.PersonelID
and sa.SatisID = sd.SatisID
and sd.UrunID = ur.UrunID
and na.NakliyeciID = sa.ShipVia
-- 

