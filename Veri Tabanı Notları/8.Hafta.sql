use DbOkul_TT

--DDL - Data Definition Language
/*
	Veri tanımla Dili
	Create - Oluşturma
	Alter - Düzenleme
	Drop - Silme
*/

/*
	Join- 2 farklı tabloyu birleştirme
 1- inner join
 2- Left join
 3- right join
 4- full join
*/

-- where koşulu ile birleştirme (inner)

select *
from tblOgretmen,tblOgrencininDersleri,tblDersler
where tblOgretmen.Id= tblOgrencininDersleri.OgretmenId 
and tblOgrencininDersleri.DersId =  tblDersler.Id



select * 
from tblOgrenci full join tblOgrencininDersleri 
		on tblOgrenci.Id = tblOgrencininDersleri.OgrenciId

select * 
from tblOgrenci

-- çoklu join

-- Öğrenci Adi, Soyadi, Ders Adi, Öğrenmet Adi ve Soyadi


select tblOgrenci.Id, tblOgrenci.Adi,tblOgrenci.Soyadi,
		tblDersler.Id, tblDersler.Adi,
		tblOgretmen.Id,tblOgretmen.Adi,tblOgretmen.Soyadi
from tblOgrenci inner join tblOgrencininDersleri on tblOgrenci.Id = tblOgrencininDersleri.OgrenciId
		inner join tblOgretmen on tblOgrencininDersleri.OgretmenId = tblOgretmen.Id
		inner join tblDersler on tblOgrencininDersleri.DersId = tblDersler.Id
--where tblDersler.Adi like 'matematik'

-- view : sanal tablolarımız

alter view V_DersiAlanlar
as
select tblOgrenci.Id as OgrenciId, tblOgrenci.Adi as OgrenciAdi,tblOgrenci.Soyadi as OgrenciSoyadi,
		tblDersler.Id as DersId, tblDersler.Adi as DersAdi,
		tblOgretmen.Id as OgretmenId,tblOgretmen.Adi as OgretmenAdi,tblOgretmen.Soyadi as OgretmenSoyadi,
		tblOgrencininDersleri.VizeNotu,tblOgrencininDersleri.FinalNotu,tblOgrencininDersleri.GecmeNotu
from tblOgrenci inner join tblOgrencininDersleri on tblOgrenci.Id = tblOgrencininDersleri.OgrenciId
		inner join tblOgretmen on tblOgrencininDersleri.OgretmenId = tblOgretmen.Id
		inner join tblDersler on tblOgrencininDersleri.DersId = tblDersler.Id

select  * from V_DersiAlanlar

drop view V_DersiAlanlar

