/*
	1- Having
	2- Case when
	3- değişken tanımlama
	4- if else ve while donguleri
	5- try catch
*/

-- hangi kategoride kaç ürün var?

use Northwind

select Kategoriler.KategoriAdi , Count(*) as adet
from Kategoriler , Urunler
where Kategoriler.KategoriID = Urunler.KategoriID
group by Kategoriler.KategoriAdi

-- 10 dan fazla ürün barındıran kategoriler hangileridir ?
select Kategoriler.KategoriAdi , Count(*) as adet
from Kategoriler , Urunler
where Kategoriler.KategoriID = Urunler.KategoriID
group by Kategoriler.KategoriAdi
having COUNT(*) > 10


--***************************************************
/*
	Değişken tanımalama

	declare @DegiskenAdi VeriTuru

	Değişken deger atama 2 farklı şekilde yapabiliyoruz

	1.Yöntem
		set @DegiskenAdi = Value
	2.Yöntem 
		select @DegiskenAdi=Value

		Convert(Donuşulecek Veri Türü , Dönüştürülecek VEri )
		cast
*/

declare @Sayi int

set @Sayi = 10

pRint('Sayi : ' + Convert(vaRChar(5),@Sayi))

select @Sayi = @Sayi * 10

print('Sayi : ' +  Convert(varchar(5),@Sayi))

/*
 if else bloglar

 if(Koşul)
 begin
	
 end
 else
 begin

 end
*/

declare @Sayi int

select @Sayi = 5

if(@Sayi >= 10)
begin
	print('Sayi 10 dan büyük eşittir')
end
else
begin
	print('Sayi 10 dan küçüktür')
end

--************************************

/*
	Döngüler

	while(Koşul)
	begin
		// Kod bloğu
	end
*/

declare @Sayi int

set @Sayi =0

while(@Sayi <10)
begin
	print(@Sayi)
	set @Sayi+=1 -- @Sayi = @Sayi +1
end


-- örnek 2
declare @Sayi int

set @Sayi =0

while(0=0)
begin
	print(@Sayi)
	set @Sayi+=1 -- @Sayi = @Sayi +1
	if(@Sayi>=10)
	begin
		break
	end
end

--*******************************

/*
	try catch -> Çalıştır ve hata yakala

	begin try
		// Kod bloğunuz(Çalışmasını istediğiniz yer)
	end try
	begin catch
		// Hata durumunda çalışacak kod bloğu
	end catch
*/

use DbOkul_TT
--drop table tblHata
/*
create table tblHata (
	Id int identity(1,1) primary key,
	HataSatiri int,
	HataKodu int,
	HataninYeri varchar(50),
	HataninAciliyetKodu int,
	HataninMessage varchar(1000)
)
*/

declare @Sayi int , @Sonuc int

begin try
	set @Sayi = 10

	set @Sonuc = @Sayi /0

	select @Sonuc
end try
begin catch
	
	insert into tblHata( [HataSatiri], [HataKodu], [HataninYeri], [HataninAciliyetKodu], [HataninMessage])
	select ERROR_LINE() as HataSatiri,
			ERROR_NUMBER() as HataKodu,
			ERROR_PROCEDURE() as HataninBulunduguProcedure,
			ERROR_SEVERITY() as AciliyetKodu,
			ERROR_MESSAGE() as HataMessage
end catch

/*
	Select insert

*/

select * from tblHata

alter table tblHata add IslemTarihi datetime default getdate()





begin try

	insert into tblOgrenci( [Adi], [Soyadi], [Email], [OlusturmaTarihi], [DogumTarihi], [Cinsiyet], [Durumu], [Numara])
	values(null,'Tanin','tt@gmail.com',GETDATE(),'1990-01-01','E',1,'Hr4543545')
end try
begin catch
	
	insert into tblHata( [HataSatiri], [HataKodu], [HataninYeri], [HataninAciliyetKodu], [HataninMessage])
	select ERROR_LINE() as HataSatiri,
			ERROR_NUMBER() as HataKodu,
			ERROR_PROCEDURE() as HataninBulunduguProcedure,
			ERROR_SEVERITY() as AciliyetKodu,
			ERROR_MESSAGE() as HataMessage
end catch

select * from tblHata