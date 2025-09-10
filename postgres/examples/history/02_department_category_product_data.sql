TRUNCATE TABLE departments CASCADE;
INSERT INTO departments (name, location) VALUES ('Stratégiai Whimsy Iroda', 'Budapest');
INSERT INTO departments (name, location) VALUES ('Nem Hagyományos Megoldások Hivatala', 'Debrecen');
INSERT INTO departments (name, location) VALUES ('Képzeletbeli Erőforrások Osztálya', 'Szeged');
INSERT INTO departments (name, location) VALUES ('Kozmikus Koordinációs Osztály', 'Miskolc');
INSERT INTO departments (name, location) VALUES ('Alkalmazott Kíváncsiság Központ', 'Pécs');
INSERT INTO departments (name, location) VALUES ('A Holnapi Innovációk Minisztériuma', 'Győr');
INSERT INTO departments (name, location) VALUES ('Szinergetikus Csodák Ügynöksége', 'Nyíregyháza');
INSERT INTO departments (name, location) VALUES ('Hipotetikus Ügyek Intézete', 'Kecskemét');
INSERT INTO departments (name, location) VALUES ('Végtelen Lehetőségek Hivatala', 'Székesfehérvár');
INSERT INTO departments (name, location) VALUES ('Éteri Műveletek Osztálya', 'Szombathely');

TRUNCATE TABLE categories CASCADE;
-- Top-level categories (Fő kategóriák)
INSERT INTO categories (name, description, parent_id) VALUES ('Elektronika', 'Mindenféle elektronikai eszköz és készülék.', NULL);
INSERT INTO categories (name, description, parent_id) VALUES ('Ruházat', 'Férfi, női és gyermek ruházat.', NULL);
INSERT INTO categories (name, description, parent_id) VALUES ('Otthon és Kert', 'Otthonfelújítási és kertépítési termékek.', NULL);
INSERT INTO categories (name, description, parent_id) VALUES ('Sport és Szabadtér', 'Sportfelszerelések és szabadtéri eszközök.', NULL);
INSERT INTO categories (name, description, parent_id) VALUES ('Könyvek és Média', 'Könyvek, filmek, zene és egyéb médiatartalmak.', NULL);

-- Subcategories for Elektronika (Alkategóriák az Elektronikához)
INSERT INTO categories (name, description, parent_id) VALUES ('Okostelefonok', 'Modern okostelefonok fejlett funkciókkal.', 1);
INSERT INTO categories (name, description, parent_id) VALUES ('Laptopok', 'Hordozható számítógépek munka és szórakozás céljából.', 1);
INSERT INTO categories (name, description, parent_id) VALUES ('Fényképezőgépek', 'Fotók és videók készítésére szolgáló eszközök.', 1);
INSERT INTO categories (name, description, parent_id) VALUES ('Fejhallgatók', 'Személyes hanghallgatásra tervezett eszközök.', 1);
INSERT INTO categories (name, description, parent_id) VALUES ('Okosotthon Eszközök', 'Otthonautomatizálásra tervezett eszközök.', 1);

-- Subcategories for Ruházat (Alkategóriák a Ruházathoz)
INSERT INTO categories (name, description, parent_id) VALUES ('Férfi Ruházat', 'Férfiaknak tervezett ruházat.', 2);
INSERT INTO categories (name, description, parent_id) VALUES ('Női Ruházat', 'Nőknek tervezett ruházat.', 2);
INSERT INTO categories (name, description, parent_id) VALUES ('Gyermek Ruházat', 'Gyermekeknek tervezett ruházat.', 2);
INSERT INTO categories (name, description, parent_id) VALUES ('Cipők', 'Cipők minden alkalomra.', 2);
INSERT INTO categories (name, description, parent_id) VALUES ('Ruházati Kiegészítők', 'Övek, kalapok, sálak és egyéb kiegészítők.', 2);

-- Subcategories for Otthon és Kert (Alkategóriák az Otthon és Kerthez)
INSERT INTO categories (name, description, parent_id) VALUES ('Bútorok', 'Székek, asztalok és egyéb bútorok.', 3);
INSERT INTO categories (name, description, parent_id) VALUES ('Konyhai Eszközök', 'Főzéshez szükséges eszközök és készülékek.', 3);
INSERT INTO categories (name, description, parent_id) VALUES ('Díszítés', 'A lakótér szépítésére szolgáló tárgyak.', 3);
INSERT INTO categories (name, description, parent_id) VALUES ('Kerti Eszközök', 'A kert karbantartásához szükséges eszközök.', 3);
INSERT INTO categories (name, description, parent_id) VALUES ('Világítás', 'Lámpák és világítótestek beltérre és kültérre.', 3);

-- Subcategories for Sport és Szabadtér (Alkategóriák a Sport és Szabadtérhez)
INSERT INTO categories (name, description, parent_id) VALUES ('Fitnesz Eszközök', 'Edzőtermi és otthoni edzéshez szükséges eszközök.', 4);
INSERT INTO categories (name, description, parent_id) VALUES ('Kemping Felszerelések', 'Túrázáshoz és kempingezéshez szükséges eszközök.', 4);
INSERT INTO categories (name, description, parent_id) VALUES ('Kerékpározás', 'Kerékpárok és kiegészítők.', 4);
INSERT INTO categories (name, description, parent_id) VALUES ('Csapatsportok', 'Focibajnokság, kosárlabda és egyéb csapatsportok eszközei.', 4);
INSERT INTO categories (name, description, parent_id) VALUES ('Szabadtéri Ruházat', 'Szabadtéri tevékenységekre tervezett ruházat.', 4);

-- Subcategories for Könyvek és Média (Alkategóriák a Könyvek és Médiához)
INSERT INTO categories (name, description, parent_id) VALUES ('Regények', 'Kitalált történetek és regények.', 5);
INSERT INTO categories (name, description, parent_id) VALUES ('Ismeretterjesztő Könyvek', 'Valós eseményekre és tényekre épülő könyvek.', 5);
INSERT INTO categories (name, description, parent_id) VALUES ('Filmek', 'Szórakoztató és oktató filmek.', 5);
INSERT INTO categories (name, description, parent_id) VALUES ('Zene', 'Albumok és kislemezek különböző előadóktól.', 5);
INSERT INTO categories (name, description, parent_id) VALUES ('E-könyvek', 'Online olvasásra tervezett digitális könyvek.', 5);

-- Sub-subcategories for Okostelefonok (Alkategóriák az Okostelefonokhoz)
INSERT INTO categories (name, description, parent_id) VALUES ('Android Telefonok', 'Android operációs rendszert futtató okostelefonok.', 6);
INSERT INTO categories (name, description, parent_id) VALUES ('iPhone-ok', 'Apple által tervezett okostelefonok.', 6);
INSERT INTO categories (name, description, parent_id) VALUES ('Okostelefon Kiegészítők', 'Tokok, töltők és egyéb kiegészítők okostelefonokhoz.', 6);

-- Sub-subcategories for Laptopok (Alkategóriák a Laptopokhoz)
INSERT INTO categories (name, description, parent_id) VALUES ('Játék Laptopok', 'Nagy teljesítményű laptopok játékhoz.', 7);
INSERT INTO categories (name, description, parent_id) VALUES ('Üzleti Laptopok', 'Termelékenységre tervezett laptopok.', 7);
INSERT INTO categories (name, description, parent_id) VALUES ('Laptop Kiegészítők', 'Táskák, egerek és egyéb kiegészítők laptopokhoz.', 7);

-- Sub-subcategories for Fényképezőgépek (Alkategóriák a Fényképezőgépekhez)
INSERT INTO categories (name, description, parent_id) VALUES ('DSLR Fényképezőgépek', 'Professzionális fényképezőgépek.', 8);
INSERT INTO categories (name, description, parent_id) VALUES ('Tükör nélküli fényképezőgépek', 'Kompakt és sokoldalú fényképezőgépek.', 8);
INSERT INTO categories (name, description, parent_id) VALUES ('Akciókamerák', 'Kalandok rögzítésére tervezett kamerák.', 8);

-- Sub-subcategories for Fejhallgatók (Alkategóriák a Fejhallgatókhoz)
INSERT INTO categories (name, description, parent_id) VALUES ('Vezeték nélküli Fejhallgatók', 'Zsinór nélküli fejhallgatók.', 9);
INSERT INTO categories (name, description, parent_id) VALUES ('Zajszűrős Fejhallgatók', 'Zajcsökkentéssel rendelkező fejhallgatók.', 9);
INSERT INTO categories (name, description, parent_id) VALUES ('Fülhallgatók', 'Kisméretű és hordozható fülhallgatók.', 9);

-- Sub-subcategories for Férfi Ruházat (Alkategóriák a Férfi Ruházathoz)
INSERT INTO categories (name, description, parent_id) VALUES ('Pólók', 'Férfi pólók mindennapi és sportos viselethez.', 11);
INSERT INTO categories (name, description, parent_id) VALUES ('Nadrágok', 'Farmernadrágok, egyéb nadrágok férfiaknak.', 11);
INSERT INTO categories (name, description, parent_id) VALUES ('Kabátok', 'Téli és téli kabátok férfiaknak.', 11);

TRUNCATE TABLE products CASCADE;
-- Products for Okostelefonok (category_id = 6)
INSERT INTO products (name, category_id) VALUES ('Samsung Galaxy S23', 6);
INSERT INTO products (name, category_id) VALUES ('iPhone 14 Pro', 6);
INSERT INTO products (name, category_id) VALUES ('Xiaomi Redmi Note 12', 6);
INSERT INTO products (name, category_id) VALUES ('Google Pixel 7', 6);
INSERT INTO products (name, category_id) VALUES ('OnePlus 10T', 6);

-- Products for Android Telefonok (category_id = 31)
INSERT INTO products (name, category_id) VALUES ('Samsung Galaxy A54', 31);
INSERT INTO products (name, category_id) VALUES ('Xiaomi Poco X5', 31);
INSERT INTO products (name, category_id) VALUES ('Realme 9 Pro', 31);
INSERT INTO products (name, category_id) VALUES ('Oppo Reno 8', 31);
INSERT INTO products (name, category_id) VALUES ('Huawei P50', 31);

-- Products for iPhone-ok (category_id = 32)
INSERT INTO products (name, category_id) VALUES ('iPhone SE 2023', 32);
INSERT INTO products (name, category_id) VALUES ('iPhone 13', 32);
INSERT INTO products (name, category_id) VALUES ('iPhone 12 Mini', 32);
INSERT INTO products (name, category_id) VALUES ('iPhone 11', 32);
INSERT INTO products (name, category_id) VALUES ('iPhone XR', 32);

-- Products for Laptopok (category_id = 7)
INSERT INTO products (name, category_id) VALUES ('Dell XPS 13', 7);
INSERT INTO products (name, category_id) VALUES ('MacBook Air M2', 7);
INSERT INTO products (name, category_id) VALUES ('Lenovo ThinkPad X1', 7);
INSERT INTO products (name, category_id) VALUES ('HP Spectre x360', 7);
INSERT INTO products (name, category_id) VALUES ('Asus ZenBook 14', 7);

-- Products for Játék Laptopok (category_id = 34)
INSERT INTO products (name, category_id) VALUES ('Asus ROG Zephyrus G14', 34);
INSERT INTO products (name, category_id) VALUES ('Acer Predator Helios 300', 34);
INSERT INTO products (name, category_id) VALUES ('MSI GE76 Raider', 34);
INSERT INTO products (name, category_id) VALUES ('Razer Blade 15', 34);
INSERT INTO products (name, category_id) VALUES ('Lenovo Legion 5', 34);

-- Products for Üzleti Laptopok (category_id = 35)
INSERT INTO products (name, category_id) VALUES ('Dell Latitude 5430', 35);
INSERT INTO products (name, category_id) VALUES ('HP EliteBook 840', 35);
INSERT INTO products (name, category_id) VALUES ('Lenovo ThinkPad T14', 35);
INSERT INTO products (name, category_id) VALUES ('Apple MacBook Pro 14', 35);
INSERT INTO products (name, category_id) VALUES ('Microsoft Surface Laptop 4', 35);

-- Products for Fényképezőgépek (category_id = 8)
INSERT INTO products (name, category_id) VALUES ('Canon EOS R5', 8);
INSERT INTO products (name, category_id) VALUES ('Sony Alpha 7 IV', 8);
INSERT INTO products (name, category_id) VALUES ('Nikon Z6 II', 8);
INSERT INTO products (name, category_id) VALUES ('Fujifilm X-T4', 8);
INSERT INTO products (name, category_id) VALUES ('Panasonic Lumix GH6', 8);

-- Products for DSLR Fényképezőgépek (category_id = 37)
INSERT INTO products (name, category_id) VALUES ('Canon EOS 5D Mark IV', 37);
INSERT INTO products (name, category_id) VALUES ('Nikon D850', 37);
INSERT INTO products (name, category_id) VALUES ('Pentax K-1 Mark II', 37);
INSERT INTO products (name, category_id) VALUES ('Sony Alpha 99 II', 37);
INSERT INTO products (name, category_id) VALUES ('Canon EOS 90D', 37);

-- Products for Tükör nélküli fényképezőgépek (category_id = 38)
INSERT INTO products (name, category_id) VALUES ('Sony Alpha 6400', 38);
INSERT INTO products (name, category_id) VALUES ('Fujifilm X-S10', 38);
INSERT INTO products (name, category_id) VALUES ('Canon EOS M50 Mark II', 38);
INSERT INTO products (name, category_id) VALUES ('Olympus OM-D E-M10 Mark IV', 38);
INSERT INTO products (name, category_id) VALUES ('Panasonic Lumix G100', 38);

-- Products for Fejhallgatók (category_id = 9)
INSERT INTO products (name, category_id) VALUES ('Sony WH-1000XM5', 9);
INSERT INTO products (name, category_id) VALUES ('Bose QuietComfort 45', 9);
INSERT INTO products (name, category_id) VALUES ('Sennheiser Momentum 4', 9);
INSERT INTO products (name, category_id) VALUES ('Apple AirPods Max', 9);
INSERT INTO products (name, category_id) VALUES ('Jabra Elite 85h', 9);

-- Products for Vezeték nélküli Fejhallgatók (category_id = 40)
INSERT INTO products (name, category_id) VALUES ('Sony WF-1000XM4', 40);
INSERT INTO products (name, category_id) VALUES ('Bose QuietComfort Earbuds', 40);
INSERT INTO products (name, category_id) VALUES ('Samsung Galaxy Buds2 Pro', 40);
INSERT INTO products (name, category_id) VALUES ('Apple AirPods Pro', 40);
INSERT INTO products (name, category_id) VALUES ('Jabra Elite 7 Pro', 40);

-- Products for Zajszűrős Fejhallgatók (category_id = 41)
INSERT INTO products (name, category_id) VALUES ('Sony WH-CH720N', 41);
INSERT INTO products (name, category_id) VALUES ('Bose Noise Cancelling Headphones 700', 41);
INSERT INTO products (name, category_id) VALUES ('Sennheiser HD 450BT', 41);
INSERT INTO products (name, category_id) VALUES ('JBL Live 660NC', 41);
INSERT INTO products (name, category_id) VALUES ('Anker Soundcore Life Q30', 41);

-- Products for Fülhallgatók (category_id = 42)
INSERT INTO products (name, category_id) VALUES ('Apple AirPods 3', 42);
INSERT INTO products (name, category_id) VALUES ('Samsung Galaxy Buds Live', 42);
INSERT INTO products (name, category_id) VALUES ('Jabra Elite 3', 42);
INSERT INTO products (name, category_id) VALUES ('Sony WF-C500', 42);
INSERT INTO products (name, category_id) VALUES ('Anker Soundcore Liberty Air 2', 42);

-- Products for Férfi Ruházat (category_id = 11)
INSERT INTO products (name, category_id) VALUES ('Férfi póló - fekete', 11);
INSERT INTO products (name, category_id) VALUES ('Férfi póló - fehér', 11);
INSERT INTO products (name, category_id) VALUES ('Férfi póló - kék', 11);
INSERT INTO products (name, category_id) VALUES ('Férfi póló - zöld', 11);
INSERT INTO products (name, category_id) VALUES ('Férfi póló - piros', 11);

-- Products for Női Ruházat (category_id = 12)
INSERT INTO products (name, category_id) VALUES ('Női blúz - fekete', 12);
INSERT INTO products (name, category_id) VALUES ('Női blúz - fehér', 12);
INSERT INTO products (name, category_id) VALUES ('Női blúz - rózsaszín', 12);
INSERT INTO products (name, category_id) VALUES ('Női blúz - kék', 12);
INSERT INTO products (name, category_id) VALUES ('Női blúz - lila', 12);

-- Products for Gyermek Ruházat (category_id = 13)
INSERT INTO products (name, category_id) VALUES ('Gyermek póló - kék', 13);
INSERT INTO products (name, category_id) VALUES ('Gyermek póló - piros', 13);
INSERT INTO products (name, category_id) VALUES ('Gyermek póló - zöld', 13);
INSERT INTO products (name, category_id) VALUES ('Gyermek póló - sárga', 13);
INSERT INTO products (name, category_id) VALUES ('Gyermek póló - narancs', 13);

-- Products for Cipők (category_id = 14)
INSERT INTO products (name, category_id) VALUES ('Férfi cipő - fekete', 14);
INSERT INTO products (name, category_id) VALUES ('Férfi cipő - barna', 14);
INSERT INTO products (name, category_id) VALUES ('Női cipő - fehér', 14);
INSERT INTO products (name, category_id) VALUES ('Női cipő - fekete', 14);
INSERT INTO products (name, category_id) VALUES ('Gyermek cipő - kék', 14);

-- Products for Bútorok (category_id = 16)
INSERT INTO products (name, category_id) VALUES ('Kanapé - szürke', 16);
INSERT INTO products (name, category_id) VALUES ('Fotel - barna', 16);
INSERT INTO products (name, category_id) VALUES ('Asztal - fehér', 16);
INSERT INTO products (name, category_id) VALUES ('Szék - fekete', 16);
INSERT INTO products (name, category_id) VALUES ('Ágy - fehér', 16);

-- Products for Konyhai Eszközök (category_id = 17)
INSERT INTO products (name, category_id) VALUES ('Kés szett', 17);
INSERT INTO products (name, category_id) VALUES ('Serpenyő - 24 cm', 17);
INSERT INTO products (name, category_id) VALUES ('Főzőkészlet', 17);
INSERT INTO products (name, category_id) VALUES ('Kávéfőző', 17);
INSERT INTO products (name, category_id) VALUES ('Robotgép', 17);

-- Products for Fitnesz Eszközök (category_id = 21)
INSERT INTO products (name, category_id) VALUES ('Futópad', 21);
INSERT INTO products (name, category_id) VALUES ('Spinbike', 21);
INSERT INTO products (name, category_id) VALUES ('Súlyzó szett', 21);
INSERT INTO products (name, category_id) VALUES ('Edzőgumi', 21);
INSERT INTO products (name, category_id) VALUES ('Jógamatrac', 21);

-- Products for Könyvek (category_id = 26)
INSERT INTO products (name, category_id) VALUES ('A Gyűrűk Ura', 26);
INSERT INTO products (name, category_id) VALUES ('Harry Potter és a Bölcsek Köve', 26);
INSERT INTO products (name, category_id) VALUES ('1984', 26);
INSERT INTO products (name, category_id) VALUES ('Az Alkimista', 26);
INSERT INTO products (name, category_id) VALUES ('A kis herceg', 26);

-- Products for Filmek (category_id = 28)
INSERT INTO products (name, category_id) VALUES ('A Gyűrűk Ura trilógia', 28);
INSERT INTO products (name, category_id) VALUES ('Star Wars: Skywalker saga', 28);
INSERT INTO products (name, category_id) VALUES ('Harry Potter gyűjtemény', 28);
INSERT INTO products (name, category_id) VALUES ('Marvel: Végjáték', 28);
INSERT INTO products (name, category_id) VALUES ('Avatar', 28);

-- Products for Zene (category_id = 29)
INSERT INTO products (name, category_id) VALUES ('Queen: Greatest Hits', 29);
INSERT INTO products (name, category_id) VALUES ('Michael Jackson: Thriller', 29);
INSERT INTO products (name, category_id) VALUES ('The Beatles: Abbey Road', 29);
INSERT INTO products (name, category_id) VALUES ('Adele: 25', 29);
INSERT INTO products (name, category_id) VALUES ('Ed Sheeran: ÷', 29);

-- Products for E-könyvek (category_id = 30)
INSERT INTO products (name, category_id) VALUES ('A Gyűrűk Ura (e-könyv)', 30);
INSERT INTO products (name, category_id) VALUES ('Harry Potter és a Bölcsek Köve (e-könyv)', 30);
INSERT INTO products (name, category_id) VALUES ('1984 (e-könyv)', 30);
INSERT INTO products (name, category_id) VALUES ('Az Alkimista (e-könyv)', 30);
INSERT INTO products (name, category_id) VALUES ('A kis herceg (e-könyv)', 30);

-- Products for Okosotthon Eszközök (category_id = 10)
INSERT INTO products (name, category_id) VALUES ('Okos izzó - Philips Hue', 10);
INSERT INTO products (name, category_id) VALUES ('Okos hőmérséklet szabályozó', 10);
INSERT INTO products (name, category_id) VALUES ('Okos hangszóró - Sonos One', 10);
INSERT INTO products (name, category_id) VALUES ('Okos biztonsági kamera', 10);
INSERT INTO products (name, category_id) VALUES ('Okos zár - August Smart Lock', 10);

-- Products for Kerti Eszközök (category_id = 19)
INSERT INTO products (name, category_id) VALUES ('Fűnyíró', 19);
INSERT INTO products (name, category_id) VALUES ('Kerti olló', 19);
INSERT INTO products (name, category_id) VALUES ('Kerti locsoló rendszer', 19);
INSERT INTO products (name, category_id) VALUES ('Kerti tároló doboz', 19);
INSERT INTO products (name, category_id) VALUES ('Kerti szék', 19);

-- Products for Világítás (category_id = 20)
INSERT INTO products (name, category_id) VALUES ('Asztali lámpa', 20);
INSERT INTO products (name, category_id) VALUES ('Fali lámpa', 20);
INSERT INTO products (name, category_id) VALUES ('Mennyezeti lámpa', 20);
INSERT INTO products (name, category_id) VALUES ('Kültéri lámpa', 20);
INSERT INTO products (name, category_id) VALUES ('LED szalag', 20);

-- Products for Kemping Felszerelések (category_id = 22)
INSERT INTO products (name, category_id) VALUES ('Sátor', 22);
INSERT INTO products (name, category_id) VALUES ('Hálózsák', 22);
INSERT INTO products (name, category_id) VALUES ('Hátizsák', 22);
INSERT INTO products (name, category_id) VALUES ('Kemping főzőkészlet', 22);
INSERT INTO products (name, category_id) VALUES ('Kemping szék', 22);

-- Products for Kerékpározás (category_id = 23)
INSERT INTO products (name, category_id) VALUES ('Hegykerekék', 23);
INSERT INTO products (name, category_id) VALUES ('Városi kerékpár', 23);
INSERT INTO products (name, category_id) VALUES ('Gyerek kerékpár', 23);
INSERT INTO products (name, category_id) VALUES ('Kerékpár sisak', 23);
INSERT INTO products (name, category_id) VALUES ('Kerékpár lámpa', 23);

-- Products for Csapatsportok (category_id = 24)
INSERT INTO products (name, category_id) VALUES ('Foci labda', 24);
INSERT INTO products (name, category_id) VALUES ('Kosárlabda', 24);
INSERT INTO products (name, category_id) VALUES ('Röplabda', 24);
INSERT INTO products (name, category_id) VALUES ('Baseball ütő', 24);
INSERT INTO products (name, category_id) VALUES ('Rugball', 24);

-- Products for Szabadtéri Ruházat (category_id = 25)
INSERT INTO products (name, category_id) VALUES ('Szélálló kabát', 25);
INSERT INTO products (name, category_id) VALUES ('Túrabakancs', 25);
INSERT INTO products (name, category_id) VALUES ('Túrazsák', 25);
INSERT INTO products (name, category_id) VALUES ('Esőkabát', 25);
INSERT INTO products (name, category_id) VALUES ('Téli sapka', 25);

-- Products for Ismeretterjesztő Könyvek (category_id = 27)
INSERT INTO products (name, category_id) VALUES ('A test könyve', 27);
INSERT INTO products (name, category_id) VALUES ('A világ történelme', 27);
INSERT INTO products (name, category_id) VALUES ('A pénz pszichológiája', 27);
INSERT INTO products (name, category_id) VALUES ('Az élet titkai', 27);
INSERT INTO products (name, category_id) VALUES ('A tudomány csodái', 27);



INSERT INTO products (name, category_id) VALUES ('Férfi öv - barna', 15);
INSERT INTO products (name, category_id) VALUES ('Férfi öv - fekete', 15);
INSERT INTO products (name, category_id) VALUES ('Női sál - piros', 15);
INSERT INTO products (name, category_id) VALUES ('Női sál - kék', 15);
INSERT INTO products (name, category_id) VALUES ('Férfi kesztyű - barna', 15);

INSERT INTO products (name, category_id) VALUES ('Fali kép - tájképes', 18);
INSERT INTO products (name, category_id) VALUES ('Fali kép - modern', 18);
INSERT INTO products (name, category_id) VALUES ('Vázák szett - üveg', 18);
INSERT INTO products (name, category_id) VALUES ('Díszpárna - színes', 18);
INSERT INTO products (name, category_id) VALUES ('Díszpárna - geometrikus', 18);

INSERT INTO products (name, category_id) VALUES ('Okostelefon tok - szilikon', 33);
INSERT INTO products (name, category_id) VALUES ('Okostelefon tok - bőr', 33);
INSERT INTO products (name, category_id) VALUES ('Okostelefon tok - átlátszó', 33);
INSERT INTO products (name, category_id) VALUES ('Okostelefon tok - műanyag', 33);
INSERT INTO products (name, category_id) VALUES ('Okostelefon tok - fém', 33);

INSERT INTO products (name, category_id) VALUES ('Sony Alpha 7C', 36);
INSERT INTO products (name, category_id) VALUES ('Fujifilm X-T30', 36);
INSERT INTO products (name, category_id) VALUES ('Canon EOS R7', 36);
INSERT INTO products (name, category_id) VALUES ('Nikon Z50', 36);
INSERT INTO products (name, category_id) VALUES ('Panasonic Lumix G9', 36);

INSERT INTO products (name, category_id) VALUES ('Sony WH-1000XM4', 39);
INSERT INTO products (name, category_id) VALUES ('Bose QuietComfort 35 II', 39);
INSERT INTO products (name, category_id) VALUES ('Sennheiser PXC 550-II', 39);
INSERT INTO products (name, category_id) VALUES ('JBL Tour One', 39);
INSERT INTO products (name, category_id) VALUES ('Apple AirPods Max2', 39);

INSERT INTO products (name, category_id) VALUES ('Apple AirPods 2', 43);
INSERT INTO products (name, category_id) VALUES ('Samsung Galaxy Buds Pro', 43);
INSERT INTO products (name, category_id) VALUES ('Jabra Elite 75t', 43);
INSERT INTO products (name, category_id) VALUES ('Sony WF-SP800N', 43);
INSERT INTO products (name, category_id) VALUES ('Anker Soundcore Liberty Air 2 Pro', 43);

INSERT INTO products (name, category_id) VALUES ('Kemping háló', 44);
INSERT INTO products (name, category_id) VALUES ('Kemping asztal', 44);
INSERT INTO products (name, category_id) VALUES ('Kemping ágy', 44);
INSERT INTO products (name, category_id) VALUES ('Kemping lámpa', 44);
INSERT INTO products (name, category_id) VALUES ('Kemping tűzhely', 44);

INSERT INTO products (name, category_id) VALUES ('Kerékpár sisak piros', 45);
INSERT INTO products (name, category_id) VALUES ('Kerékpár lámpa kínai', 45);
INSERT INTO products (name, category_id) VALUES ('Kerékpár zár', 45);
INSERT INTO products (name, category_id) VALUES ('Kerékpár pumpa', 45);
INSERT INTO products (name, category_id) VALUES ('Kerékpár kesztyű', 45);