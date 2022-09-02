part of 'app_bloc.dart';

@immutable
class AppState {
  const AppState({
    required this.album,
    required this.cantidadCromos,
    this.equipoSelected,
  });
  final Album? album;
  final int cantidadCromos;
  final Equipo? equipoSelected;

  AppState copyWith({
    Album? album,
    int? cantidadCromos,
    Equipo? equipoSelected,
  }) =>
      AppState(
        album: album ?? this.album,
        cantidadCromos: cantidadCromos ?? this.cantidadCromos,
        equipoSelected: equipoSelected ?? this.equipoSelected,
      );
}
