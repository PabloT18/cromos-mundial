import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mundial_cromos/logic/app_bloc.dart';
import 'package:mundial_cromos/models/cromo.dart';
import 'package:mundial_cromos/routs.dart';
import 'package:mundial_cromos/widgets/alert_share.dart';
import 'package:mundial_cromos/widgets/image_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mundial Qatar'),
        actions: [
          IconButton(
              onPressed: () async {
                // await Share.share('check out my website https://example.com');
                showDialog(
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: BlocProvider.of<AppBloc>(context),
                      child: const CustomAlertDialog(),
                    );
                  },
                );
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.album == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // print(state.album);
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Cromos Totales:',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    '${state.album!.cantidad}/638',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: ListTile(
                    title: const Text(
                      'Cromos Repetidos:',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Text(
                      '${state.album!.repetidos_total}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.repetidosPage),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      clipBehavior: Clip.hardEdge,
                      child: ExpansionTile(
                        title: const Text(
                          'Secciones Especiales',
                        ),
                        children: state.album!.secciones
                            .map((seccion) => ListTile(
                                  trailing: BlocBuilder<AppBloc, AppState>(
                                    builder: (context, state) {
                                      return Text('${seccion.catidad}');
                                    },
                                  ),
                                  title: Text(seccion.nombre),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.seccionPage,
                                        arguments: seccion);

                                    context.read<AppBloc>().add(
                                        OnGetequipoSelect(equipo: seccion));
                                  },
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
                ...state.album!.grupos.map((grupo) => Card(
                      clipBehavior: Clip.hardEdge,
                      child: ExpansionTile(
                        // key: GlobalKey(),
                        key: PageStorageKey(grupo.nombre),
                        title: Row(
                          children: [
                            Text(
                              grupo.nombre,
                            ),
                            ...grupo.equipos.map(
                              (e) => Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: CustomImage(
                                    height: 15,
                                    width: 20,
                                    url:
                                        'https://flagcdn.com/48x36/${e.codigoPais}.png'),
                              ),
                            )
                          ],
                        ),
                        children: grupo.equipos
                            .map((equipo) => EquipoWidget(
                                  equipo: equipo,
                                ))
                            .toList(),
                      ),
                    )),
                const SizedBox(height: 60),
                OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 2500),
                        content: SizedBox(
                          height: 50,
                          child: Column(
                            children: const [
                              Text('Desarrollado por: Pablo Torres'),
                              Text('ptorresp@ups.edu.ec'),
                            ],
                          ),
                        ),
                      ));
                    },
                    child: const Text(
                      'About',
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EquipoWidget extends StatelessWidget {
  const EquipoWidget({Key? key, required this.equipo}) : super(key: key);

  final Equipo equipo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: equipo.catidad == 19,
      selectedColor: Colors.blue,
      title: Row(
        children: [
          Hero(
            tag: equipo.codigoAlbum,
            child: CustomImage(
                url: 'https://flagcdn.com/48x36/${equipo.codigoPais}.png'),
          ),
          const SizedBox(width: 20),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Text(equipo.nombre);
            },
          ),
        ],
      ),
      trailing: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Text('${equipo.catidad}');
        },
      ),
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.seccionPage, arguments: equipo);
        context.read<AppBloc>().add(OnGetequipoSelect(equipo: equipo));
      },
    );
  }
}
