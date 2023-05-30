/*
insert - > Kayýt eklemek için
update - > güncelleme
delete -> Silme
*/

/*

update TABLO_ADI 
set ColumnAdi1 = ColumnValue1,ColumnAdi1  = ColumnValue1
where koþul ?
Dipnot Koþulsuz(where) asla update yapmayýn
Dipnot 2 : Güncelleme iþlemlerinde koþula unique(eþi benzeri olmayan) bilgi ile yapmaya çalýþýn
*/
Select *
from Bolge
update Bolge 
set BolgeTanimi  = 'Doðu Anadolu'
where BolgeID = 1

Select *
from Bolge
update Bolge 
set BolgeTanimi  = 'Karadeniz'
where BolgeID = 2

Select *
from Bolge
update Bolge 
set BolgeTanimi  = 'Marmara'
where BolgeID = 3

/* 
insert into TABLO_ADI (ColumnAdi1,ColumnAdi2,....)
values(ColumnValue1,ColumnValue2,.....)


*/
insert into Bolge(BolgeTanimi,BolgeID)
values ('Guneydogu Anadolu',7),
       ('Ýç Anadolu',8)
/*
delete TABLO_ADI
where Koþul ?


Dipnot: Koþulsuz delete yazmayýn.
Dipnot2:Ýþlemlerde koþula unique(eþi benzeri olmayan) bilgi ile yapmaya çalýþýn.
*/
select* 
from Bolge

delete Bolge
where BolgeID > 7

insert into Bolge(BolgeTanimi)
select KategoriAdi from Kategoriler
select * from Bolge

/*
Seafood kategorisindeki ürünlere yüzde 20 zam yapýn
*/
update Urunler
set BirimFiyatý = BirimFiyatý* 1.2
where KategoriID in (select Kategoriler
                     from Kategoriler 
                     where KategoriAdi = 'Seafood')

select*
from urunler
where KategoriID in (select Kategoriler  
                     from Kategoriler 
                     where KategoriAdi = 'Seafood')
--Hiç satýlmayan ürünlere yüzde 10 indirim
  update Urunler
  set BirimFiyati= BirimFiyati*(0.9)
  where UrunID in (select UrunID
                   from Urunler 
                   where UrunID not in (select UrunID 
									    from [dbo].[Satis Detaylari]))

  select *
  from Urunler
  where UrunID not in (Select UrunID 
					   from [dbo].[Satis Detaylari])

  delete [Satis Detaylari]
  where UrunID in (9,10,11,12)
  --Hiç alýþveriþ yapmamýþ müþterilerim hangileridir bunlarý sistemden silelim
  select *
  from Musteriler
  where MusteriID not in(select MusteriID
                         from Satislar)
  delete [Musteriler]
  where MusteriID not in (select MusteriID
						  from Satislar)

