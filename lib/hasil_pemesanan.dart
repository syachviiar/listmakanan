import 'package:flutter/material.dart';
import 'package:menumakanan/makanan.dart';

class PemesananPage extends StatefulWidget {
  final Makanan makanan;

  PemesananPage({Key? key, required this.makanan}) : super(key: key);

  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  int jumlahItem = 1; // Menambah variabel jumlah item
  int hargaMakanan = 0; // Menambah variabel harga makanan

  @override
  void initState() {
    super.initState();
    // Inisialisasi harga makanan
    hargaMakanan = _hitungHargaMakanan();
  }

  int _hitungHargaMakanan() {
    return int.parse(widget.makanan.harga.substring(3).replaceAll(',', ''));
  }

  void tambahItem() {
    setState(() {
      jumlahItem++;
    });
  }

  void kurangItem() {
    if (jumlahItem > 1) {
      setState(() {
        jumlahItem--;
      });
    }
  }

  void pindahKeHasilPemesanan() {
    Navigator.pushReplacementNamed(
      context,
      '/hasil_pemesanan', // Ganti dengan rute ke hasil_pemesanan.dart
      arguments: {'makanan': widget.makanan, 'jumlahItem': jumlahItem},
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalHarga = hargaMakanan * jumlahItem;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.makanan.gambarUtama,
            height: 150,
          ),
          SizedBox(height: 20),
          Text(
            widget.makanan.nama,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            widget.makanan.deskripsi,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Harga: ${widget.makanan.harga}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: kurangItem,
              ),
              Text(jumlahItem.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: tambahItem,
              ),
              Text('Total: Rp ${totalHarga.toString()}'),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: pindahKeHasilPemesanan,
            child: Text('PEMESANAN'),
          ),
        ],
      ),
    );
  }
}
