import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:latihan_simplean/models/kecamatan_model.dart';

abstract class KecamatanState extends Equatable {
  const KecamatanState();
  @override
  List<Object> get props => [];
}

class UnintializedState extends KecamatanState {}

class FetchingState extends KecamatanState {}

class FetchedState extends KecamatanState {
  final KecamatanModel kecamatanModel;

  FetchedState({@required this.kecamatanModel})
      : assert(kecamatanModel != null);

  @override
  List<Object> get props => [kecamatanModel];
}

class ErrorState extends KecamatanState {}

class EmptyState extends KecamatanState {}
