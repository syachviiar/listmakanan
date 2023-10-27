import 'package:flutter/material.dart';
import 'package:menumakanan/detail_page.dart';
import 'package:menumakanan/styles.dart';
import 'makanan.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.Menu,
  });

  final Makanan Menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailPage(makanan: Menu)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 188, 188, 188), 
              offset: Offset(1, 2), 
              blurRadius: 6)
          ]),
        child: Row(
          children: [
            gambar(),
            SizedBox(width: 10),
            deskripsiTeks(),
            Icon(Icons.food_bank_rounded, color: iconColor,)
          ],
        ),
      ),
    );
  }

  ClipRRect gambar() {
    return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            Menu.gambarUtama, 
            height: 75, 
            width: 85,
            fit: BoxFit.cover,
          ),
        );
  }

  Expanded deskripsiTeks() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Menu.nama, style: headerH1),
              Text(
                Menu.deskripsi, 
                style: TextStyle(color: Colors.black38),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 3),
              Text(
                Menu.harga, 
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
    );
  }
}
