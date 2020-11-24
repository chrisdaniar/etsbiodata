class Biodata {
  int _id;
  String _nama;
  String _nbi;
  String _alamat;
  String _ipk;
  String _spp;

  // konstruktor versi 1
  Biodata(this._nama, this._nbi, this._alamat, this._ipk, this._spp);

  // konstruktor versi 2: konversi dari Map ke Contact
  Biodata.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._nbi = map['nbi'];
    this._alamat = map['alamat'];
    this._ipk = map['ipk'];
    this._spp = map['spp'];
  }

  // getter
  int get id => _id;
  String get nama => _nama;
  String get nbi => _nbi;
  String get alamat => _alamat;
  String get ipk => _ipk;
  String get spp => _spp;

  // setter
  set nama(String value) {
    _nama = value;
  }

  set nbi(String value) {
    _nbi = value;
  }

  set alamat(String value) {
    _alamat = value;
  }

  set ipk(String value) {
    _ipk = value;
  }

  set spp(String value) {
    _spp = value;
  }

  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = nama;
    map['nbi'] = nbi;
    map['alamat'] = alamat;
    map['ipk'] = ipk;
    map['spp'] = spp;
    return map;
  }
}
