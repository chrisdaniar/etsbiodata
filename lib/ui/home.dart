import 'package:flutter/material.dart';
import 'package:etsbiodata/ui/entryform.dart';
import 'package:etsbiodata/models/biodata.dart';
import 'package:etsbiodata/helper/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Biodata> biodataList;

  @override
  Widget build(BuildContext context) {
    if (biodataList == null) {
      biodataList = List<Biodata>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var biodata = await navigateToEntryForm(context, null);
          if (biodata!= null) addBiodata(biodata);
        },
      ),
    );
  }

  Future<Biodata> navigateToEntryForm(
      BuildContext context, Biodata biodata) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(biodata);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange[800],
              child: Icon(Icons.people),
            ),
            title: Text(
              this.biodataList[index].nama,
              style: textStyle,
            ),
            subtitle: Text(this.biodataList[index].nbi, semanticsLabel: 'sembarang'),

            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteBiodata(biodataList[index]);
              },
            ),
            onTap: () async {
              var biodata =
                  await navigateToEntryForm(context, this.biodataList[index]);
              if (biodata != null) editBiodata(biodata);
            },
          ),
        );
      },
    );
  }

  void addBiodata(Biodata object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editBiodata(Biodata object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteBiodata(Biodata object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Biodata>> biodataListFuture = dbHelper.getBiodataList();
      biodataListFuture.then((biodataList) {
        setState(() {
          this.biodataList = biodataList;
          this.count = biodataList.length;
        });
      });
    });
  }
}
