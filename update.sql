--- DML --> UPDATE
CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

SELECT * FROM tedarikciler 
SELECT * FROM urunler

--  vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
		UPDATE tedarikciler 
		SET firma_ismi = 'Vestel' WHERE vergi_no=102; 
		
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
		UPDATE tedarikciker
		SET firma_ismi = 'Casper', irtibat_ismi ='Ali Veli' WHERE vergi_no =101;
			
--  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
		UPDATE urunler 
		SET urun_isim = 'TELEFON' 
		WHERE urun_isim ='Phone'
		
--  urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
		UPDATE urunler 
		SET urun_id = urun_id+1 WHERE urun_id > 1004

--  urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
		UPDATE urunler
		SET urun_id = urun_id+ted_vergino 
		
-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
--Bu soruda tedarikciler ve urunler tablosunu yeniden olusturduk
		UPDATE urunler 
		SET urun_isim = (SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi ='Adam Eve')
		WHERE musteri_isim = 'Ali Bak';

SELECT * FROM urunler

--urunler tablosundsan laptop satin alan musterilerin ismini, firma_ismi Apple'in irtibat_isim' i ile degistirin
UPDATE 
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi = 'Apple')  
WHERE urun_isim = 'Laptop'





