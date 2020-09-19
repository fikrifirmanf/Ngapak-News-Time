import 'package:equatable/equatable.dart';

abstract class KecamatanEvent extends Equatable {
  @override
  List<Object> get props => [];
  const KecamatanEvent();
}

class FetchKecamatan extends KecamatanEvent {}
