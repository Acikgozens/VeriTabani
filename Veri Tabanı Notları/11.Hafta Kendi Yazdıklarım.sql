/*
DML -> Select,update,insert,
buray� hocan�n notlardan al





*/


/*
  
stored prodecure (Sakl� Yordam)(sp)
    /*
	  
	  Bir i�lemi bir kere yaz�p defalarca kullanmak diyebiliriz.
	  Genelde 3rd part yaz�l�mlarda sqldeki i�lemleri yapmak i�in kullan�r�z.

	  sp -> nesne oldu�u i�in bi kere olu�turulurlar.

	  sytax�:
	--olu�turma
	  create prodecure spOgrenciEkle
	   @ParametreAd�1 Turu,
	   @ParametreAd�2 Turu,
	as
	begin
	   //Kod blo�u oluyor...
	end

	--g�ncelleme
	  
	  alter prodecure spOgrenciEkle
	   @ParametreAd�1 Turu,
	   @ParametreAd�2 Turu,
	as
	begin
	   //Kod blo�u oluyor...
	end

	--silme
	  
	  drop prodecure spOgrenciEkle
	   @ParametreAd�1 Turu,
	   @ParametreAd�2 Turu,
	as
	begin
	   //Kod blo�u oluyor...
	end
	--�a��rma i�lemi
	 exec(ute) uspOgrenciEkle Value1,Value2...


	*/ 



*/
use DbOkul_TT
select *from tblDersler

create procedure uspDersEkle
  @Adi nvarchar(50),
  @Aciklama nvarchar(200),
  @Durumu bit
as
begin
  insert into tblDersler([Adi], [Aciklama], [Durumu])
  values (@Adi,@Aciklama,@Durumu)
end


exec uspDersEkle 'Veritaban� Programlama','Deneme Ama�l� Eklendi',1

--Olu�an kayd�n Id sini alal�m
alter procedure uspDersEkle
  @Adi nvarchar(50),
  @Aciklama nvarchar(200),
  @Durumu bit,
  @Id int=0  output
as
begin
  insert into tblDersler([Adi], [Aciklama], [Durumu])
  values (@Adi,@Aciklama,@Durumu)
--  set @Id = (select Id from tblDersler order by Id desc)

  set @Id =SCOPE_IDENTITY()--Olu�an son �dentity bilgisini getiriyor
end

declare @sonuc int

exec uspDersEkle 'C#Uygulamalar�','Deneme Ama�l� Eklendi',1,@sonuc output

select @sonuc

/*
--B�t�n derslerin listesini veren procedure
create procedure uspDerslerinListesi
as
begin
  select * from tblDersler
end
*/
--exec uspDerslerinListesi


create procedure uspOgrenciEkle
	@Adi nvarchar(50),
	@Soyadi nvarchar (50),
	@Email nvarchar (100),
	@DogumTarihi date,
	@Cinsiyet char(1),
	@Durumu bit,
	@OgrenciNumaras� char(8),
	@Id int=0 output
as 
begin
	insert into tblOgrenci([Adi],[Soyadi],[Email],[OlusturmaTarihi],[DogumTarihi],[Cinsiyet],[Durumu],[Numara])
	values(@Adi,@Soyadi,@Email,GETDATE(),@DogumTarihi,@Cinsiyet,@Durumu,@OgrenciNumaras�)

	Set @Id = SCOPE_IDENTITY()
end

declare @sonuc int
exec uspOgrenciEkle 'Ahmet','�oban','ahmet@gmail.com','2000-01-01','E',1,'HR2002121',@sonuc output

select @sonuc

select* from tblOgrenci

/*
*/

--Buray� hocan�n att��� notlardan al.





