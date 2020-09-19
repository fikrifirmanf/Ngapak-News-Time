import 'package:latihan_simplean/models/kecamatan_model.dart';
import 'package:latihan_simplean/provider/kecamatan_prov.dart';

class KecamatanRepo {
  KecamatanProv _kecamatanProv = KecamatanProv();

  Future<KecamatanModel> fetchDataKecamatan() {
    return _kecamatanProv.fetchDataKecamatan();
  }
}
