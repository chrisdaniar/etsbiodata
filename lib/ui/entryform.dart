import 'package:flutter/material.dart';
import 'package:etsbiodata/models/biodata.dart';

class EntryForm extends StatefulWidget {
  final Biodata biodata;

  EntryForm(this.biodata);

  @override
  EntryFormState createState() => EntryFormState(this.biodata);
}

class EntryFormState extends State<EntryForm> {
  Biodata biodata;
  DateTime tglLahir = DateTime.now();

  List<String> listProdi = ['Teknik Elektro','Teknik Industri','Teknik Arsitektur', 'Teknik Mesin', 'Teknik Informatika'];
  List<String> listFakultas = ['Teknik','Ekonomi','Psikologi', 'Hukum'];
  List<String> listHobi = ['Badminton','Menari','Sepak Bola', 'Berenang'];
  String item = 'Teknik Elektro';
  String fitem = 'Teknik';

  bool cek1 = false;
  bool cek2 = false;
  bool cek3 = false;
  bool cek4 = false;

  // Future getImage(ImageSource media) async{
  //   var img = await ImagePicker.pickImage(source: media);
  //   setState(() {
  //     _image = img;
  //   });
  // }

  // void myAlert() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(8)),
  //           title: Text('Please choose media to select'),
  //           content: Container(
  //             height: MediaQuery
  //                 .of(context)
  //                 .size
  //                 .height / 6,
  //             child: Column(
  //               children: <Widget>[
  //                 FlatButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.gallery);
  //                   },
  //                   child: Row(
  //                     children: <Widget>[
  //                       Icon(Icons.image),
  //                       Text('From Gallery'),
  //                     ],
  //                   ),
  //                 ),
  //                 FlatButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.camera);
  //                   },
  //                   child: Row(
  //                     children: <Widget>[
  //                       Icon(Icons.camera),
  //                       Text('From Camera'),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  int valRadio = -1;
  void onChangedRadio(int value){
    setState(() {
      this.valRadio = value;
      print(value);
    });
  }
  void onChangedCek1 (bool value){
    setState(() {
      this.cek1 = value;
    });
  }
  void onChangedCek2 (bool value) {
    setState(() {
      this.cek2 = value;
    });
  }

  void onChangedCek3 (bool value) {
    setState(() {
      this.cek3 = value;
    });
  }

  void onChangedCek4(bool value) {
    setState(() {
      this.cek4 = value;
    });
  }

  // Future<Null> selectDate(BuildContext context) async{
  //   final DateTime selected = await showDatePicker(
  //       context: context,
  //       initialDate: this.tglLahir,
  //       firstDate: DateTime(1900, 1),
  //       lastDate: DateTime.now()
  //   );

  //   if(selected != null && selected != this.tglLahir){
  //     setState(() {
  //       this.tglLahir = selected;
  //     });
  //   }
  // }

  EntryFormState(this.biodata);

  TextEditingController namaController = TextEditingController();
  TextEditingController nbiController  = TextEditingController();
  TextEditingController alamatController  = TextEditingController();
  TextEditingController ipkController  = TextEditingController();
  TextEditingController sppController  = TextEditingController();

  void onChangedDrop(String value){
    setState(() {
      item = value;
    });
  }

  void onChangedDropD(String value){
    setState(() {
      fitem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (biodata != null) {
      namaController.text = biodata.nama;
      nbiController.text = biodata.nbi;
      alamatController.text = biodata.alamat;
      ipkController.text = biodata.ipk;
      sppController.text = biodata.spp;
    }

    return Scaffold(
        appBar: AppBar(
          title: biodata == null ? Text('Tambah Data') : Text('Ubah Data'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // nbi
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: nbiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'NBI',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              //alamat
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: alamatController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              //tanggal lahir
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              //   child: RaisedButton(
              //     child: Text('Pilih Tanggal Lahir'),
              //     onPressed: (){
              //       selectDate(context);
              //     },
              //   ),
              // ),

              //jenis kelamin
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(children: <Widget>[
                  Text(
                    "Jenis Kelamin : ",
                  ),
                  Radio(value: 0, groupValue: this.valRadio, onChanged: (int value){
                    onChangedRadio(value);
                  }),
                  Text("Pria"),
                  Radio(value: 1, groupValue: this.valRadio, onChanged: (int value){
                    onChangedRadio(value);
                  }),
                  Text("Wanita"),
                ]),
              ),

              //fakultas
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              //   child: Row(children: <Widget>[
              //     Text(
              //       "Fakultas :",
              //     ),
              //     DropdownButton(
              //       value: fitem,
              //       items: listFakultas.map((String
              //       value) {
              //         return
              //           DropdownMenuItem(
              //             value: value,
              //             child: Row(
              //               children:
              //               <Widget>[
              //                 Text(value),
              //               ],
              //             ),
              //           );
              //       }).toList(),
              //       onChanged: (String
              //       value) {
              //         onChangedDropD(value);
              //       },
              //     ),
              //   ]),
              // ),

              //hobi
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              //   child: Row(children: <Widget>[
              //     Text(
              //       "Hobi :",
              //     ),
              //     SizedBox(width: 20),
              //     Container(width: 10),
              //     Column(
              //       children:<Widget>[
              //         Row(children: <Widget>[
              //           Checkbox(
              //             value: this.cek1,
              //             onChanged: (bool value) {
              //               onChangedCek1(value);
              //             },
              //             activeColor: Colors.red,
              //           ),
              //           Text ('Badminton'),
              //           Checkbox(
              //             value: this.cek2,
              //             onChanged: (bool value){
              //               onChangedCek2(value);
              //             },
              //             activeColor: Colors.red,
              //           ),
              //           Text('Menari'),
              //         ],),
              //         Row(children: <Widget>[
              //           Checkbox(
              //             value: this.cek3,
              //             onChanged: (bool value){
              //               onChangedCek3(value);
              //             },
              //             activeColor: Colors.red,
              //           ),
              //           Text('Sepakbola'),
              //           Checkbox(
              //             value: this.cek4,
              //             onChanged: (bool value){
              //               onChangedCek4(value);
              //             },
              //             activeColor: Colors.red,
              //           ),
              //           Text('Berenang'),
              //         ],)
              //       ],
              //     ),
              //   ]),
              // ),

              //ipk
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: ipkController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'IPK',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              //spp
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: sppController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'SPP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              //prodi
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(children: <Widget>[
                  Text(
                    "Prodi :",
                  ),
                  DropdownButton(
                    value: item,
                    items: listProdi.map((String
                    val) {
                      return
                        DropdownMenuItem(
                          value: val,
                          child: Row(
                            children:
                            <Widget>[
                              Text(val),
                            ],
                          ),
                        );
                    }).toList(),
                    onChanged: (String
                    value) {
                      onChangedDrop(value);
                    },
                  ),
                ]),
              ),

              //dosen wali
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              //   child: TextField(
              //     controller: dosenController,
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //       labelText: 'Dosen Wali',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //     ),
              //     onChanged: (value) {
              //       //
              //     },
              //   ),
              // ),

              //gambar
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              //   child: Row(children: <Widget>[
              //     _image == null
              //         ? GestureDetector(
              //       onTap: () {
              //         myAlert();
              //       },
              //       child: Container(
              //         height: 100,
              //         width: 100,
              //         child: CircleAvatar(
              //           radius: 100,
              //         ),
              //       ),
              //     )
              //         : ClipRRect(
              //       borderRadius: BorderRadius.circular(8),
              //       child: Image.file(
              //         _image,
              //         fit: BoxFit.cover,
              //         width: MediaQuery.of(context).size.width,
              //         height: MediaQuery.of(context).size.height / 5,
              //       ),
              //     )
              //   ]
              //   ),
              // ),

              // tombol bawah
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Simpan',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (biodata == null) {
                            // tambah data
                            biodata = Biodata(
                                namaController.text, nbiController.text, alamatController.text,
                                ipkController.text, sppController.text);
                                // print(value);
                          } else {
                            // ubah data
                            biodata.nama = namaController.text;
                            biodata.nbi = nbiController.text;
                            biodata.alamat = alamatController.text;
                            biodata.ipk = ipkController.text;
                            biodata.spp = sppController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, biodata);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}