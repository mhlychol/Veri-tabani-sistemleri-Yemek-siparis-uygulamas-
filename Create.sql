
create database yemeksiparis

on primary (
			name = 'yemeksiparisdb',
			filename = 'C:\database\DatabaseFiles\yemeksiparis_db.mdf',
			size = 50MB,
			maxsize = 150mb,
			filegrowth = 5mb
)

log on (
		name = 'yemeksiparis_log',
		filename = 'C:\database\DatabaseFiles\yemeksiparis_log.ldf',
		size = 25mb,
		maxsize = 50mb,
		filegrowth = 5mb
)

GO



--CREATE TABLE Tbl_IL (
--Il_kodu INT IDENTITY (1,1) PRIMARY KEY ,
--Il_Adi VARCHAR(50) NOT NULL
--);

--CREATE TABLE Tbl_Ilce (
--Ilce_kodu INT IDENTITY (1,1) PRIMARY KEY,
--Il_kodu INT FOREIGN KEY REFERENCES Tbl_IL(Il_kodu) NOT NULL,
--Ilce_Adi VARCHAR(50) NOT NULL,

--);

--CREATE TABLE Tbl_Mahalle (
--Mahalle_kodu INT IDENTITY (1,1)  PRIMARY KEY,
--Ilce_kodu INT  FOREIGN KEY REFERENCES Tbl_Ilce(Ilce_kodu) NOT NULL,
--Mahalle_adi VARCHAR(50) NOT NULL
--);

--CREATE TABLE Tbl_Sokak (
--Sokak_kodu INT IDENTITY (1,1) PRIMARY KEY,
--Mahalle_kodu INT FOREIGN KEY REFERENCES Tbl_Mahalle(Mahalle_kodu) NOT NULL,
--Sokak_adi VARCHAR(50) NOT NULL
--);

--CREATE TABLE Tbl_Cadde (
--Cadde_kodu INT IDENTITY (1,1) PRIMARY KEY,
--Mahalle_kodu INT NOT NULL FOREIGN KEY REFERENCES Tbl_Mahalle(Mahalle_kodu), 
--Cadde_adi VARCHAR(50) NOT NULL,
--);

--CREATE TABLE Tbl_Adres (
--Adres_ID INT IDENTITY (1,1) PRIMARY KEY,
--il_kodu INT FOREIGN KEY REFERENCES Tbl_IL(Il_kodu) NOT NULL,
--ilce_kodu INT FOREIGN KEY REFERENCES Tbl_Ilce(Ilce_kodu) NOT NULL,
--Mahalle_kodu INT FOREIGN KEY REFERENCES Tbl_Mahalle(Mahalle_kodu) NOT NULL,
--Sokak_kodu INT FOREIGN KEY REFERENCES Tbl_Sokak(Sokak_kodu) ,
--Cadde_kodu INT FOREIGN KEY REFERENCES Tbl_Cadde(Cadde_kodu),
--A_Aciklama VARCHAR(255) ,
--IcKapiNo VARCHAR(10) NOT NULL,
--DisKapiNo VARCHAR(10) NOT NULL
--);

--CREATE TABLE Tbl_Musteri (
--Musteri_ID INT IDENTITY (1,1) PRIMARY KEY,
--Musteri_Adi VARCHAR(50) NOT NULL,
--Musteri_Soyadi VARCHAR(50) NOT NULL,
--Musteri_Mail VARCHAR(50) NOT NULL,
--Musteri_Parola VARCHAR(50) NOT NULL,
--Musteri_Telefon VARCHAR(10) CHECK (Musteri_Telefon LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
--Musteri_Durum BIT DEFAULT 1 NOT NULL
--);

--CREATE TABLE Tbl_Musteri_Adres (
--MusteriAdres_ID INT IDENTITY (1,1) PRIMARY KEY,
--Musteri_ID INT FOREIGN KEY REFERENCES Tbl_Musteri(Musteri_ID) NOT NULL,
--Adres_ID INT FOREIGN KEY REFERENCES Tbl_Adres(Adres_ID) NOT NULL,
--Varsayilan_adres INT
--);

--CREATE TABLE Tbl_Odeme_Tipleri (
--    Odeme_Tip_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Odeme_Tip_Adi VARCHAR(50) NOT NULL
--);

--CREATE TABLE Tbl_Restoran (
--    Restoran_ID INT IDENTITY (1,1) PRIMARY KEY,
--	Adres_ID INT FOREIGN KEY REFERENCES Tbl_Adres(Adres_ID) NOT NULL,
--    Restoran_Adi VARCHAR(50) NOT NULL,
--    R_Durum INT DEFAULT 1 NOT NULL,
--	R_Telefon VARCHAR(10) CHECK (R_Telefon LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
--	R_Mail VARCHAR(50) NOT NULL,
--    R_Favori BIT DEFAULT 0 NOT NULL
--);

--CREATE TABLE Tbl_Siparis (
--Siparis_ID INT IDENTITY (1,1) PRIMARY KEY,
--Musteri_ID INT FOREIGN KEY REFERENCES Tbl_Musteri(Musteri_ID) NOT NULL,
--Adres_ID INT FOREIGN KEY REFERENCES Tbl_Adres(Adres_ID) NOT NULL,
--Odeme_Tip_ID INT FOREIGN KEY REFERENCES Tbl_Odeme_Tipleri(Odeme_Tip_ID) NOT NULL,
--Restoran_ID INT FOREIGN KEY REFERENCES Tbl_Restoran(Restoran_ID)NOT NULL,
--Sip_Tarih_Saat DATETIME NOT NULL,
--Sip_Teslim_Zamani DATETIME ,
--SIp_Lezzet_Puani INT ,
--SIp_Hiz_Puani INT,
--SIp_Servis_Puani INT,
--SIp_Yorum VARCHAR(255),
--Sip_Durumu VARCHAR(50),
--Sip_Tutari Money NOT NULL
--);



--CREATE TABLE Tbl_Urun_Kategorisi (
--    Urun_Kategorisi_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Urun_Kategorisi_Adi VARCHAR(50) NOT NULL
--);
--CREATE TABLE Tbl_Menu_Urun (
--    Menu_Urun_ID INT IDENTITY (1,1) PRIMARY KEY,
--	Restoran_ID INT FOREIGN KEY REFERENCES Tbl_Restoran (Restoran_ID) NOT NULL,
--	Urun_Kategorisi_ID INT FOREIGN KEY REFERENCES Tbl_Urun_Kategorisi(Urun_Kategorisi_ID) NOT NULL,
--    Fiyat DECIMAL(10,2) NOT NULL,
--    Urun_Adi VARCHAR(50) NOT NULL,
--    R_Favorisi BIT DEFAULT 0 NOT NULL,
--    Hazirlanma_Suresi TIME 
--);

--CREATE TABLE Tbl_Menu_Icerik (
--    Menu_Icerik_ID INT IDENTITY (1,1) PRIMARY KEY,
--	Menu_Urun_ID INT FOREIGN KEY REFERENCES Tbl_Menu_Urun(Menu_Urun_ID) NOT NULL,
--    Menu_Menu_Urun_ID INT FOREIGN KEY REFERENCES Tbl_Menu_Urun(Menu_Urun_ID) NOT NULL,
--    Sira_Numarasi INT NOT NULL,
--);


--CREATE TABLE Tbl_Siparis_Sepet (
--    Siparis_Sepet_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Siparis_ID INT FOREIGN KEY REFERENCES Tbl_Siparis (Siparis_ID) NOT NULL,
--    Menu_Urun_ID INT FOREIGN KEY REFERENCES Tbl_Menu_Urun (Menu_Urun_ID) NOT NULL,
--	Birim_Fiyati decimal(10,2) NOT NULL,
--	Urun_Adet INT NOT NULL,
--	Toplam_Ekstra_Ucret decimal(10,2) NOT NULL,
--	Toplam_Tutar as (urun_adet*Birim_Fiyati),
--	SS_Not VARCHAR(250)
    
--);
--CREATE TABLE Tbl_Urun_Ozellikleri_Kategorisi (
--    Urun_Ozellik_Kategori_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Urun_Ozellik_Kategori_Adi VARCHAR(50) NOT NULL
--);
--CREATE TABLE Tbl_Urun_Ozellikleri (
--    Urun_Ozellik_ID INT IDENTITY (1,1) PRIMARY KEY,
--	Urun_Ozellik_Kategori_ID INT FOREIGN KEY REFERENCES Tbl_Urun_Ozellikleri_Kategorisi (Urun_Ozellik_Kategori_ID),
--    Urun_Ozellik_Adi VARCHAR(50) NOT NULL
--);
--CREATE TABLE Tbl_Sepet_Urun_Ozellikleri (
--	Sepet_Urun_Ozellik_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Siparis_Sepet_ID INT FOREIGN KEY REFERENCES Tbl_Siparis_Sepet (Siparis_Sepet_ID) NOT NULL,
--    Urun_Ozellik_ID INT  FOREIGN KEY REFERENCES Tbl_Urun_Ozellikleri (Urun_Ozellik_ID) NOT NULL,
--    S_U_Ekstra_Ucret decimal(10,2) NOT NULL,
    
   
--);



--CREATE TABLE Tbl_Menu_Urun_Ozellikleri (
--	Menu_Urun_Oz_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Menu_Urun_ID INT FOREIGN KEY REFERENCES Tbl_Menu_Urun (Menu_Urun_ID) NOT NULL,
--    Urun_Ozellik_ID INT  FOREIGN KEY REFERENCES Tbl_Urun_Ozellikleri (Urun_Ozellik_ID) NOT NULL,
--    Ekstra_Ucret DECIMAL(10,2) NOT NULL
--);


--CREATE TABLE Tbl_Restoran_Odeme_Tipleri (
--	R_Odeme_Tip_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Restoran_ID INT FOREIGN KEY REFERENCES Tbl_Restoran(Restoran_ID) NOT NULL,
--    Odeme_Tip_ID INT FOREIGN KEY REFERENCES Tbl_Odeme_Tipleri(Odeme_Tip_ID) NOT NULL,
    
   
--);


--CREATE TABLE Tbl_Teslimat_Tipleri (
--Teslimat_Tipi_ID INT IDENTITY (1,1) PRIMARY KEY,
--Teslimat_Tipi_Adi VARCHAR(50) NOT NULL
--);

--	CREATE TABLE Tbl_Restoran_Teslimat_Tipleri (
--	Restoran_Teslimat_Tipleri_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Restoran_ID INT FOREIGN KEY REFERENCES Tbl_Restoran(Restoran_ID) NOT NULL,
--    Teslimat_Tip_ID INT FOREIGN KEY REFERENCES Tbl_Teslimat_Tipleri(Teslimat_Tipi_ID) NOT NULL
--);

--CREATE TABLE Tbl_Calisma_Zamani (
--	Calisma_ID INT IDENTITY (1,1) PRIMARY KEY,
--	Acilis_Saati TIME ,
--	Kapanis_Saati TIME,
--);
--CREATE TABLE Tbl_Restoran_Calisma (
--	Restoran_Calisma_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Restoran_ID INT FOREIGN KEY REFERENCES Tbl_Restoran(Restoran_ID) NOT NULL,
--    Calisma_ID INT FOREIGN KEY REFERENCES Tbl_Calisma_Zamani(Calisma_ID) NOT NULL
--    CONSTRAINT UC_Restoran_Calisma UNIQUE (Restoran_ID, Calisma_ID),

--);



--CREATE TABLE Tbl_Sepet_Menu_Icerik (
--	Sepet_Menu_Icerik_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Siparis_Sepet_ID INT FOREIGN KEY REFERENCES Tbl_Siparis_Sepet(Siparis_Sepet_ID) NOT NULL,
--    Menu_Icerik_ID INT FOREIGN KEY  REFERENCES Tbl_Menu_Icerik(Menu_Icerik_ID) NOT NULL
--);

--CREATE TABLE Tbl_Mutfak_Kategori (
--    Mutfak_Kat_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Mutfak_Kat_Adi VARCHAR(50) NOT NULL
--);

--CREATE TABLE Tbl_Restoran_Mutfak_Kategorisi (
--	Restoran_Mutfak_Kategorisi_ID INT IDENTITY (1,1) PRIMARY KEY,
--    Restoran_ID INT FOREIGN KEY REFERENCES Tbl_Restoran (Restoran_ID) NOT NULL, 
--    Mutfak_Kat_ID INT FOREIGN KEY REFERENCES Tbl_Mutfak_Kategori (Mutfak_Kat_ID) NOT NULL 
--);

