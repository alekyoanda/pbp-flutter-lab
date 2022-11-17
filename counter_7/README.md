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

# Tugas 8

## Perbedaan ```Navigator.push``` dan ```Navigator.pushReplacement```
Perbedaan dari ```Navigator.push``` dan ```Navigator.pushReplacement``` adalah ```Navigator.push``` *route* yang ada di bawahnya akan tetap tersimpan di dalam *stack*, sedangkan ```Navigator.pushReplacement``` akan membuang *route* yang sebelumnya ditimpa.

## Daftar *Widget* Yang Dipakai
```
1. Form: Widget untuk menghimpun elemen-elemen pada halaman input budget.
2. ElevatedButton: Widget button yang mengimplementasikan onPressed
3. Drawer: Widget navigasi antar screen
4. TextFormField: Widget input textbox
5. DropdownButtonFormField: Widget untuk menampilkan menu dropdown
6. InputDecoration: Widget untuk kustomisasitampilan TextFormField
7. ListTile: Widget seperti card dalam bootstrap
8. ListView: Widget untuk menampilkan 1 atau lebih ListTile
```

## Jenis - Jenis *Event* Pada Flutter
```
1. onPressed
2. onTap
3. onSaved
4. onChange
5. onEnter
6. onExit
7. onHover
```

## Cara Kerja ```Navigator```
```Navigator``` bekerja sebagai *manager* untuk setiap *child* yang ada layaknya *stack*. Tujuannya adalah sebagai urutan logika dalam menampilkan halaman pada aplikasi. Yang disimpan pada ```Navigator``` adalah *routes* pada *app*. Untuk berpindah dari satu halaman ke halaman lain, terdapat *method* ```push``` dan ```pop```. ```push``` adalah untuk menambahkan *route* baru pada ```Navigator``` serta pindah ke *route* tersebut sedangkan ```pop``` adalah untuk melepas *route* yang ada di paling atas ```Navigator``` dan kembali ke *route* sebelumnya.

## Implementasi Tugas 8
1. Menambahkan widget drawer pada file main.dart, form.dart, dan data.dart untuk navigasi antar screen
2. Membuat model untuk budget dengan membuat file ```budget.dart```. Di sana saya membuat class baru bernama ```Budget``` yang berisi atribut dasar pada budget.
3. Membuat halaman penambahan *form* dengan membuat file ```form.dart```. Di sana saya membuat class MyFormPage untuk nanti dipanggil di Drawer serta _MyFormPageState untuk mengatur bagaimana ketika widget MyFormPage ini dibuat. Saya menambahkan Form serta elemen-elemen yang dibutuhkan dalam pembuatan form seperti textbox, dropdown menu, dan button. Setelah itu, pada method onPressed di button submit, saya membuat instance dari Budget baru yang akan dimasukkan ke dalam List<Budget>. Untuk passing data melalui screen yang berbeda - beda, saya menambahkan sebuah atribut baru pada tiap file dart di lib, yaitu atribut List<Budget>.
4. Membuat halaman penampilan form di file data.dart. Di sana saya membuat class MyDataPage untuk nanti dipanggil di Drawer serta _MyDataPageState mengatur bagaimana ketika widget MyDataPage ini dibuat. Saya menambahkan ListView untuk menampilkan setiap elemen pada List berisi data budget. Setiap elemen akan ditampilkan dalam widget ListTile.