/*
insert - > Kay�t eklemek i�in
update - > g�ncelleme
delete -> Silme
*/

/*

update TABLO_ADI 
set ColumnAdi1 = ColumnValue1,ColumnAdi1  = ColumnValue1
where ko�ul ?
Dipnot Ko�ulsuz(where) asla update yapmay�n
Dipnot 2 : G�ncelleme i�lemlerinde ko�ula unique(e�i benzeri olmayan) bilgi ile yapmaya �al���n
*/
Select *
from Bolge
update Bolge 
set BolgeTanimi  = 'Do�u Anadolu'
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
       ('�� Anadolu',8)
/*
delete TABLO_ADI
where Ko�ul ?


Dipnot: Ko�ulsuz delete yazmay�n.
Dipnot2:��lemlerde ko�ula unique(e�i benzeri olmayan) bilgi ile yapmaya �al���n.
*/
select* 
from Bolge

delete Bolge
where BolgeID > 7

insert into Bolge(BolgeTanimi)
select KategoriAdi from Kategoriler
select * from Bolge

/*
Seafood kategorisindeki �r�nlere y�zde 20 zam yap�n
*/
update Urunler
set BirimFiyat� = BirimFiyat�* 1.2
where KategoriID in (select Kategoriler
                     from Kategoriler 
                     where KategoriAdi = 'Seafood')

select*
from urunler
where KategoriID in (select Kategoriler  
                     from Kategoriler 
                     where KategoriAdi = 'Seafood')
--Hi� sat�lmayan �r�nlere y�zde 10 indirim
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
  --Hi� al��veri� yapmam�� m��terilerim hangileridir bunlar� sistemden silelim
  select *
  from Musteriler
  where MusteriID not in(select MusteriID
                         from Satislar)
  delete [Musteriler]
  where MusteriID not in (select MusteriID
						  from Satislar)

