import 'package:bloc/bloc.dart';
import 'package:latihan_simplean/bloc/kecamatan_bloc/kecamatan_event.dart';
import 'package:latihan_simplean/bloc/kecamatan_bloc/kecamatan_state.dart';
import 'package:latihan_simplean/models/kecamatan_model.dart';
import 'package:latihan_simplean/repository/kecamatan_repo.dart';

class KecamatanBloc extends Bloc<KecamatanEvent, KecamatanState> {
  final KecamatanRepo kecamatanRepo;

  KecamatanBloc({this.kecamatanRepo})
      : assert(kecamatanRepo != null),
        super(UnintializedState());

  @override
  Stream<KecamatanState> mapEventToState(KecamatanEvent event) async* {
    if (event is FetchKecamatan) {
      yield FetchingState();
      try {
        KecamatanModel kecamatanModel;
        kecamatanModel = await kecamatanRepo.fetchDataKecamatan();
        yield FetchedState(kecamatanModel: kecamatanModel);
      } catch (e) {
        print(e.toString());
        yield ErrorState();
      }
    }
  }
}
