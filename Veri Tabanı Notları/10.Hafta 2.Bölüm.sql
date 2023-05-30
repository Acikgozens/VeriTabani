/*
 case Veri 
	when Deger1  then GosterilecekDeger
	when Deger2 then GosterilecekDeger
	......
	else  GosterilecekDEger
end
 */

use DbOkul_TT

select Id,Adi +' ' + Soyadi as AdSoyad,Email, DogumTarihi, 		
		case Cinsiyet
			When 'E' then 'Erkek'
			When 'K' then 'Kadın'
			else 'Belirtilmemiş'
		end as OgrenciCinsiyet,
		case Durumu
			when 1 then 'Aktif'
			else 'Pasif'
		end as OgrenciDurumu
from tblOgrenci