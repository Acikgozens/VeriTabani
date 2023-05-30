/*
1-Having
2-case when
3-deðiþken tanýmlama
4-if else ve while döngüleri
5-try catch


*/
--Hangi kategoride kaç ürün var

use Northwind

select Kategoriler.KategoriAdi,Count(*) as adet
from Kategoriler,Urunler
Where Kategoriler.KategoriID=Urunler.KategoriID
group by Kategoriler.KategoriAdi

--10 dan fazla ürün barýndýran kategoriler hangileridir 

select Kategoriler.KategoriAdi,Count(*) as adet
from Kategoriler,Urunler
where Kategoriler.KategoriID=Urunler.KategoriID
group by Kategoriler.KategoriAdi
having COUNT(*) > 10
/*
case Veri
  when Deger1 then GosterilicekDeger
  when Deger2 then GosterilicekDeger
  .....
  else GosterilicekDeger
end

*/

use DbOkul_TT

select Id,Adi+' '+Soyadi as AdSoyad,Email,DogumTarihi,
    case Cinsiyet
	 when 'E' then 'Erkek'
	 when 'K' then 'Kadýn'
	 else'Belirtilmemiþ'
    end as OgrenciCinsiyet
from tblOgrenci

select Id,Adi+' '+Soyadi as AdSoyad,Email,DogumTarihi,Durumu,
   case Durumu
   when 1 then 'Aktif'
   else 'Pasif'
 end as OgrenciDurumu

from TblOgrenci  

--**************************************************
/*
 Deðiþken Tanýmlama
 
 declare @DegiskenAdi VeriTuru

 Deðiþken deger atama 2 þekilde yapabiliyoruz

 1.Yöntem
   set @DegiskenAdi = Value
 2.Yöntem
   select @DegiskenAdi =Value

   Convert(Donusulecek Veri Turu, Dönüþtürülecek Veri)
   cast


*/
--10 Yazdýrdýk
declare @Sayi int
set @sayi = 10
print ('Sayi: '+ Convert(varchar(5),@Sayi))--Sayýyýn tipini dönüþtürdük ve Sayi:10 yazmýþ olduk.

--10 la çarptýk
select @Sayi= @Sayi *10
print ('Sayi: ' + Convert(varchar(5),@Sayi))

/*
 if else bloglar

 if(koþul)
 begin

 end 
 else
 begin

 end

*/
declare @Sayi int
select @Sayi = 20
if (@Sayi >= 10)
begin
  print('Sayi 10 dan büyüktür')
end
else
begin
  print('Sayi 10 dan kücüktür')
end

--**********************************

/*

  Döngüler

  while(Koþul)
  begin
   //Kod bloðu
  end

*/

declare @Sayi int
set @Sayi =0

while(@Sayi <10)
begin
   print(@Sayi)
   set @Sayi+=1 --@Sayi = @Sayi +1
end

--Örnek 2 

declare @Sayi int
set @Sayi =0

while(0=0)
begin
   print(@Sayi)
   set @Sayi+=1 --@Sayi = @Sayi +1
   if(@Sayi>=10)
   begin
      break
   end
end


--*******************************
/*

	try catch -> Çalýþtýr ve hata yakala

	begin try
	   //Kod bloðumuz(Çalýþmasýný istediðimiz yer)
	end try
	begin catch
		//Hata durumunda çalýþacak kod bloðu
	end catch

*/
use DbOkul_TT
--drop table tblHata

create table tblHata (
Id int identity(1,1) primary key,
HataSatiri int,
HataKodu int,
HataninYeri varchar(50),



declare @Sayi int, @Sonuc int

begin try
	set @Sayi = 10

	set @Sonuc = @Sayi /0

	select @Sonuc
end try
begin catch

	select ERROR_LINE() as HataSatiri,
			   ERROR_NUMBER() as HataKodu,
			   ERROR_PROCEDURE() as HataninBulunduguProcedure,
			   ERROR_SEVERITY() as AciliyetKodu,
			   ERROR_MESSAGE() as HataMessage
		   
end catch


