/* -> Bu bir çoklu yorum satırı

DML ve DDL işlemlerimi var dedik..
DML -> Data Manipulate Language

Select -> Veri seçme
Update -> Güncelleme
Delete -> Silme
insert into ->  Kayıt Ekleme



*/


-- Tekli yorum satırı

-- Select
-- Select  seçilecek alanlar from TabloAdı Where Koşul

select * from Kategoriler
select * from Urunler
select UrunID,UrunAdi,BirimdekiMiktar ,TedarikciID
from Urunler 
where KategoriID = 8

select * from Tedarikciler 
where TedarikciID in (4,6,7,13,17,19,21,21,27,17)


-- Update
-- update TABLOADI set ColumnAdı1=Value1 ,ColumnAdı2=Value2 ....
-- where Koşul ?

select * from Bolge
update  Bolge set BolgeTanimi = 'Marmara'
update Bolge set BolgeTanimi = 'İç Anadolu' where BolgeID =5

-- insert into TABLOADI (ColumanAdı1, ColumnAdı2) values (Value1,Value2)

insert into Bolge (BolgeTanimi,BolgeID) values ('DoğuAnadolu',8)

-- delete tabloAdı where Koşulu

delete Bolge where BolgeID = 8