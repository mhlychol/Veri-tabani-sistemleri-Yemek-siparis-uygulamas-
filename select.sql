
--Akdeniz mutfaðý kategorisinde olan restoranlarýn hepsinden sipariþ vermiþ ama uzak doðu kategorisindeki restoranlardan 
--hiç sipariþ vermemiþ müþterilerin adý, soyadý, telefonu, geçen yýl bu ayki toplam sipariþ adedi, 
--bu yýl bu ayki toplam sipariþ adedini getiren sorguyu yazýnýz. 

--Eðer geçen yýlki siparis sayisi bu aykinden fazla ise gösterilecek ve fark 10’dan 
--büyükse müþteri telefonuna göre a-z deðilse isme göre z-a sýralamasý yapýlacaktýr.
--Yýl ve ay sorguda elle girilmeyecek sistemden otomatik çekilecektir.

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
MK.Mutfak_Kat_Adi = 'Uzak Doðu'
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





--Restoran1 isimli restorandaki menü ve ürünlerin hepsini aþaðýdaki þekilde listeleyen sorguyu yazýnýz. Sipariþi olmayan ürünler için sayýsal deðerler 0 olarak yazýlacaktýr
--Menü/Ürün Adý | Toplam Sipariþ Sayýsý | Hýz Puaný Verilen Sip. Sayýsý | Hýz Puaný <= 2 Olan Sipariþlerdeki Ortalama Teslim Süresi (dk)


SELECT MU.Urun_Adi,
       COUNT(S.Siparis_ID) AS Toplam_Siparis_Sayisi,
       COUNT(S.SIp_Hiz_Puani) AS Hiz_Puani_Olan_Siparis_Sayisi,
       AVG(CASE WHEN S.SIp_Hiz_Puani <= 2 THEN DATEDIFF(MINUTE, S.Sip_Tarih_Saat, S.Sip_Teslim_Zamani) END) AS Ortalama_Teslim_Suresi_dk
FROM Tbl_Menu_Urun MU
LEFT JOIN Tbl_Siparis_Sepet SS ON MU.Menu_Urun_ID = SS.Menu_Urun_ID
LEFT JOIN Tbl_Siparis S ON SS.Siparis_ID = S.Siparis_ID
LEFT JOIN Tbl_Restoran R ON R.Restoran_ID = MU.Restoran_ID
WHERE R.Restoran_Adi = 'Sushi House Uzak Doðu'
GROUP BY MU.Urun_Adi
ORDER BY Toplam_Siparis_Sayisi DESC;


--Adýnýn ilk harfi 'V' ve soyadýnýn ilk harfi 'W' olan müþterilerin adýný ve soyadýný listeleyen sql sorgusunu yazýnýz.

Select C.FirstName, C.LastName FROM dbo.DimCustomer C WHERE FirstName like 'V%' AND LastName like 'W%'