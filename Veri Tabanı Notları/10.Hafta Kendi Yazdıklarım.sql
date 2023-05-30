/*
1-Having
2-case when
3-de�i�ken tan�mlama
4-if else ve while d�ng�leri
5-try catch


*/
--Hangi kategoride ka� �r�n var

use Northwind

select Kategoriler.KategoriAdi,Count(*) as adet
from Kategoriler,Urunler
Where Kategoriler.KategoriID=Urunler.KategoriID
group by Kategoriler.KategoriAdi

--10 dan fazla �r�n bar�nd�ran kategoriler hangileridir 

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
	 when 'K' then 'Kad�n'
	 else'Belirtilmemi�'
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
 De�i�ken Tan�mlama
 
 declare @DegiskenAdi VeriTuru

 De�i�ken deger atama 2 �ekilde yapabiliyoruz

 1.Y�ntem
   set @DegiskenAdi = Value
 2.Y�ntem
   select @DegiskenAdi =Value

   Convert(Donusulecek Veri Turu, D�n��t�r�lecek Veri)
   cast


*/
--10 Yazd�rd�k
declare @Sayi int
set @sayi = 10
print ('Sayi: '+ Convert(varchar(5),@Sayi))--Say�y�n tipini d�n��t�rd�k ve Sayi:10 yazm�� olduk.

--10 la �arpt�k
select @Sayi= @Sayi *10
print ('Sayi: ' + Convert(varchar(5),@Sayi))

/*
 if else bloglar

 if(ko�ul)
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
  print('Sayi 10 dan b�y�kt�r')
end
else
begin
  print('Sayi 10 dan k�c�kt�r')
end

--**********************************

/*

  D�ng�ler

  while(Ko�ul)
  begin
   //Kod blo�u
  end

*/

declare @Sayi int
set @Sayi =0

while(@Sayi <10)
begin
   print(@Sayi)
   set @Sayi+=1 --@Sayi = @Sayi +1
end

--�rnek 2 

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

	try catch -> �al��t�r ve hata yakala

	begin try
	   //Kod blo�umuz(�al��mas�n� istedi�imiz yer)
	end try
	begin catch
		//Hata durumunda �al��acak kod blo�u
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


