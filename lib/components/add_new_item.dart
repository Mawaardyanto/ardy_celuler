import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {
  AddNewItem(this.addNew);
  final Function addNew;

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  final titleController = TextEditingController();
  final namaController = TextEditingController();
  final hargaController = TextEditingController();
  final qtyController = TextEditingController();

  void saveNewItem() {
    final title = titleController.text;
    final nama = namaController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    if (title.isEmpty || nama.isEmpty || harga.isEmpty || qty <= 0) {
      return;
    }
    widget.addNew(title,nama,double.parse(harga),qty);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title : Text("Tambah Barang", style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
        ),
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Nama Barang'),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Nama Pegawai'),
                  controller: namaController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Harga'),
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Qty'),
                  controller: qtyController,
                  keyboardType: TextInputType.number,
                ),
                FlatButton(
                  child: Text('Tambah'),
                  onPressed: saveNewItem,
                  textColor: Colors.pink,
                )
              ],
            ),
          ),
        ),
      );
}
