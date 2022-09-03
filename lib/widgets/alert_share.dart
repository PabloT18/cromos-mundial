import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mundial_cromos/logic/app_bloc.dart';
import 'package:mundial_cromos/models/cromo.dart';
import 'package:share_plus/share_plus.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final album = context.read<AppBloc>().state.album!;
    // print(appbloc.state.album!.repetidos_total);

    return AlertDialog(
      title: const Text('Compartir Información'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Cromos Obtenidos'),
            onTap: () async {
              await shareObtenidos(album).then((value) {
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: const Text('Cromos Repetidos'),
            onTap: () async {
              await shareRepetidos(album).then((value) {
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  Future<void> shareObtenidos(Album album) async {
    String cadena =
        '*Album Mundial*\n\nLa cantidad de cromos que tengo es ${album.cantidad} y son:';

    cadena = '$cadena\nSecciones Especiales:';

    for (var seccion in album.secciones) {
      if (seccion.catidad > 0) {
        cadena = '$cadena\n * $seccion:';

        for (var cromo in seccion.cromos) {
          if (cromo.existe) {
            cadena = '$cadena\n   - $cromo ';
          }
        }
      }
    }
    for (var grupo in album.grupos) {
      if (grupo.hasCromos()) {
        cadena = '$cadena\n$grupo: ';
        for (var equipo in grupo.equipos) {
          if (equipo.catidad > 0) {
            cadena = '$cadena\n * $equipo:';

            for (var cromo in equipo.cromos) {
              if (cromo.existe) {
                cadena = '$cadena\n   - $cromo ';
              }
            }
          }
        }
      }
    }

    print(cadena);
    await Share.share(cadena);
  }

  Future<void> shareRepetidos(Album album) async {
    String cadena =
        '*Album Mundial*\n\nLa cantidad de cromos repetidos que tengo es ${album.repetidos_total} y son:';
    cadena = '$cadena\nSecciones Especiales:';

    for (var seccion in album.secciones) {
      if (seccion.hasRepetidos()) {
        cadena = '$cadena\n *${seccion.toString2()}:';
      }
      for (var cromo in seccion.cromos) {
        if (cromo.existe && cromo.repetido > 0) {
          cadena = '$cadena\n   - ${cromo.toString2()} ';
        }
      }
    }
    for (var grupo in album.grupos) {
      if (grupo.hasRepetidos()) {
        cadena = '$cadena\n$grupo: ';
        for (var equipo in grupo.equipos) {
          if (equipo.hasRepetidos()) {
            cadena = '$cadena\n * ${equipo.toString2()}:';
            for (var cromo in equipo.cromos) {
              if (cromo.existe && cromo.repetido > 0) {
                cadena = '$cadena\n   - ${cromo.toString2()} ';
              }
            }
          }
        }
      }
    }

    print(cadena);
    await Share.share(cadena);
  }
}
