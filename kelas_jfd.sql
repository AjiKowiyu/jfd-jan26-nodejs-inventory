-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 13 Mar 2026 pada 15.30
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kelas_jfd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `id` int(11) NOT NULL,
  `nama` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `agama`
--

INSERT INTO `agama` (`id`, `nama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Catholic'),
(4, 'Buddha'),
(5, 'Hindu'),
(6, 'Konghucu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `departemen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`, `departemen`) VALUES
(1, 'Staff', 'IT'),
(2, 'Asst SPV', 'IT'),
(3, 'Manager', 'Accounting'),
(4, 'General Manager', 'Purchasing'),
(5, 'Direktur', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text DEFAULT NULL,
  `agama_id` int(11) DEFAULT NULL,
  `jabatan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `agama_id`, `jabatan_id`) VALUES
(25, 'Aji Kowiyu', '2026-02-14', 'L', 'Pluit, jakarta utara', NULL, 1),
(26, 'Gibran', '2026-02-28', 'L', 'Solo', NULL, 1),
(27, 'Jokowi', '2026-02-21', 'L', 'Solo man', NULL, 1),
(28, 'Bahlil', '2026-02-25', 'L', 'Pom Bensin', 1, 1),
(29, 'Natalius Pigai', '2026-02-25', 'L', 'Papua Barat', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_produk`
--

CREATE TABLE `master_produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(500) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `master_produk`
--

INSERT INTO `master_produk` (`id`, `kode`, `nama`, `deskripsi`, `foto`) VALUES
(1, 'WFTCOK100', 'Wafer Tango Coklat 100ML', NULL, NULL),
(2, 'KAG50', 'KOPI KAPAL API GULA 50ML', NULL, NULL),
(3, 'lemin800', 'le minerale 800 ml', 'air botol manis gimmick', NULL),
(4, 'AQUA800', 'Aqua 800 ml', 'Aqua danone', NULL),
(5, 'IDMIEGOR', 'Indomie goreng', 'Mie goreng tapi direbus', NULL),
(7, 'AQUA800', 'alasdlakjsd', 'woieuowieur', NULL),
(11, 'KOPIKOHTM9', '', '', NULL),
(12, 'ADEMSARI', '', '', 'ademsari-260304_214334.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_produk`
--

CREATE TABLE `stok_produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL COMMENT 'kode_produk',
  `stok_masuk` int(11) NOT NULL,
  `stok_keluar` int(11) NOT NULL,
  `stok_sisa` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL COMMENT 'id_user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stok_produk`
--

INSERT INTO `stok_produk` (`id`, `kode`, `stok_masuk`, `stok_keluar`, `stok_sisa`, `created_at`, `created_by`) VALUES
(1, 'WFTCOK100', 80, 0, 80, '2026-03-06 21:54:37', 1),
(3, 'WFTCOK100', 10, 0, 90, '2026-03-06 21:57:15', 2),
(4, 'KAG50', 10, 0, 10, '2026-03-06 21:57:53', 2),
(5, 'KAG50', 55, 0, 65, '2026-03-06 21:58:21', 2),
(6, 'WFTCOK100', 20, 0, 110, '2026-03-06 21:58:49', 2),
(10, 'IDMIEGOR', 9500, 0, 9500, '2026-03-09 19:31:09', 2),
(11, 'IDMIEGOR', 0, 500, 9000, '2026-03-09 20:06:12', 2),
(12, 'KOPIKOHTM9', 0, 10, -10, '2026-03-09 20:06:41', 2),
(13, 'KOPIKOHTM9', 100, 0, 90, '2026-03-09 20:07:11', 2),
(14, 'WFTCOK100', 0, 109, 1, '2026-03-11 21:12:12', 1),
(15, 'KAG50', 0, 65, 0, '2026-03-11 21:12:36', 1),
(16, 'IDMIEGOR', 0, 5700, 3300, '2026-03-11 21:36:25', 1),
(17, 'KAG50', 20, 0, 20, '2026-03-11 21:53:27', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `role` enum('STA','SPV','MGR','DIR') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `id_karyawan`, `role`) VALUES
(1, 'aji.kowiyu', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 1, 'STA'),
(2, 'boy', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 1, 'SPV');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stok_produk`
--
ALTER TABLE `stok_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agama`
--
ALTER TABLE `agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `stok_produk`
--
ALTER TABLE `stok_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
