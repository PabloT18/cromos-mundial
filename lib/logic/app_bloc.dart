import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mundial_cromos/models/cromo.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(const AppState(
          album: null,
          cantidadCromos: 0,
        )) {
    on<OnLoadData>(_appLoadData);
    on<OnGetCromo>(_onGetCromo);
    on<OnGetequipoSelect>(_onGetequipoSelect);
    on<OnRepetido>(_onRepetido);
  }

  static Box _getBox() => Hive.box('internalData');

  FutureOr<void> _appLoadData(event, Emitter<AppState> emit) {
    // dellData();
    final album = readSavedData();

    int cantidadCromos = 0;
    for (var seccion in album.secciones) {
      cantidadCromos = cantidadCromos + seccion.catidad;
    }
    for (var grupo in album.grupos) {
      for (var equipo in grupo.equipos) {
        cantidadCromos = cantidadCromos + equipo.catidad;
      }
    }

    saveData(album);

    emit(AppState(
      album: album,
      cantidadCromos: cantidadCromos,
    ));
  }

  saveData(Album album) async {
    Box box = _getBox();
    return await box.put('album', album.toJson());
  }

  Album readSavedData() {
    Box box = _getBox();
    final album = box.get('album');

    if (album != null) {
      return Album.fromJson(Map<String, dynamic>.from(album));
    } else {
      final album = Album.fromJson(Data.album);
      for (var grupo in album.grupos) {
        for (var equipo in grupo.equipos) {
          for (var i = 0; i < equipo.cromos.length; i++) {
            equipo.cromos[i].codigo =
                '${equipo.cromos[i].codigo.substring(0, 3)} ${i + 1}';
          }
        }
      }
      return album;
    }
  }

  dellData() {
    Box box = _getBox();
    box.delete('album');
  }

  FutureOr<void> _onGetCromo(OnGetCromo event, Emitter<AppState> emit) {
    // final albun = state.album!;
    // final equipoSelected = state.equipoSelected!;
    int cantidadCambio = event.cromo.existe ? -1 : 1;

    if (event.cromo.existe) {
      state.album!.repetidos_total =
          state.album!.repetidos_total - event.cromo.repetido;
      event.cromo.repetido = 0;
    }
    event.cromo.existe = !event.cromo.existe;

    state.album!.cantidad = state.cantidadCromos + cantidadCambio;

    state.equipoSelected!.catidad + cantidadCambio;

    saveData(state.album!);
    emit(state.copyWith(
      cantidadCromos: state.cantidadCromos + cantidadCambio,
    ));
  }

  FutureOr<void> _onGetequipoSelect(
      OnGetequipoSelect event, Emitter<AppState> emit) {
    emit(state.copyWith(equipoSelected: event.equipo));
  }

  FutureOr<void> _onRepetido(OnRepetido event, Emitter<AppState> emit) {
    event.cromo.repetido = event.cromo.repetido + event.cantidad;
    state.album!.repetidos_total =
        state.album!.repetidos_total + event.cantidad;
    saveData(state.album!);
    emit(state.copyWith());
  }
}
