# Tugas 7 PBP
##  *Stateless* Dan *Stateful Widget*
*Stateless widget* adalah *widget* yang tidak merubah atau bisa dibilang bersifat *immutable*. Penampilan serta propertinya tidak berubah pada aplikasi. Widget ini tidak bergantung pada perubahan data atau perilaku app atau suatu *event* tertentu. 

*Stateful widget* adalah *widget* yang berubah saat *runtime* atau bisa dibilang bersifat *mutable*. Widget tipe ini bisa di-*render* berulang kali dalam satu *lifetime* dan bisa merubah penampilannya, serta propertinya berdasarkan suatu *event* tertentu.

## Daftar *Widget* Yang Dipakai
```
1. MaterialApp: Widget ini merupakan widget inti dari sebuah aplikasi yang menggunakan akan dijalankan langsung melalui fungsi runApp().
2. Scaffold: Scaffold adalah widget di Flutter yang digunakan untuk mengimplementasikan struktur tata letak material design dasar.
4. AppBar: Widget untuk menampilkan sebuah app bar pada bagian atas sebuah app.
5. Text: Widget untuk menampilkan sebuah teks
6. Center: Single child layouting widget yang digunakan untuk membuat child dari widget ini ke tengah layar letak widget ini
7. Column: Multi child layouting widget yang digunakan untuk mengatur letak children dari widget ini secara vertikal.
8. Row: Multi child layouting widget yang digunakan untuk mengatur letak children dari widget ini secara horizontal.
9. FloatingActionButton: Widget yang menampilkan sebuah button yang melayang yang bisa mentrigger sebuah fungsi ketika ditekan.
10. Visibility: Widget untuk menampilkan atau menyembunyikan widget lain yang menjadi childnya pada suatu kondisi tertentu.
11. Container: Single child layouting widget yang digunakan untuk membuat child dari widget ini berada dalam sebuah pembungkus.
12. Icon: Widget untuk menampilkan sebuah icon
```

## Penjelasan ```setState()```
```setState()``` adalah sebuah fungsi dalam *static method* dalam Flutter yang berfungsi untuk memberitahu *widget* bahwa ada objek yang berubah pada *state*, sehingga akan melakukan *build* ulang pada objek *widget* yang *Stateful*. Dalam tugas kali ini, widget ```Text``` akan berubah karena di dalamnya mengandung variabel ```counter``` yang berubah secara dinamis di dalam ```setState()```.

## Perbedaan ```const``` dan ```final```
```const``` digunakan untuk deklarasi variabel yang nilainya bersifat konstan dan bersifat harus sudah diketahui pada saat waktu kompilasi berjalan.

```final``` digunakan untuk deklarasi variabel yang bersifat konstan selama program berjalan. Bedanya dengan ```const```, nilai ```final``` bersifat akan diketahui pada saat *runtime* program
## Implementasi Tugas 7
1. Membuat fungsi ```_decrementCounter``` yang akan dipanggil ketika *widget* ```FloatingActionButton``` bagian kiri ditekan.
2. Membuat suatu fungsi yang mengembalikan *widget* ```Text``` di mana apabila ```counter``` genap akan mengembalikan widget ```Text``` "GENAP" berwarna biru dan akan mengembalikan widget ```Text``` "GANJIL" berwarna merah apabila ```counter``` ganjil.
3. Modifikasi *widget* ```Column``` di mana *widget* tersebut punya dua child, yaitu ```Text``` dan ```FloatingActionButton```. Kita masukkan fungsi yang menampilkan teks ganjil atau genap sebelum widget ```Text``` yang menampilkan ```counter```.Pada ```FloatingActionButton``` kita buat *widget* ```Container``` yang memiliki *child widget* ```Row``` yang diisi oleh dua *widget* lagi yaitu ```Visibility``` yang memiliki *child* ```FloatingActionButton``` untuk *decrement* ```counter``` dan ```FloatingActionButton``` untuk *increment* ```counter```.