class Biodata {
  int _id;
  String _nama;
  String _nbi;
  String _alamat;
  String _ipk;
  String _spp;
  String _tglLahir;
  String _wali;
  String _fakultas;
  String _prodi;
  String _kelamin;

  // konstruktor versi 1
  Biodata(this._nama, this._nbi, this._alamat, this._ipk, this._spp, this._tglLahir, this._fakultas, this._kelamin,
      this._prodi, this._wali);

  // konstruktor versi 2: konversi dari Map ke Contact
  Biodata.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._nbi = map['nbi'];
    this._alamat = map['alamat'];
    this._ipk = map['ipk'];
    this._spp = map['spp'];
    this._tglLahir = map['tglLahir'];
    this._prodi = map['prodi'];
    this._kelamin = map['kelamin'];
    this._fakultas = map['fakultas'];
    this._wali = map['wali'];
  }

  // getter
  int get id => _id;
  String get nama => _nama;
  String get nbi => _nbi;
  String get alamat => _alamat;
  String get ipk => _ipk;
  String get spp => _spp;
  String get tglLahir => _tglLahir;
  String get prodi => _prodi;
  String get fakultas => _fakultas;
  String get kelamin => _kelamin;
  String get wali => _wali;


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

  set tglLahir(String value) {
    _tglLahir = value;
  }

  set fakultas(String value) {
    _fakultas = value;
  }

  set prodi(String value) {
    _prodi = value;
  }

  set kelamin(String value) {
    _kelamin = value;
  }

  set wali(String value) {
    _wali = value;
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
    map['tglLahir'] = tglLahir;
    map['kelamin'] = kelamin;
    map['fakultas'] = fakultas;
    map['prodi'] = prodi;
    map['wali'] = wali;
    return map;
  }
}
