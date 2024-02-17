
--Akdeniz mutfa�� kategorisinde olan restoranlar�n hepsinden sipari� vermi� ama uzak do�u kategorisindeki restoranlardan 
--hi� sipari� vermemi� m��terilerin ad�, soyad�, telefonu, ge�en y�l bu ayki toplam sipari� adedi, 
--bu y�l bu ayki toplam sipari� adedini getiren sorguyu yaz�n�z. 

--E�er ge�en y�lki siparis sayisi bu aykinden fazla ise g�sterilecek ve fark 10�dan 
--b�y�kse m��teri telefonuna g�re a-z de�ilse isme g�re z-a s�ralamas� yap�lacakt�r.
--Y�l ve ay sorguda elle girilmeyecek sistemden otomatik �ekilecektir.

SELECT
M.Musteri_Adi,
M.Musteri_Soyadi,
M.Musteri_Telefon,
SUM(CASE WHEN YEAR(S.Sip_Tarih_Saat) = YEAR(GETDATE()) - 1 THEN 1 ELSE 0 END) AS GecenYilSiparisAdedi,
SUM(CASE WHEN YEAR(S.Sip_Tarih_Saat) = YEAR(GETDATE()) AND MONTH(S.Sip_Tarih_Saat) = MONTH(GETDATE()) THEN 1 ELSE 0 END) AS BuAySiparisAdedi
FROM
Tbl_Musteri M
INNER JOIN Tbl_Siparis S ON M.Musteri_ID = S.Musteri_ID
INNER JOIN Tbl_Restoran R ON S.Restoran_ID = R.Restoran_ID
INNER JOIN Tbl_Restoran_Mutfak_Kategorisi RMK ON R.Restoran_ID = RMK.Restoran_ID
INNER JOIN Tbl_Mutfak_Kategori MK ON RMK.Mutfak_Kat_ID = MK.Mutfak_Kat_ID
WHERE
MK.Mutfak_Kat_Adi = 'Akdeniz'
AND
M.Musteri_ID NOT IN (
SELECT
S.Musteri_ID
FROM
Tbl_Siparis S
INNER JOIN Tbl_Restoran R ON S.Restoran_ID = R.Restoran_ID
INNER JOIN Tbl_Restoran_Mutfak_Kategorisi RMK ON R.Restoran_ID = RMK.Restoran_ID
INNER JOIN Tbl_Mutfak_Kategori MK ON RMK.Mutfak_Kat_ID = MK.Mutfak_Kat_ID
WHERE
MK.Mutfak_Kat_Adi = 'Uzak Do�u'
)
GROUP BY
M.Musteri_Adi,
M.Musteri_Soyadi,
M.Musteri_Telefon
HAVING
SUM(CASE WHEN YEAR(S.Sip_Tarih_Saat) = YEAR(GETDATE()) - 1 THEN 1 ELSE 0 END) > SUM(CASE WHEN YEAR(S.Sip_Tarih_Saat) = YEAR(GETDATE()) AND MONTH(S.Sip_Tarih_Saat) = MONTH(GETDATE()) THEN 1 ELSE 0 END)
ORDER BY
CASE
WHEN ABS(SUM(CASE WHEN YEAR(S.Sip_Tarih_Saat) = YEAR(GETDATE()) - 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN YEAR(S.Sip_Tarih_Saat) = YEAR(GETDATE()) AND MONTH(S.Sip_Tarih_Saat) = MONTH(GETDATE()) THEN 1 ELSE 0 END)) > 10 THEN M.Musteri_Telefon
ELSE M.Musteri_Adi
END DESC;





--Restoran1 isimli restorandaki men� ve �r�nlerin hepsini a�a��daki �ekilde listeleyen sorguyu yaz�n�z. Sipari�i olmayan �r�nler i�in say�sal de�erler 0 olarak yaz�lacakt�r
--Men�/�r�n Ad� | Toplam Sipari� Say�s� | H�z Puan� Verilen Sip. Say�s� | H�z Puan� <= 2 Olan Sipari�lerdeki Ortalama Teslim S�resi (dk)


SELECT MU.Urun_Adi,
       COUNT(S.Siparis_ID) AS Toplam_Siparis_Sayisi,
       COUNT(S.SIp_Hiz_Puani) AS Hiz_Puani_Olan_Siparis_Sayisi,
       AVG(CASE WHEN S.SIp_Hiz_Puani <= 2 THEN DATEDIFF(MINUTE, S.Sip_Tarih_Saat, S.Sip_Teslim_Zamani) END) AS Ortalama_Teslim_Suresi_dk
FROM Tbl_Menu_Urun MU
LEFT JOIN Tbl_Siparis_Sepet SS ON MU.Menu_Urun_ID = SS.Menu_Urun_ID
LEFT JOIN Tbl_Siparis S ON SS.Siparis_ID = S.Siparis_ID
LEFT JOIN Tbl_Restoran R ON R.Restoran_ID = MU.Restoran_ID
WHERE R.Restoran_Adi = 'Sushi House Uzak Do�u'
GROUP BY MU.Urun_Adi
ORDER BY Toplam_Siparis_Sayisi DESC;


--Ad�n�n ilk harfi 'V' ve soyad�n�n ilk harfi 'W' olan m��terilerin ad�n� ve soyad�n� listeleyen sql sorgusunu yaz�n�z.

Select C.FirstName, C.LastName FROM dbo.DimCustomer C WHERE FirstName like 'V%' AND LastName like 'W%'