part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class OnLoadData extends AppEvent {}

class OnGetCromo extends AppEvent {
  OnGetCromo({
    required this.equipo,
    required this.cromo,
  });
  final Equipo equipo;
  final Cromo cromo;
}

class OnGetequipoSelect extends AppEvent {
  OnGetequipoSelect({
    required this.equipo,
  });
  final Equipo equipo;
}

class OnRepetido extends AppEvent {
  OnRepetido({
    required this.cromo,
    required this.cantidad,
  });

  final Cromo cromo;
  final int cantidad;
}

class OnSetRepetidos extends AppEvent {}
