select*
from Urunler
where KategoriID = 8


select*
from urunler
where KategoriID in (select KategoriID
                          from Kategoriler
						  where KategoriAdi= 'Seafood')
--Seafood kategorisindeki tedarikcilerim hangileridir
Select*
from Tedarikciler
where TedarikciID in (select TedarikciID
                      from Urunler
                      where KategoriID in (select KategoriID
					                       from Kategoriler
										   where KategoriAdi = 'Seafood'))
--Tokyo Tradersýn tedarik ettiði ürünler hangileridir ?
select*
from Urunler 
where TedarikciID in (select TedarikciId
                      from Tedarikciler
                      where SirketAdi = 'Tokyo Traders')
--seafood kategorisindeki ürünleri ve tedarikçiler kimdir 
-- ürün adý,kategori adi,tedarikçi adý 



