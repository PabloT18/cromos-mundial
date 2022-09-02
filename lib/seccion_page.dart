import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mundial_cromos/home_page.dart';
import 'package:mundial_cromos/logic/app_bloc.dart';
import 'package:mundial_cromos/models/cromo.dart';

class SeccionPage extends StatefulWidget {
  const SeccionPage({Key? key}) : super(key: key);

  @override
  State<SeccionPage> createState() => _SeccionPageState();
}

class _SeccionPageState extends State<SeccionPage> {
  bool viewList = true;

  @override
  Widget build(BuildContext context) {
    Equipo equipo = context.read<AppBloc>().state.equipoSelected!;

    return Scaffold(
      appBar: AppBar(
        title: Text(equipo.nombre),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                viewList = !viewList;
              });
            },
            icon: const Icon(Icons.view_carousel),
            color: viewList ? Colors.grey : Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: equipo.codigoPais.isEmpty
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.all(12),
                      child: Hero(
                        tag: equipo.codigoAlbum,
                        child: CustomImage(
                            height: 35,
                            width: 45,
                            url:
                                'https://flagcdn.com/48x36/${equipo.codigoPais}.png'),
                      ),
                    ),
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return ListTile(
                  title: const Text('Cromos totales:'),
                  trailing: Text('${state.equipoSelected!.catidad}/19'),
                );
              },
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            if (viewList)
              ...equipo.cromos
                  .map((cromo) => CustomListTileCromo(
                        equipo: equipo,
                        cromo: cromo,
                      ))
                  .toList(),
            if (!viewList)
              Wrap(
                spacing: 10,
                children: equipo.cromos
                    .map((cromo) => BlocBuilder<AppBloc, AppState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                equipo.catidad =
                                    equipo.catidad + (cromo.existe ? -1 : 1);
                                context.read<AppBloc>().add(
                                    OnGetCromo(equipo: equipo, cromo: cromo));
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 36),
                                primary: Colors.white,
                              ),
                              child: Container(
                                // color: Colors.amber,
                                padding: const EdgeInsets.all(10),
                                child: FittedBox(
                                    child: Text(
                                  cromo.codigo,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: cromo.existe
                                        ? Colors.green
                                        : Colors.black,
                                  ),
                                )),
                              ),
                            );
                          },
                        ))
                    .toList(),
              ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTileCromo extends StatelessWidget {
  const CustomListTileCromo({
    Key? key,
    required this.equipo,
    required this.cromo,
    this.repetidospage = false,
  }) : super(key: key);

  final Equipo equipo;
  final Cromo cromo;
  final bool repetidospage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Slidable(
              key: Key(cromo.codigo),

              // The end action pane is the one at the right or the bottom side.

              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: cromo.existe
                        ? (context) => {
                              context
                                  .read<AppBloc>()
                                  .add(OnRepetido(cromo: cromo, cantidad: 1))
                            }
                        : null,

                    backgroundColor:
                        cromo.existe ? const Color(0xFF7BC043) : Colors.grey,

                    foregroundColor: Colors.white,
                    icon: Icons.plus_one,
                    label: 'Add',
                  ),
                  SlidableAction(
                    onPressed: cromo.existe && cromo.repetido > 0
                        ? (context) => {
                              context
                                  .read<AppBloc>()
                                  .add(OnRepetido(cromo: cromo, cantidad: -1))
                            }
                        : null,
                    backgroundColor: cromo.existe && cromo.repetido > 0
                        ? Colors.red
                        : Colors.grey,
                    foregroundColor: Colors.white,
                    icon: Icons.remove,
                    label: 'Rem',
                  ),
                ],
              ),

              child: ListTile(
                selected: repetidospage ? false : cromo.existe,
                selectedColor: Colors.green,
                leading: repetidospage && equipo.codigoPais.isNotEmpty
                    ? Column(
                        children: [
                          Text(
                            cromo.codigo,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: CustomImage(
                                height: 15,
                                width: 20,
                                url:
                                    'https://flagcdn.com/48x36/${equipo.codigoPais}.png'),
                          ),
                        ],
                      )
                    : Text(
                        cromo.codigo,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                title: Text(cromo.nombre),
                onTap: repetidospage
                    ? null
                    : () {
                        equipo.catidad =
                            equipo.catidad + (cromo.existe ? -1 : 1);
                        context
                            .read<AppBloc>()
                            .add(OnGetCromo(equipo: equipo, cromo: cromo));
                      },
                subtitle: Text('Repetidos: ${cromo.repetido}'),
              ),
            );
          },
        ),
        const Divider(),
      ],
    );
  }
}
