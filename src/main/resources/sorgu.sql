-- Önce varsa önceki tabloları temizleyelim (opsiyonel)
DROP TABLE IF EXISTS operation CASCADE;
DROP TABLE IF EXISTS surgery CASCADE;
DROP TABLE IF EXISTS patient CASCADE;
DROP TABLE IF EXISTS nurse CASCADE;
DROP TABLE IF EXISTS doctor CASCADE;
-- 1) doctor tablosunu oluştur
CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    surname VARCHAR,
    proficiency VARCHAR
);

-- 2) nurse tablosunu oluştur
CREATE TABLE nurse (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    surname VARCHAR,
    proficiency VARCHAR
);

-- 3) patient tablosunu oluştur
CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    surname VARCHAR,
    email VARCHAR,
    complaint TEXT
);

-- 4) surgery tablosunu oluştur
CREATE TABLE surgery (
    id SERIAL PRIMARY KEY,
    nurse_id BIGINT,
    patient_id BIGINT,
    doctor_id BIGINT,
    FOREIGN KEY (nurse_id) REFERENCES nurse(id),
    FOREIGN KEY (patient_id) REFERENCES patient(id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(id)
);

-- 5) operation tablosunu oluştur
CREATE TABLE operation (
    id SERIAL PRIMARY KEY,
    patient_id BIGINT,
    doctor_id BIGINT,
    FOREIGN KEY (patient_id) REFERENCES patient(id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(id)
);
