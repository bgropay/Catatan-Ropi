## Daftar Isi

- [Fcrackzip](https://github.com/bgropay/Catatan-Ropi/tree/main/Fcrackzip#fcrackzip)
- [Instalasi](https://github.com/bgropay/Catatan-Ropi/tree/main/Fcrackzip#instalasi)
- [Penggunaan](https://github.com/bgropay/Catatan-Ropi/tree/main/Fcrackzip#penggunaan)
  - [Teknik Brute Force Attack](https://github.com/bgropay/Catatan-Ropi/tree/main/Fcrackzip#1-teknik-brute-force-attack)
  - [Teknik Dictionary Attack](https://github.com/bgropay/Catatan-Ropi/tree/main/Fcrackzip#2-teknik-dictionary-attack)


# Fcrackzip

`Fcrackzip adalah alat peretas kata sandi untuk file ZIP yang menggunakan dua teknik: Brute-Force Attack dan Dictionary Attack.` Dalam Brute-Force Attack, penyerang mencoba semua kombinasi kata sandi hingga menemukan yang benar. Dalam Dictionary Attack, penyerang menggunakan wordlist yang berisi kata sandi umum. 

`Fcrackzip dikembangkan oleh Marc Lehmann, seorang programmer yang terkenal dalam komunitas perangkat lunak bebas dan open-source. Alat ini pertama kali dirilis pada tahun 2000.` Ide di balik fcrackzip adalah untuk menyediakan alat yang cepat dan efisien untuk menebak kata sandi file ZIP, yang sering digunakan untuk kompresi dan enkripsi file.

## Instalasi 

```
$ sudo apt-get update 
$ sudo apt-get install fcrackzip 
```

## Penggunaan

### 1. Teknik Brute Force Attack

```
fcrackzip -b -c <jenis_karakter> -l <panjang_min>-<panjang_maks> -v -u <file_zip>
```

- -b: Menggunakan Brute Force Attack.
- -c: Menentukan jenis karakter yang digunakan.
- -l: Menentukan panjang minimal dan maksimal kata sandi.
- -u: Memperbarui status file zip dengan informasi dekripsi yang ditemukan.
- -v: Menampilkan output secara verbose.

jenis karakter yang tersedia:

- Huruf kecil: a
- Huruf besar: A
- Angka: 1
- Simbol: !

Contoh:

```
fcrackzip -b -c aA1! -l 4-8 -v -u file.zip
```

### 2. Teknik Dictionary Attack

```
fcrackzip -u -v -D -p <wordlist> <file_zip>
```

keterangan:

- -u: Memperbarui status file zip dengan informasi dekripsi yang ditemukan.
- -v: Menampilkan output secara verbose.
- -D: Menggunakan Dictionary Attack
- -p: Menentukan path ke file wordlist yang berisi daftar kata sandi yang akan dicoba.

Contoh:

```
fcrackzip -v -u -D -p wordlist.txt file.zip
```
