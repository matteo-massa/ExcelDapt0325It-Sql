CREATE DATABASE IF NOT EXISTS AziendaStore;
USE AziendaStore;

START TRANSACTION;

CREATE TABLE IF NOT EXISTS Region (
    RegionID INT PRIMARY KEY AUTO_INCREMENT,
    Citta VARCHAR(100),
    Regione VARCHAR(100),
    AreaGeografica VARCHAR(100)
);

-- 2. Creazione tabella Store
CREATE TABLE IF NOT EXISTS Store (
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    NomeStore VARCHAR(100),
    DataApertura DATE,
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

-- 3. Popolamento tabelle con dati esemplificativi
INSERT INTO Region (Citta, Regione, AreaGeografica)
VALUES 
('Milano', 'Lombardia', 'Nord'),
('Firenze', 'Toscana', 'Centro'),
('Bari', 'Puglia', 'Sud');

INSERT INTO Store (NomeStore, DataApertura, RegionID)
VALUES 
('Store Milano Centrale', '2020-03-15', 1),
('Store Firenze Centro', '2021-06-10', 2),
('Store Bari Vecchia', '2019-11-05', 3);

-- 4. Operazioni di modifica
UPDATE Store
SET NomeStore = 'Store Firenze Santa Maria Novella'
WHERE NomeStore = 'Store Firenze Centro';

UPDATE Region
SET Citta = 'Milano Porta Garibaldi'
WHERE RegionID = 1;

-- 5. Operazioni di eliminazione
DELETE FROM Store
WHERE NomeStore = 'Store Bari Vecchia';




SHOW DATABASES;
USE AziendaStore;
DESCRIBE Store;
DESCRIBE Region;
SELECT * FROM Region;
SELECT * FROM Store;
SELECT s.StoreID, s.NomeStore, s.DataApertura, r.Citta, r.Regione, r.AreaGeografica
FROM Store s
JOIN Region r ON s.RegionID = r.RegionID;
SELECT * FROM Store WHERE StoreID = 3;
CREATE VIEW VistaStoreRegion AS
SELECT s.NomeStore, s.DataApertura, r.Citta, r.Regione, r.AreaGeografica
FROM Store s
JOIN Region r ON s.RegionID = r.RegionID;
SELECT * FROM VistaStoreRegion;