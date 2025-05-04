#!/bin/bash

# Mendapatkan tanggal dan waktu saat ini
current_date=$(date +"%m%d%Y")        # Format MMDDYYYY
current_hour=$(date +"%H.%M")         # Format HH.MM

# Menentukan direktori penyimpanan
output_dir="/home/cron"
mkdir -p "$output_dir"                 # Membuat folder jika belum ada

# File output yang akan disimpan
output_file="${output_dir}/cron_${current_date}_${current_hour}.csv"

# Proses pengumpulan data (contoh dari sumber tertentu)
# Anda dapat mengganti perintah ini dengan proses pengambilan data yang sesuai
echo "Mengumpulkan data pada ${current_date} ${current_hour} WIB" > "$output_file"

# Contoh: Mengambil data dari API menggunakan curl (ganti dengan API yang sesuai)
# curl -s "http://example.com/data" -o "$output_file"

# Jika Anda mengambil data dari sumber lokal, bisa disesuaikan sesuai kebutuhan Anda
# echo "Data collected at ${current_date} ${current_hour}" >> "$output_file"

echo "Data berhasil dikumpulkan dan disimpan di $output_file"
