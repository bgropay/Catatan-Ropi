# Fcrackzip

Fcrackzip adalah alat peretas kata sandi untuk file ZIP yang menggunakan dua teknik: Brute-Force Attack dan Dictionary Attack. Dalam Brute-Force Attack, penyerang mencoba semua kombinasi kata sandi hingga menemukan yang benar. Dalam Dictionary Attack, penyerang menggunakan wordlist yang berisi kata sandi umum.

## Instalasi 

```
$ sudo apt-get update 
$ sudo apt-get install fcrackzip 
```

## Penggunaan

### 1. Teknik Brute Force Attack

```
fcrackzip -b -c <jenis_karakter> -l <panjang_min>-<panjang_maks> -v <file_zip>
```

- -b: Menggunakan Brute Force Attack.
- -c: Menentukan jenis karakter yang digunakan.
- -l: Menentukan panjang minimal dan maksimal kata sandi.
- -v: Menampilkan output secara verbose.

jenis karakter yang tersedia:

- Huruf kecil: a
- Huruf besar: A
- Angka: 1
- Simbol: !

Contoh:

```
fcrackzip -b -c aA1! -l 4-8 -v test.zip
```
  
