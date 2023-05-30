/*
DML -> Select,update,insert,
burayý hocanýn notlardan al





*/


/*
  
stored prodecure (Saklý Yordam)(sp)
    /*
	  
	  Bir iþlemi bir kere yazýp defalarca kullanmak diyebiliriz.
	  Genelde 3rd part yazýlýmlarda sqldeki iþlemleri yapmak için kullanýrýz.

	  sp -> nesne olduðu için bi kere oluþturulurlar.

	  sytaxý:
	--oluþturma
	  create prodecure spOgrenciEkle
	   @ParametreAdý1 Turu,
	   @ParametreAdý2 Turu,
	as
	begin
	   //Kod bloðu oluyor...
	end

	--güncelleme
	  
	  alter prodecure spOgrenciEkle
	   @ParametreAdý1 Turu,
	   @ParametreAdý2 Turu,
	as
	begin
	   //Kod bloðu oluyor...
	end

	--silme
	  
	  drop prodecure spOgrenciEkle
	   @ParametreAdý1 Turu,
	   @ParametreAdý2 Turu,
	as
	begin
	   //Kod bloðu oluyor...
	end
	--çaðýrma iþlemi
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


exec uspDersEkle 'Veritabaný Programlama','Deneme Amaçlý Eklendi',1

--Oluþan kaydýn Id sini alalým
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

  set @Id =SCOPE_IDENTITY()--Oluþan son ýdentity bilgisini getiriyor
end

declare @sonuc int

exec uspDersEkle 'C#Uygulamalarý','Deneme Amaçlý Eklendi',1,@sonuc output

select @sonuc

/*
--Bütün derslerin listesini veren procedure
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
	@OgrenciNumarasý char(8),
	@Id int=0 output
as 
begin
	insert into tblOgrenci([Adi],[Soyadi],[Email],[OlusturmaTarihi],[DogumTarihi],[Cinsiyet],[Durumu],[Numara])
	values(@Adi,@Soyadi,@Email,GETDATE(),@DogumTarihi,@Cinsiyet,@Durumu,@OgrenciNumarasý)

	Set @Id = SCOPE_IDENTITY()
end

declare @sonuc int
exec uspOgrenciEkle 'Ahmet','Çoban','ahmet@gmail.com','2000-01-01','E',1,'HR2002121',@sonuc output

select @sonuc

select* from tblOgrenci

/*
*/

--Burayý hocanýn attýðý notlardan al.





