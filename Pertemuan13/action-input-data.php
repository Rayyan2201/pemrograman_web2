<?php
require_once "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: index.php");
    exit;
}

$id_mahasiswa = trim($_POST["id_mahasiswa"] ?? "");
$nama         = trim($_POST["nama"] ?? "");
$jurusan      = trim($_POST["jurusan"] ?? "");
$alamat       = trim($_POST["alamat"] ?? "");
$telepon      = trim($_POST["telepon"] ?? "");

if ($id_mahasiswa === "" || $nama === "" || $jurusan === "" || $alamat === "" || $telepon === "") {
    header("Location: index.php?pesan=kosong");
    exit;
}

// Periksa apakah NIM sudah digunakan.
$cek = $conn->prepare("SELECT id_mahasiswa FROM mahasiswa WHERE id_mahasiswa = ?");
$cek->bind_param("s", $id_mahasiswa);
$cek->execute();
$hasil = $cek->get_result();

if ($hasil->num_rows > 0) {
    $cek->close();
    header("Location: index.php?pesan=duplikat");
    exit;
}
$cek->close();

// Simpan data menggunakan prepared statement.
$stmt = $conn->prepare(
    "INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, alamat, telepon) VALUES (?, ?, ?, ?, ?)"
);
$stmt->bind_param("sssss", $id_mahasiswa, $nama, $jurusan, $alamat, $telepon);

if ($stmt->execute()) {
    $stmt->close();
    header("Location: index.php?pesan=berhasil");
    exit;
}

$stmt->close();
header("Location: index.php?pesan=gagal");
exit;
