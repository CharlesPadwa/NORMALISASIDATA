-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Nov 2023 pada 14.21
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basisdata`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `Kode_Brg` varchar(5) NOT NULL,
  `no_jual` varchar(5) NOT NULL,
  `Nama_Brg` varchar(20) NOT NULL,
  `Harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`Kode_Brg`, `no_jual`, `Nama_Brg`, `Harga`) VALUES
('b001', 'j002', 'Lemari', 13000000),
('b002', 'j001', 'Kulkas', 23000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(5) NOT NULL,
  `nama_customer` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`) VALUES
('c001', 'Ryan'),
('C002', 'Moses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_brg`
--

CREATE TABLE `db_brg` (
  `kode_Brg` varchar(5) NOT NULL,
  `no_jual` varchar(5) DEFAULT NULL,
  `qty_penjualan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `db_brg`
--

INSERT INTO `db_brg` (`kode_Brg`, `no_jual`, `qty_penjualan`) VALUES
('b001', 'j002', '1'),
('b002', 'j001', '2 ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(5) NOT NULL,
  `tgl_jual` varchar(10) DEFAULT NULL,
  `id_customer` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan_brg`
--

INSERT INTO `penjualan_brg` (`no_jual`, `tgl_jual`, `id_customer`) VALUES
('j001', '03/02/2020', 'c001'),
('j002', '12/02/2020', 'C002');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Kode_Brg`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `db_brg`
--
ALTER TABLE `db_brg`
  ADD PRIMARY KEY (`kode_Brg`),
  ADD KEY `no_jual` (`no_jual`);

--
-- Indeks untuk tabel `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD PRIMARY KEY (`no_jual`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`Kode_Brg`) REFERENCES `db_brg` (`kode_Brg`);

--
-- Ketidakleluasaan untuk tabel `db_brg`
--
ALTER TABLE `db_brg`
  ADD CONSTRAINT `db_brg_ibfk_1` FOREIGN KEY (`no_jual`) REFERENCES `penjualan_brg` (`no_jual`);

--
-- Ketidakleluasaan untuk tabel `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
