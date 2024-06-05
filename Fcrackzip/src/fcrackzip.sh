#!/bin/bash
#
#----------------------------------------------------------
# Fcrackzip
#
# Fcrackzip adalah alat peretas kata sandi untuk file ZIP
# yang menggunakan dua teknik: Brute-Force Attack dan
# Dictionary Attack. Dalam Brute-Force Attack, penyerang
# mencoba semua kombinasi kata sandi hingga menemukan yang
# benar. Dalam Dictionary Attack, penyerang menggunakan
# wordlist yang berisi kata sandi umum.
#
# Fcrackzip dikembangkan oleh Marc Lehmann, seorang programmer
# yang terkenal dalam komunitas perangkat lunak bebas dan
# open-source. Alat ini pertama kali dirilis pada tahun 2000.
# Ide di balik fcrackzip adalah untuk menyediakan alat yang
# cepat dan efisien untuk menebak kata sandi file ZIP, yang
# sering digunakan untuk kompresi dan enkripsi file.
#----------------------------------------------------------

# Fungsi untuk memasukkan file ZIP
function mfz(){
        while true; do
                read -p "Masukkan nama file ZIP: " fz
                if [[ ! -z "${fz}" ]]; then
                        if [[ -f "${fz}" ]]; then
                                if [[ "${fz##*.}" == "zip" ]]; then
                                        break
                                else
                                        echo "Error: File ${fz} bukan file ZIP."
                                fi
                        else
                                echo "Error: File ZIP ${fz} tidak ditemukan."
                        fi
                else
                        echo "Error: File ZIP tidak boleh kosong."
                fi
        done
}

# Fungsi untuk memilih jenis teknik
function mjt(){

        # Daftar jenis teknik
        djt=(
        "Brute Force Attack"
        "Dictionary Attack"
        )

        c_1=1

        echo ""
        echo "Teknik serangan yang tersedia:"
        echo "------------------------------"
        echo ""

        for jt in "${djt[@]}"; do
                echo "${c_1}. ${jt}"
                ((c_1++))
        done

        echo ""

        while true; do
                read -p "Pilih teknik serangan: " pts
                case "${pts}" in
                        1)
                                # Brute Force Attack 
                                bfa
                                break
                                ;;
                        2)
                                # Dictionary Attack 
                                da
                                break
                                ;;
                        *)
                                echo "Error: Teknik serangan ${pts} tidak tersedia."
                                ;;
                esac
        done
}

# Fungsi untuk memasukkan panjang minimal kata sandi
function mpmin(){
        while true; do
                read -p "Masukkan panjang minimal kata sandi: " pmin
                if [[ ! -z "${pmin}" ]]; then
                        if [[ "${pmin}" =~ ^[0-9]+$ ]]; then
                                break
                        else
                                echo "Error: Masukkan tidak valid. Harap masukkan angka."
                        fi
                else
                        echo "Error: Panjang minimal kata sandi tidak boleh kosong."
                fi
        done
}

# Fungsi untuk memasukkan panjang maksimal kata sandi
function mpmaks(){
        while true; do
                read -p "Masukkan panjang maksimal kata sandi: " pmaks
                if [[ ! -z "${pmaks}" ]]; then
                        # Jika input yang dimasukkan berupa angka
                        if [[ "${pmaks}" =~ ^[0-9]+$ ]]; then
                                break
                        else
                                echo "Error: Masukkan tidak valid. Harap masukkan angka."
                        fi
                else
                        echo "Error: Panjang maksimal kata sandi tidak boleh kosong."
                fi
        done
}

# Fungsi untuk memilih jenis karakter
function mjk(){
        # Daftar jenis karakter
        djk=(
        "Huruf Kecil"
        "Huruf Besar"
        "Angka"
        "Simbol"
        "Huruf Kecil + Huruf Besar"
        "Huruf Kecil + Angka"
        "Huruf Kecil + Simbol"
        "Huruf Besar + Angka"
        "Huruf Besar + Simbol"
        "Angka + Simbol"
        "Huruf Kecil + Huruf Besar + Angka"
        "Huruf Kecil + Huruf Besar + Simbol"
        "Huruf Kecil + Angka + Simbol"
        "Huruf Besar + Angka + Simbol"
        "Huruf Besar + Huruf Kecil + Angka + Simbol"
        )

        c_2=1

        echo ""
        echo "Jenis karakter yang tersedia:"
        echo "-----------------------------"
        echo ""

        for jk in "${djk[@]}"; do
                echo "${c_2}. ${jk}"
                ((c_2++))
        done

        echo ""

        while true; do
                read -p "Pilih jenis karakter: " pjk
                case "${pjk}" in
                        1)
                                k="a"
                                break
                                ;;
                        2)
                                k="A"
                                break
                                ;;
                        3)
                                k="1"
                                break
                                ;;
                        4)
                                k="!"
                                break
                                ;;
                        5)
                                k="aA"
                                break
                                ;;
                        6)
                                k="a1"
                                break
                                ;;
                        7)
                                k="a!"
                                break
                                ;;
                        8)
                                k="A1"
                                break
                                ;;
                        9)
                                k="A!"
                                break
                                ;;
                        10)
                                k="1!"
                                break
                                ;;
                        11)
                                k="aA1"
                                break
                                ;;
                        12)
                                k="aA!"
                                break
                                ;;
                        13)
                                k="a1!"
                                break
                                ;;
                        14)
                                k="A1!"
                                break
                                ;;
                        15)
                                k="aA1!"
                                break
                                ;;
                        *)
                                echo "Error: Jenis karakter ${pjk} tidak tersedia."
                                ;;
                esac
        done
}

# Fungsi untuk memasukkan file wordlist
function mfw(){
        while true; do
                read -p "Masukkan nama file wordlist: " fw
                if [[ ! -z "${fw}" ]]; then
                        if [[ -f "${fw}" ]]; then
                                break
                        else
                                echo "Error: File wordlist ${fw} tidak ditemukan."
                        fi
                else
                        echo "Error: File wordlist tidak boleh kosong."
                fi
        done
}

# Fungsi untuk teknik Brute Force Attack
function bfa(){
        mpmin # Memanggil fungsi memasukkan panjang minimal kata sandi
        mpmaks # Memanggil fungsi memasukkan panjang maksimal kata sandi
        mjk # Memanggil fungsi memilih jenis karakter
}

# Fungsi untuk teknik Dictionary Attack
function da(){
        mfw # Memanggil fungsi memasukkan file wordlist
}

# Fungsi untuk meng-crack kata sandi File ZIP menggunakan Fcrackzip
function cfz(){
        # Teknik Brute Force Attack
        if [[ "${pts}" == "1" ]]; then
                echo ""
                fcrackzip -v -u -b -c "${k}" -l "${pmin}"-"${pmaks}" "${fz}"
                exit 0
        # Teknik Dictionary Attack
        elif [[ "${pts}" == "2" ]]; then
                echo ""
                fcrackzip -v -u -D -p "${fw}" "${fz}"
                exit 0
        fi
}

# Fungsi utama Fcrackzip
function main(){
        mfz # Memanggil fungsi memasukkan file zip
        mjt # Memanggi fungsi memilih jenis teknik
        cfz # Memanggil fungsi meng-crack kata sandi file ZIP menggunakan Fcrackzip
}


main
