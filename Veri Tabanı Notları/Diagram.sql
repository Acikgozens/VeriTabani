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
--Tokyo Traders�n tedarik etti�i �r�nler hangileridir ?
select*
from Urunler 
where TedarikciID in (select TedarikciId
                      from Tedarikciler
                      where SirketAdi = 'Tokyo Traders')
--seafood kategorisindeki �r�nleri ve tedarik�iler kimdir 
-- �r�n ad�,kategori adi,tedarik�i ad� 



