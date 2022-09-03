import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mundial_cromos/logic/app_bloc.dart';
import 'package:mundial_cromos/models/cromo.dart';
import 'package:mundial_cromos/widgets/cromo_tile.dart';
import 'package:mundial_cromos/widgets/image_custom.dart';

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
