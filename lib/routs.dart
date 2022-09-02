import 'package:flutter/material.dart';
import 'package:mundial_cromos/home_page.dart';
import 'package:mundial_cromos/repetidos_page.dart';
import 'package:mundial_cromos/seccion_page.dart';

class AppRoutes {
  static const String seccionPage = '/seccionPage';

  static const String homePage = '/';
  static const String repetidosPage = '/repetidos';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case seccionPage:
        return _fadeRoute(const SeccionPage(), seccionPage, settings);
      case homePage:
        return _fadeRoute(const HomePage(), homePage, settings);

      case repetidosPage:
        return _fadeRoute(const RepetidosPage(), repetidosPage, settings);

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _fadeRoute(
    Widget child,
    String routName,
    RouteSettings settings,
  ) {
    // return PageRouteBuilder(
    //   settings: RouteSettings(name: routName, arguments: settings.arguments),
    //   pageBuilder: (BuildContext context, ___, ____) => child,
    // );
    return MaterialPageRoute(builder: (context) => child, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Pagina No Encontrada posiblemente este en desarrollo'),
        ),
      );
    });
  }
}
