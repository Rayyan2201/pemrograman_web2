<!DOCTYPE html>
<html>
<head>
    <title>Penggunaan Switch - Case</title>
</head>
<body>

<h2>Hari ini:</h2>

<?php

$nama_hari = date("l");

switch ($nama_hari) {
    case "Sunday":
        echo "Minggu<br>";
        echo "Waktu untuk istirahat";
        break;

    case "Monday":
        echo "Senin<br>";
        echo "Meeting awal minggu jam 08.00";
        break;

    case "Tuesday":
        echo "Selasa<br>";
        echo "Pembukaan Workshop Diklat";
        break;

    case "Wednesday":
        echo "Rabu<br>";
        echo "Seminar Launching di JHCC";
        break;

    case "Thursday":
        echo "Kamis<br>";
        echo "Pertemuan dengan Mahasiswa";
        break;

    case "Friday":
        echo "Jum'at<br>";
        echo "Jogging bersama";
        break;

    case "Saturday":
        echo "Sabtu<br>";
        echo "Survey harga ke Dusit, Mangga Dua";
        break;

    default:
        echo "Hari tidak diketahui";
        break;
}

?>

</body>
</html>