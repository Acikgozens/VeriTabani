/*
group by
order by

*/

-- Hangi kategori kaçtane ürün var ?


select * from Kategoriler
select * from Urunler

select KategoriAdi, Count(*) as adet,AVG(BirimFiyati) as OrtalamaFiyat
from V_UrunDetay
Group by KategoriAdi

-- Hangi bölge kaç personel Çalışıyor


select BolgeTanimi,TerritoryTanimi, COUNT(*) as Adet
from V_PersonelDetay
group by BolgeTanimi,TerritoryTanimi

select KategoriAdi,SirketAdi, COUNT(*)   as adet
from V_ButunBilgiler
group by KategoriAdi,SirketAdi
order by KategoriAdi desc,adet asc


/*
	Select
	from
	KategoriAdi
	group by
	order by 
	having

*/


select top 5 KategoriAdi,SirketAdi, COUNT(*)   as adet
from V_ButunBilgiler
group by KategoriAdi,SirketAdi
order by  3 desc

