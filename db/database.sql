-- Buat database
CREATE DATABASE IF NOT EXISTS assessment_system;
USE assessment_system;

-- Tabel users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('Manajemen TI', 'Admin', 'Tim Penilai', 'IT Auditor') NOT NULL,
    company VARCHAR(100) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel activity_logs (untuk memantau aktivitas user)
CREATE TABLE activity_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabel questions (untuk menyimpan daftar pertanyaan audit)
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    framework ENUM('ITIL', 'ISO 27002', 'COBIT') NOT NULL,
    focus_area VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    question_number INT NOT NULL,
    iso_code VARCHAR(50),
    cobit_code VARCHAR(50),
    maturity_level ENUM('I', 'II', 'III', 'IV', 'V') NOT NULL,
    question TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel self_assessments (untuk menyimpan jawaban self-assessment)
CREATE TABLE self_assessments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    assessment TEXT NOT NULL,
    score INT DEFAULT NULL,
    status ENUM('Pending', 'Verified') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

-- Tabel audit_history (untuk menyimpan riwayat audit)
CREATE TABLE audit_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    description TEXT NOT NULL,
    result TEXT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabel recommendations (untuk menyimpan rekomendasi perbaikan)
CREATE TABLE recommendations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    auditor_id INT NOT NULL,
    user_id INT NOT NULL,
    recommendation TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (auditor_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabel rankings (untuk menyimpan peringkat berdasarkan skor maturity)
CREATE TABLE rankings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    rank INT NOT NULL,
    score INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Data awal untuk tabel users
INSERT INTO users (username, password, role, company) VALUES
('admin', MD5('admin123'), 'Admin', 'Central IT'),
('manager1', MD5('manager123'), 'Manajemen TI', 'Company A'),
('auditor1', MD5('audit123'), 'IT Auditor', 'Audit Firm'),
('evaluator1', MD5('evaluator123'), 'Tim Penilai', 'Evaluation Team');

-- Data awal untuk tabel questions
INSERT INTO questions (framework, focus_area, category, question_number, iso_code, cobit_code, maturity_level, question)
VALUES
('ISO 27002', 'Kebijakan Keamanan', 'Dokumen Kebijakan Keamanan Informasi', 1, '1.1.1', 'DS1.2 DS1.3', 'I', 'Apakah terdapat dokumen Kebijakan Keamanan Informasi yang sudah disetujui oleh pihak manajemen dan telah dikomunikasikan kepada seluruh karyawan?'),
('ISO 27002', 'Kebijakan Keamanan', 'Review Dokumen Kebijakan Informasi', 3, '1.1.2', 'DS1.4 DS1.5', 'II', 'Apakah terdapat penanggung jawab terhadap dokumen Kebijakan Keamanan Informasi, baik untuk melakukan perubahan maupun penilaian pencapaian?'),
('ITIL', 'Service Strategy', 'Komitmen Manajemen Organisasi', 4, NULL, 'DS1.4', 'I', 'Apakah terdapat forum yang membahas keamanan informasi?'),
('COBIT', 'Struktur Organisasi', 'Koordinasi Keamanan', 5, NULL, 'DS1.4', 'I', 'Apakah terdapat forum koordinasi/kontrol pengimplementasian manajemen keamanan informasi?');

-- Data awal untuk tabel self_assessments (opsional untuk testing)
INSERT INTO self_assessments (user_id, question_id, assessment, score, status)
VALUES
(2, 1, 'Dokumen tersedia dan dikomunikasikan.', 85, 'Verified'),
(2, 2, 'Penanggung jawab telah ditentukan.', 90, 'Verified');

-- Data awal untuk tabel audit_history (opsional untuk testing)
INSERT INTO audit_history (user_id, description, result)
VALUES
(2, 'Audit keamanan informasi untuk tahun 2025.', 'Lulus'),
(2, 'Penilaian ulang keamanan data.', 'Memerlukan perbaikan.');

-- Data awal untuk tabel recommendations (opsional untuk testing)
INSERT INTO recommendations (auditor_id, user_id, recommendation)
VALUES
(3, 2, 'Dokumen keamanan harus diperbarui setiap tahun.'),
(3, 2, 'Tingkatkan pelatihan keamanan untuk karyawan.');

-- Data awal untuk tabel rankings (opsional untuk testing)
INSERT INTO rankings (user_id, rank, score)
VALUES
(2, 1, 87),
(4, 2, 75);
