import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mundial_cromos/logic/app_bloc.dart';
import 'package:mundial_cromos/models/cromo.dart';
import 'package:mundial_cromos/widgets/cromo_tile.dart';

class RepetidosPage extends StatelessWidget {
  const RepetidosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        List<Cromo> repetidos = calcularRepetidos(state);
        context.read<AppBloc>().add(OnSetRepetidos());
        return Scaffold(
            appBar: AppBar(
              title: const Text('Repetidos'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Center(
                    child: Text(
                      '${state.album!.repetidos_total}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final cromo = repetidos[index];
                        final seccion = getEquipo(cromo, state);

                        return CustomListTileCromo(
                          cromo: cromo,
                          equipo: seccion!,
                          repetidospage: true,
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: repetidos.length),
                ),
              ],
            ));
      },
    );
  }

  List<Cromo> calcularRepetidos(AppState state) {
    List<Cromo> listado = [];
    var cantidad = 0;
    for (var seccion in state.album!.secciones) {
      for (var cromo in seccion.cromos) {
        if (cromo.existe && cromo.repetido > 0) {
          cantidad = cantidad + cromo.repetido;
          listado.add(cromo);
        }
      }
    }
    for (var grupo in state.album!.grupos) {
      for (var equipo in grupo.equipos) {
        for (var cromo in equipo.cromos) {
          if (cromo.existe && cromo.repetido > 0) {
            cantidad = cantidad + cromo.repetido;

            listado.add(cromo);
          }
        }
      }
    }
    state.album!.repetidos_total = cantidad;

    return listado;
  }

  Equipo? getEquipo(Cromo cromor, AppState state) {
    for (var seccion in state.album!.secciones) {
      for (var cromo in seccion.cromos) {
        if (cromor == cromo) {
          return seccion;
        }
      }
    }
    for (var grupo in state.album!.grupos) {
      for (var equipo in grupo.equipos) {
        for (var cromo in equipo.cromos) {
          if (cromo == cromor) return equipo;
        }
      }
    }
    return null;
  }
}
