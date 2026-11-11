<?php
require_once "koneksi.php";

$result = $conn->query("SELECT id_mahasiswa, nama, jurusan, alamat, telepon FROM mahasiswa ORDER BY nama ASC");
$pesan = isset($_GET["pesan"]) ? $_GET["pesan"] : "";
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Input Data Mahasiswa</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0; padding: 35px 16px; background: #f3f5f9;
            font-family: Arial, sans-serif; color: #222;
        }
        .container {
            max-width: 850px; margin: auto; background: white;
            padding: 28px; border-radius: 10px;
            box-shadow: 0 4px 18px rgba(0,0,0,.08);
        }
        h2 { margin-top: 0; color: #e88919; text-align: center; }
        .form-row {
            display: grid; grid-template-columns: 180px 1fr;
            gap: 14px; align-items: center; margin: 16px 0;
        }
        label { font-size: 14px; }
        input, select {
            width: 100%; padding: 10px; border: 1px solid #cbd1dc;
            border-radius: 5px; font-size: 14px;
        }
        button {
            border: 0; border-radius: 5px; padding: 10px 18px;
            cursor: pointer; font-weight: bold;
        }
        .submit { background: #e88919; color: white; }
        .reset { background: #e5e7eb; color: #222; }
        .actions { margin: 22px 0 8px 194px; display: flex; gap: 10px; }
        .alert { padding: 12px; border-radius: 5px; margin: 15px 0; }
        .success { background: #e5f7eb; color: #176b36; }
        .error { background: #fde8e8; color: #9b2020; }
        h3 { margin-top: 32px; }
        .table-wrap { overflow-x: auto; }
        table { width: 100%; border-collapse: collapse; font-size: 13px; }
        th, td { border: 1px solid #ddd; padding: 9px; text-align: left; }
        th { background: #f5f5f5; }
        @media (max-width: 600px) {
            .form-row { grid-template-columns: 1fr; gap: 7px; }
            .actions { margin-left: 0; }
            .container { padding: 18px; }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Form Input Data Mahasiswa</h2>

    <?php if ($pesan === "berhasil"): ?>
        <div class="alert success">Data mahasiswa berhasil disimpan.</div>
    <?php elseif ($pesan === "kosong"): ?>
        <div class="alert error">Semua kolom wajib diisi.</div>
    <?php elseif ($pesan === "duplikat"): ?>
        <div class="alert error">NIM sudah terdaftar. Gunakan NIM lain.</div>
    <?php elseif ($pesan === "gagal"): ?>
        <div class="alert error">Data gagal disimpan. Silakan coba lagi.</div>
    <?php endif; ?>

    <form action="action-input-data.php" method="POST">
        <div class="form-row">
            <label for="id_mahasiswa">ID Mahasiswa / NIM</label>
            <input type="text" id="id_mahasiswa" name="id_mahasiswa" maxlength="20" required>
        </div>
        <div class="form-row">
            <label for="nama">Nama</label>
            <input type="text" id="nama" name="nama" maxlength="100" required>
        </div>
        <div class="form-row">
            <label for="jurusan">Jurusan</label>
            <select id="jurusan" name="jurusan" required>
                <option value="">- Pilih Jurusan -</option>
                <option value="Teknik Komputer">Teknik Komputer</option>
                <option value="Teknik Informatika">Teknik Informatika</option>
                <option value="Teknik Mesin">Teknik Mesin</option>
                <option value="Teknik Elektro">Teknik Elektro</option>
                <option value="Komputer Akuntansi">Komputer Akuntansi</option>
            </select>
        </div>
        <div class="form-row">
            <label for="alamat">Alamat</label>
            <input type="text" id="alamat" name="alamat" maxlength="255" required>
        </div>
        <div class="form-row">
            <label for="telepon">No. Telepon</label>
            <input type="tel" id="telepon" name="telepon" maxlength="20" required>
        </div>
        <div class="actions">
            <button class="submit" type="submit">Submit</button>
            <button class="reset" type="reset">Cancel</button>
        </div>
    </form>

    <h3>Data Mahasiswa</h3>
    <div class="table-wrap">
        <table>
            <thead>
                <tr>
                    <th>NIM</th><th>Nama</th><th>Jurusan</th><th>Alamat</th><th>No. Telepon</th>
                </tr>
            </thead>
            <tbody>
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?= htmlspecialchars($row["id_mahasiswa"]) ?></td>
                        <td><?= htmlspecialchars($row["nama"]) ?></td>
                        <td><?= htmlspecialchars($row["jurusan"]) ?></td>
                        <td><?= htmlspecialchars($row["alamat"]) ?></td>
                        <td><?= htmlspecialchars($row["telepon"]) ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="5">Belum ada data mahasiswa.</td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
