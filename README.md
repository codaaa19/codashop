# CodaShop : Everything you need.

# Assignment 8

# Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

- `Navigator.push()` : Membuat window baru (dengan metode stack) dan membuat window baru tersebut terdapat pada stack teratas. (Tanda penggunaan push adalah terdapat icon **back**).

- `Navigator.pushReplacement()` : Membuat window baru (dengan metode stack) akan tetapi method ini menghapus stack teratasnya(menggantikan).

```py
    if (item.name == "Tambah Produk") {
        Navigator.push(context, #contoh push
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
```
```py
    onTap: () {
        Navigator.pushReplacement( #contoh pushreplacement
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
    },
```
# Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

- `Align` : mengatur posisi widget anaknya di dalam parent.

- `Card` : membuat kotak berbentuk kartu.

- `Wrap` : mengatur widget anaknya ke dalam baris atau kolom yang sesuai dengan ukuran layar (biasanya untuk handle widget jika kepenuhan).

- `SizedBox` : memberikan batasan ukuran pada widget anaknya.

- `GridView` : mengatur anak-anaknya dalam bentuk kotak.

- `Expanded dan Flexible` : Memberikan fleksibilitas dan ruang lebih pada widget anaknya.

- `Listview` : engelompokan yang bergulir yang mengatur anak-anaknya dalam satu daftar.

- `Stack` : Membuat widget dapat bertumpukan.

- `Row` : Mengatur widget dalam 1 baris horizontal.

- `Column` : Mengatur widget dalam 1 baris vertikal.

- `Container` : Membuat frame sehingga dapat memposisikan widget dengan lebih baik.

 # Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

 1. `Form` : Widget untuk menerima input dasar form.
 
 2. `TextFromField` : Input string.

 # Bagaimana penerapan clean architecture pada aplikasi Flutter?

 Clean architecture dapat membagi aplkasi menjadi beberapa lapisan utama :

 1. ` Data & Platform layer` : Lapisan terluar yang terdiri dari kode sumber data. (REST API, FIREBASE,DLL).
 2. `Domain` : Objek dasar yang mewakili aplikasi.
 3. `Presentation` : Logika presentasi (tampilan utama flutter).

 # STEP-STEP PENUGASAN

# MEMBUAT DRAWER

1. Membuat file baru dengan nama `left_drawer.dart` dan isi code dengan code berikut :

```py
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
          ),
          // TODO: Bagian routing
        ],
      ),
    );
  }
}
```

dan tambahkan import page-page yang dibutuhkan untuk dapat membuat navigasi `import 'package:codashop/screens/menu.dart';`

2. Lalu, tambahkan navigasi sesuai dengan kebutuhan :

```py
ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('See Item'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemPage(),
                  ));
```
3. Berikan sedikit hiasan agar bagus 😁:

```py
const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "What do you need ?",
                  style:  TextStyle(
                    fontSize: 15,
                    color:  Colors.white,
                    fontWeight:  FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
```
4. Setelah itu, kita akan memasukan drawer kita pada file yang dibutuhkan, pada context ini `menu.dart` :

```py
import 'package:codashop/widgets/left_drawer.dart';
...
      drawer: const LeftDrawer(),
```
# MEMBUAT FORM

1. Membuat file baru pada folder `lib` dengan nama `shoplist_form.dart` dan isilah dengan code berikut :

```py
import 'package:flutter/material.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    @override
    Widget build(BuildContext context) {
        return Placeholder();
    }
}
```

2. Ganti placeholder dengan code berikut :
```py
return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add your item here',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
```

3. Tambahkan code berikut :
```py
class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  String _name = "";
  int _price = 0;
  String _description = "";
```

4. Buat widget colum sebagai child dari singlechildscrollview :

```py
...
body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column()
      ),
...
```

5. Tambahkan CrossAxisAlignment untuk mengatur children dari column dan tambahkan align seperti ini :

```py
children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Item's Name",
                    labelText: "Item's Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Item's Price",
                    labelText: "Item's Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price must be in numerical form!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Item's Description",
                    labelText: "Item's Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          items.add(Item(_name, _price, _description));
                        });
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Product successfully added'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Price: $_price'),
                                    Text('Desription: $_description')],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
```
6. Untuk dapat menyimpan data item yang diinput, saya menggunakan list dan saya tambahkan pada list jika item valid `items.add(Item(_name, _price, _description));`

7. Menambahkan `showDialog()` untuk memunculkan widget popup :

```py
showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Product successfully added'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Price: $_price'),
                                    Text('Desription: $_description')],
                                ),
```
# MEMBUAT NAVIGASI PADA BUTTON

Menambahkan kode berikut pada widget ShopItem untuk dapat membuat navigasi ke route lain :

```py
 child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"), backgroundColor: item.color));
                // Navigate ke route yang sesuai (tergantung jenis tombol)
              if (item.name == "Tambah Item") {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ));
              }
              else if (item.name == "Lihat Item"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ItemPage()));
```

# Bonus !

1. Membuat file baru bernama `listitem.dart` untuk dapat menampilkan item yang telah di add sebelumnya.

2. Import semua hal yang diperlukan :

```py
import 'package:flutter/material.dart';
import 'package:codashop/screens/shoplist_form.dart';
import 'package:codashop/widgets/left_drawer.dart';
```

3. Tambahkan code untuk menampilkan tiap item :

```py
body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
           Color cardColor = index % 2 == 0 ? Colors.purple.shade100 : Colors.purple.shade200;
          return Card(
            elevation: 3, // Set the elevation for the card
            margin: EdgeInsets.all(15), // Set margin for the card
            color : cardColor,
            child: ListTile(
              title: Text(items[index].name),
              subtitle: Text(
                  "Item's Name: ${items[index].name} \nPrice: ${items[index].price} \nDescription: ${items[index].description}"),
              onTap: () {
              },
            ),
```
4. Tampilannya akan menjadi seperti ini :

![Foto Bonus Flutter 2](bonusflutter2.png)


# Assignment 7 (Flutter)

# Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Pada `stateless`, widget **TIDAK MENYIMPAN**  data sehingga menyebabkan :

- `Immutable` yang berarti pada perubahan apapun tidak akan menyebabkan perubahan.

- `Tidak dapat diperbaharui secara dinamis` yang berarti diperlukan widget lain setiap diadakan perubahan data.

Pada `statefull`, widget **MENYIMPAN** data sehingga menyebabkan :

- `Mutable` yang berarti akan mengalami perubahan jika data dirubah-rubah.

- `Dapat diperbaharui secara dinamis` yang berarti tampilan widget dapat berubah seiring dengan perubahan data. (tidak perlu widget lain).

# Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

1. `Scaffold` : Sebagai struktur dasar dari program flutter.

2. `Appbar` : Mirip seperti navbar pada django.

3. `SingleChildScrollView` : Berfungsi sebagai 'penambah layar' jika konten yang ditampilkan melebihi batas windows.

4. `Padding` : Untuk memberikan jarak antar konten.

5. `Column` : Menata konten secara kolom (vertikal).

6. `Text` : Menampilkan text dan memungkikan untuk kita berikan sentuhan 'styling'.

7. `GridView` : Membuat format tampilan menajadi grid.

8. `InkWell` : Memberikan efek pada saat ditekan.

9. `Icon` : Menyediakan berbagai jenis icon untuk kebutuhan tampilan flutter.

10. `SnackBar:` : Menampilkan semacam pesan setelah melakukan sebuah event tertentu.

11. `Container` : Berfungsi untuk mengatur tata letak.

12. `Material` : Menmberi akses stytling pada child class-nya.

<br>

# Implement Checklist😎

1. Siapkan hal-hal yang diperlukan untuk dapat menggunakan flutter :

![Foto Flutter Doctor](flutterdoctor.jpg)

2. Jalankan perintah untuk membuat project flutter dan menjalankannya :

```py
flutter create <APP_NAME>
cd <APP_NAME>
flutter run
```

3. Membuat file baru dengan nama `menu.dart` pada directory `codashop/lib` dan import file yang dibutuhkan :

```py
import 'package:flutter/material.dart';
```

4. Pada file `main.dart`, kita pindahkan 2 class ke `menu.dart` yang sudah dibuat sebelumnya :
- `MyHomePage`
- `MyHomePageState`

dan lakukan import untuk mengatasi error yang akan terjadi.
```py
import 'package:shopping_list/menu.dart';
```

5. Pada `main.dart`, ubahlah code `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`

6. Ganti class `HomePage` menjadi `StatelessWidget` dengan detail code sebagai berikut dan hapus state dibawahnya (karna kita tidak akan memerlukan state tersebut):

```py
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
7. Membuat class item yang akan dijual dengan code berikut :

```py
class ShopItem {
  final String name;
  final IconData icon;
  final Color color; #ini code yang ditambahkan sendiri untuk dapat bonus😁

  ShopItem(this.name, this.icon, this.color);
}
```
Tuliskan code berikut tepat di bawah `MyHomePage({Key? key}) : super(key: key);` :

```py
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.black),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blue),
    ShopItem("Logout", Icons.logout, Colors.purple),
    ];
    #ada tambahan contructor colors pada tiap card (tiap card harus punya warna masing-masing)
```

8. Menambahkan code berikut pada Scaffold (berfungsi sebagai kerangka atau dasar dari program flutter) :

```py
return Scaffold(
            appBar: AppBar(
        title: const Text(
          'Shopping List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Coda Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```
dan tambahkan code berikut untuk membuat cards pada item yang sudah dibuat sebelumnya :

```py
return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"), backgroundColor: item.color));
                
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
```
# BONUS

![Foto Bonus Flutter](bonusflutter1.png)