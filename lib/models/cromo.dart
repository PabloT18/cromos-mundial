// To parse required this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    required this.secciones,
    required this.grupos,
    this.cantidad = 0,
    this.repetidos_total = 0,
  });

  List<Equipo> secciones;
  List<Grupo> grupos;
  int cantidad;
  int repetidos_total;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
      secciones: List<Equipo>.from(json["secciones"]
          .map((x) => Equipo.fromJson(Map<String, dynamic>.from(x)))),
      grupos: List<Grupo>.from(json["grupos"]
          .map((x) => Grupo.fromJson(Map<String, dynamic>.from(x)))),
      cantidad: json["cantidad"],
      repetidos_total: json["repetidos_total"]);

  Map<String, dynamic> toJson() => {
        "secciones": List<dynamic>.from(secciones.map((x) => x.toJson())),
        "grupos": List<dynamic>.from(grupos.map((x) => x.toJson())),
        "cantidad": cantidad,
        "repetidos_total": repetidos_total,
      };
}

class Grupo {
  Grupo({
    required this.nombre,
    required this.equipos,
  });

  String nombre;
  List<Equipo> equipos;

  factory Grupo.fromJson(Map<String, dynamic> json) => Grupo(
        nombre: json["nombre"],
        equipos: List<Equipo>.from(json["equipos"]
            .map((x) => Equipo.fromJson(Map<String, dynamic>.from(x)))),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "equipos": List<dynamic>.from(equipos.map((x) => x.toJson())),
      };
}

class Equipo {
  Equipo({
    required this.nombre,
    required this.codigoPais,
    required this.codigoAlbum,
    required this.catidad,
    required this.cromos,
  });

  String nombre;
  String codigoPais;
  String codigoAlbum;
  int catidad;
  List<Cromo> cromos;

  factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
        nombre: json["nombre"],
        codigoPais: json["codigo_pais"] ?? '',
        codigoAlbum: json["codigo_album"],
        catidad: json["catidad"],
        cromos: List<Cromo>.from(json["cromos"]
            .map((x) => Cromo.fromJson(Map<String, dynamic>.from(x)))),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "codigo_pais": codigoPais,
        "codigo_album": codigoAlbum,
        "catidad": catidad,
        "cromos": List<dynamic>.from(cromos.map((x) => x.toJson())),
      };
}

class Cromo {
  Cromo({
    required this.codigo,
    required this.nombre,
    this.existe = false,
    this.repetido = 0,
  });

  String codigo;
  String nombre;
  bool existe;
  int repetido;

  factory Cromo.fromJson(Map<String, dynamic> json) => Cromo(
        codigo: json["codigo"],
        nombre: json["nombre"],
        existe: json["existe"],
        repetido: json["repetido"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "existe": existe,
        "repetido": repetido,
      };
}

class Data {
  static const album = {
    "cantidad": 0,
    "repetidos_total": 0,
    "secciones": [
      {
        "nombre": "FIFA",
        "codigo_album": "00",
        "catidad": 0,
        "cromos": [
          {
            "codigo": "00",
            "nombre": "Logo Panini - Especial",
            "existe": false,
            "repetido": 0
          },
          {"codigo": "FWC1", "nombre": "FIFA", "existe": false, "repetido": 0},
          {
            "codigo": "FWC2",
            "nombre": "Trofeo Primera Parte - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC3",
            "nombre": "Trofeo Segunda Parte - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC4",
            "nombre": "Mascota Primera Parte - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC5",
            "nombre": "Mascota Segunda Parte - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC6",
            "nombre": "Logo Mundial Primera Parte - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC7",
            "nombre": "Logo Mundiall Segunda Parte - Especial",
            "existe": false,
            "repetido": 0
          }
        ]
      },
      {
        "nombre": "Estadios",
        "codigo_album": "FWC",
        "catidad": 0,
        "cromos": [
          {
            "codigo": "FWC8",
            "nombre": "  Ahmad Bin Ali Stadium",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC9",
            "nombre": "  Al Janoub Stadium",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC10",
            "nombre": "Al Thumama Stadium",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC11",
            "nombre": "Education City Stadium",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC12",
            "nombre": "Khalifa International Stadium",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC13",
            "nombre": "Stadium 974",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC14",
            "nombre": "Al Bayt Stadium Exterior",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC15",
            "nombre": "Al Bayt Stadium iInterior",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC16",
            "nombre": "Lusail Stadium Exterior",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC17",
            "nombre": "Lusail Stadium Interior",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC18",
            "nombre": "Balón Oficial",
            "existe": false,
            "repetido": 0
          }
        ]
      },
      {
        "nombre": "Museo FIFA",
        "codigo_album": "FWC19",
        "catidad": 0,
        "cromos": [
          {
            "codigo": "FWC19",
            "nombre": "Uruguay 1930 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC20",
            "nombre": "Italia 1938 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC21",
            "nombre": "Brasil 1958 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC22",
            "nombre": "Inglaterra 1966 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC23",
            "nombre": "Brasil 1970 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC24",
            "nombre": "Argentina 1978 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC25",
            "nombre": "Italia 1982 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC26",
            "nombre": "Alemania Federal 1990 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC27",
            "nombre": "Francia 1998 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC28",
            "nombre": "España 2010 - Especial",
            "existe": false,
            "repetido": 0
          },
          {
            "codigo": "FWC29",
            "nombre": "Francia 2018 - Especial",
            "existe": false,
            "repetido": 0
          }
        ]
      }
    ],
    "grupos": [
      {
        "nombre": "Grupo A",
        "equipos": [
          {
            "nombre": "Qatar",
            "codigo_pais": "qa",
            "codigo_album": "QAT",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "QAT1",
                "nombre": "Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT3",
                "nombre": "Saad Al Sheeb",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT4",
                "nombre": "Meshaal Barsham",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT5",
                "nombre": "Homam Ahmed",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT6",
                "nombre": "Bassam Alrawi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT7",
                "nombre": "Abdulkarim Hassan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT8",
                "nombre": "Musaab Khidir",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT9",
                "nombre": "Boualem Khoukhi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT10",
                "nombre": "Pedro Miguel",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT11",
                "nombre": "Tarek Salman",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT12",
                "nombre": "Karim Boudiaf",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT13",
                "nombre": "Abdulaziz Hatem",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT14",
                "nombre": "Assim Omer Madibo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT15",
                "nombre": "Yousuf Abdurisag",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT16",
                "nombre": "Akram Hassan Afif",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT17",
                "nombre": "Ahmad Alaaeldin",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT18",
                "nombre": "Hasan Al-Haydos",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT19",
                "nombre": "Almoez Ali",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "QAT20",
                "nombre": "Mohammed Muntari",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Ecuador",
            "codigo_pais": "ec",
            "codigo_album": "ECU",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "ECU1",
                "nombre": "Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU3",
                "nombre": "Hernán Galíndez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU4",
                "nombre": "Alexander Domínguez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU5",
                "nombre": "Robert Arboleda",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU6",
                "nombre": "Byron Castillo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU7",
                "nombre": "Pervis Estupiñán",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU8",
                "nombre": "Piero Hincapié",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU9",
                "nombre": "Ángelo Preciado",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU10",
                "nombre": "Félix Torres",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU11",
                "nombre": "Moisés Caicedo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU12",
                "nombre": "Alan Franco",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU13",
                "nombre": "Carlos Gruezo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU14",
                "nombre": "Jhegson Méndez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU15",
                "nombre": "Jeremy Sarmiento",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU16",
                "nombre": "Michael Estrada",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU17",
                "nombre": "Ángel Mena",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU18",
                "nombre": "Gonzalo Plata",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU19",
                "nombre": "Ayrton Preciado",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ECU20",
                "nombre": "Enner Valencia",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Senegal",
            "codigo_pais": "sn",
            "codigo_album": "SEN",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "SEN1",
                "nombre": "Foyo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN3",
                "nombre": "Édouard Mendy",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN4",
                "nombre": "Alfred Gomis",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN5",
                "nombre": "Saliou Ciss",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN6",
                "nombre": "Pape Abou Cissé",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN7",
                "nombre": "Abdou Diallo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN8",
                "nombre": "Kalidou Koulibaly",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN9",
                "nombre": "Ibrahima Mbaye",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN10",
                "nombre": "Bouna Sarr",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN11",
                "nombre": "Krépin Diatta",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN12",
                "nombre": "Idrissa Gueye",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN13",
                "nombre": "Pape Gueye",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN14",
                "nombre": "Cheikhou Kouyaté",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN15",
                "nombre": "Nampalys Mendy",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN16",
                "nombre": "Boulaye Dia",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN17",
                "nombre": "Famara Diédhiou",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN18",
                "nombre": "Bamba Dieng",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN19",
                "nombre": "Sadio Mané",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SEN20",
                "nombre": "Ismaïla Sarr",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Holanda",
            "codigo_pais": "nl",
            "codigo_album": "NED",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "NED1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED3",
                "nombre": "  Justin Bijlow",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED4",
                "nombre": "  Jasper Cillessen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED5",
                "nombre": "  Daley Blind",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED6",
                "nombre": "  Matthijs de Ligt",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED7",
                "nombre": "  Stefan de Vrij",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED8",
                "nombre": "  Denzel Dumfries",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED9",
                "nombre": "  Virgil van Dijk",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED10",
                "nombre": "Steven Berghuis",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED11",
                "nombre": "Frenkie de Jong",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED12",
                "nombre": "Ryan Gravenberch",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED13",
                "nombre": "Davy Klaassen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED14",
                "nombre": "Teun Koopmeiners",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED15",
                "nombre": "Georginio Wijnaldum",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED16",
                "nombre": "Steven Bergwijn",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED17",
                "nombre": "Arnaut Danjuma",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED18",
                "nombre": "Memphis Depay",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED19",
                "nombre": "Cody Gakpo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "NED20",
                "nombre": "Donyell Malen",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      },
      {
        "nombre": "Grupo B",
        "equipos": [
          {
            "nombre": "Inglaterra",
            "codigo_pais": "gb-eng",
            "codigo_album": "ENG",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "ENG1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG3",
                "nombre": "  Jordan Pickford",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG4",
                "nombre": "  Aaron Ramsdale",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG5",
                "nombre": "  Trent Alexander-Arnold",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG6",
                "nombre": "  Conor Coady",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG7",
                "nombre": "  Harry Maguire",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG8",
                "nombre": "  Luke Shaw",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG9",
                "nombre": "  John Stones",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG10",
                "nombre": "Kyle Walker",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG11",
                "nombre": "Jude Bellingham",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG12",
                "nombre": "Jack Grealish",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG13",
                "nombre": "Jordan Henderson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG14",
                "nombre": "Mason Mount",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG15",
                "nombre": "Kalvin Phillips",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG16",
                "nombre": "Declan Rice",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG17",
                "nombre": "Phil Foden",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG18",
                "nombre": "Harry Kane",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG19",
                "nombre": "Bukayo Saka",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ENG20",
                "nombre": "Raheem Sterling",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Irán",
            "codigo_pais": "ir",
            "codigo_album": "IRN",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "IRN1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN3",
                "nombre": "  Amir Abedzadeh",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN4",
                "nombre": "  Alireza Beiranvand",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN5",
                "nombre": "  Ehsan Hajsafi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN6",
                "nombre": "  Majid Hosseini",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN7",
                "nombre": "  Hossein Kanaani",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN8",
                "nombre": "  Shoja Khalilzadeh",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN9",
                "nombre": "  Milad Mohammadi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN10",
                "nombre": "Sadegh Moharrami",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN11",
                "nombre": "Omid Noorafkan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN12",
                "nombre": "Vahid Amiri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN13",
                "nombre": "Saeid Ezatolahi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN14",
                "nombre": "Ali Gholizadeh",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN15",
                "nombre": "Alireza Jahanbakhsh",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN16",
                "nombre": "Ahmad Nourollahi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN17",
                "nombre": "Karim Ansarifard",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN18",
                "nombre": "Sardar Azmoun",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN19",
                "nombre": "Saman Ghoddos",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "IRN20",
                "nombre": "Mehdi Taremi",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Estados Unidos",
            "codigo_pais": "us",
            "codigo_album": "USA",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "USA1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA3",
                "nombre": "  Matt Turner",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA4",
                "nombre": "  Zack Steffen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA5",
                "nombre": "  Sergiño Dest",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA6",
                "nombre": "  Aaron Long",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA7",
                "nombre": "  Chris Richards",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA8",
                "nombre": "  Antonee Robinson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA9",
                "nombre": "  DeAndre Yedlin",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA10",
                "nombre": "Walker Zimmerman",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA11",
                "nombre": "Brenden Aaronson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA12",
                "nombre": "Kellyn Acosta",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA13",
                "nombre": "Tyler Adams",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA14",
                "nombre": "Weston McKennie",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA15",
                "nombre": "Yunus Musah",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA16",
                "nombre": "Jesús Ferreira",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA17",
                "nombre": "Ricardo Pepi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA18",
                "nombre": "Christian Pulisic",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA19",
                "nombre": "Giovanni Reyna",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "USA20",
                "nombre": "Timothy Weah",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Gales",
            "codigo_pais": "gb-wls",
            "codigo_album": "WAL",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "WAL1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL3",
                "nombre": "  Danny Ward",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL4",
                "nombre": "  Wayne Hennessey",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL5",
                "nombre": "  Ethan Ampadu",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL6",
                "nombre": "  Ben Davies",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL7",
                "nombre": "  Chris Gunter",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL8",
                "nombre": "  Chris Mepham",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL9",
                "nombre": "  Connor Roberts",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL10",
                "nombre": "Joe Rodon",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL11",
                "nombre": "Neco Williams",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL12",
                "nombre": "Joe Allen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL13",
                "nombre": "Joe Morrell",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL14",
                "nombre": "Aaron Ramsey",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL15",
                "nombre": "Jonathan Williams",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL16",
                "nombre": "Harry Wilson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL17",
                "nombre": "Gareth Bale",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL18",
                "nombre": "Daniel James",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL19",
                "nombre": "Brennan Johnson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "WAL20",
                "nombre": "Kieffer Moore",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      },
      {
        "nombre": "Grupo C",
        "equipos": [
          {
            "nombre": "Argentina",
            "codigo_pais": "ar",
            "codigo_album": "ARG",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "ARG1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG3",
                "nombre": "  Emiliano Martínez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG4",
                "nombre": "  Franco Armani",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG5",
                "nombre": "  Marcos Acuña",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG6",
                "nombre": "  Nahuel Molina",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG7",
                "nombre": "  Nicolás Otamendi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG8",
                "nombre": "  Germán Pezzella",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG9",
                "nombre": "  Cristian Romero",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG10",
                "nombre": "Rodrigo De Paul",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG11",
                "nombre": "Ángel Di María",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG12",
                "nombre": "Giovani Lo Celso",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG13",
                "nombre": "Leandro Paredes",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG14",
                "nombre": "Guido Rodríguez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG15",
                "nombre": "Julián Álvarez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG16",
                "nombre": "Joaquín Correa",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG17",
                "nombre": "Alejandro Gómez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG18",
                "nombre": "Nicolás González",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG19",
                "nombre": "Lautaro Martínez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ARG20",
                "nombre": "Lionel Messi",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Arabia Saudi",
            "codigo_pais": "sa",
            "codigo_album": "KSA",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "KSA1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA3",
                "nombre": "  Mohammed Al-Owais",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA4",
                "nombre": "  Mohammed Al-Rubaie",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA5",
                "nombre": "  Abdulelah Al-Amri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA6",
                "nombre": "  Ali Al-Boleahi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA7",
                "nombre": "  Mohammed Al-Burayk",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA8",
                "nombre": "  Sultan Al-Ghannam",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA9",
                "nombre": "  Yasser Al-Shahrani",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA10",
                "nombre": "Hassan Al-Tambakti",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA11",
                "nombre": "Abdullah Madu",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA12",
                "nombre": "Salman Al-Faraj",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA13",
                "nombre": "Abdulelah Al-Malki",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA14",
                "nombre": "Sami Al-Najei",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA15",
                "nombre": "Hattan Bahebri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA16",
                "nombre": "Mohamed Kanno",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA17",
                "nombre": "Abdullah Otayf",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA18",
                "nombre": "Firas Al-Buraikan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA19",
                "nombre": "Salem Al-Dawsari",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KSA20",
                "nombre": "Khalid Al-Ghannam",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "México",
            "codigo_pais": "mx",
            "codigo_album": "MEX",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "MEX1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX3",
                "nombre": "  Guillermo Ochoa",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX4",
                "nombre": "  Alfredo Talavera",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX5",
                "nombre": "  Néstor Araújo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX6",
                "nombre": "  Jesús Gallardo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX7",
                "nombre": "  César Montes",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX8",
                "nombre": "  Héctor Moreno",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX9",
                "nombre": "  Luis Romo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX10",
                "nombre": "Jorge Sánchez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX11",
                "nombre": "Edson Álvarez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX12",
                "nombre": "Jesús Manuel Corona",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX13",
                "nombre": "Andrés Guardado",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX14",
                "nombre": "Érick Gutiérrez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX15",
                "nombre": "Héctor Herrera",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX16",
                "nombre": "Diego Lainez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX17",
                "nombre": "Carlos Rodríguez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX18",
                "nombre": "Rogelio Funes Mori",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX19",
                "nombre": "Raúl Jiménez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MEX20",
                "nombre": "Hirving Lozano",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Polonia",
            "codigo_pais": "pl",
            "codigo_album": "POL",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "POL1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL3",
                "nombre": "  Wojciech Szczęsny",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL4",
                "nombre": "  Łukasz Skorupski",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL5",
                "nombre": "  Jan Bednarek",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL6",
                "nombre": "  Bartosz Bereszyński",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL7",
                "nombre": "  Matty Cash",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL8",
                "nombre": "  Kamil Glik",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL9",
                "nombre": "  Tymoteusz Puchacz",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL10",
                "nombre": "Maciej Rybus",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL11",
                "nombre": "Kamil Jóźwiak",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL12",
                "nombre": "Mateusz Klich",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL13",
                "nombre": "Grzegorz Krychowiak",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL14",
                "nombre": "Jakub Moder",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL15",
                "nombre": "Sebastian Szymański",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL16",
                "nombre": "Piotr Zieliński",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL17",
                "nombre": "Robert Lewandowski",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL18",
                "nombre": "Arkadiusz Milik",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL19",
                "nombre": "Krzysztof Piątek",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POL20",
                "nombre": "Karol Świderski",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      },
      {
        "nombre": "Grupo D",
        "equipos": [
          {
            "nombre": "Francia",
            "codigo_pais": "fr",
            "codigo_album": "FRA",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "FRA1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA3",
                "nombre": "  Hugo Lloris",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA4",
                "nombre": "  Mike Maignan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA5",
                "nombre": "  Lucas Hernández",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA6",
                "nombre": " Theo Hernández",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA7",
                "nombre": "  Presnel Kimpembe",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA8",
                "nombre": "  Jules Koundé",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA9",
                "nombre": "  Benjamin Pavard",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA10",
                "nombre": "Raphaël Varane",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA11",
                "nombre": "N’Golo Kanté",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA12",
                "nombre": "Paul Pogba",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA13",
                "nombre": "Adrien Rabiot",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA14",
                "nombre": "Aurélien Tchouaméni",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA15",
                "nombre": "Wissam Ben Yedder",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA16",
                "nombre": "Karim Benzema",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA17",
                "nombre": "Kingsley Coman",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA18",
                "nombre": "Antoine Griezmann",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA19",
                "nombre": "Kylian Mbappé",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "FRA20",
                "nombre": "Christopher Nkunku",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Australia",
            "codigo_pais": "au",
            "codigo_album": "AUS",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "AUS1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS3",
                "nombre": "  Mathew Ryan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS4",
                "nombre": "  Andrew Redmayne",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS5",
                "nombre": "  Aziz Behich",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS6",
                "nombre": "  Miloš Degenek",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS7",
                "nombre": "  Rhyan Grant",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS8",
                "nombre": "  Joel King",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS9",
                "nombre": "  Trent Sainsbury",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS10",
                "nombre": "Harry Souttar",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS11",
                "nombre": "Ajdin Hrustić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS12",
                "nombre": "Jackson Irvine",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS13",
                "nombre": "James Jeggo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS14",
                "nombre": "Awer Mabil",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS15",
                "nombre": "Aaron Mooy",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS16",
                "nombre": "Martin Boyle",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS17",
                "nombre": "Mitchell Duke",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS18",
                "nombre": "Craig Goodwin",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS19",
                "nombre": "Mathew Leckie",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "AUS20",
                "nombre": "Adam Taggart",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Dinamarca",
            "codigo_pais": "dk",
            "codigo_album": "DEN",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "DEN1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN3",
                "nombre": "  Kasper Schmeichel",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN4",
                "nombre": "  Frederik Rønnow",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN5",
                "nombre": "  Andreas Christensen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN6",
                "nombre": "  Simon Kjær",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN7",
                "nombre": "  Joakim Mæhle",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN8",
                "nombre": "  Jens Stryger Larsen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN9",
                "nombre": "  Jannik Vestergaard",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN10",
                "nombre": "Mikkel Damsgaard",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN11",
                "nombre": "Thomas Delaney",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN12",
                "nombre": "Christian Eriksen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN13",
                "nombre": "Pierre Emile Højbjerg",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN14",
                "nombre": "Christian Nørgaard",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN15",
                "nombre": "Daniel Wass",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN16",
                "nombre": "Martin Braithwaite",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN17",
                "nombre": "Kasper Dolberg",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN18",
                "nombre": "Yussuf Poulsen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN19",
                "nombre": "Andreas Skov Olsen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "DEN20",
                "nombre": "Jonas Wind",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Tunez",
            "codigo_pais": "tn",
            "codigo_album": "TUN",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "TUN1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN3",
                "nombre": "  Bechir Ben Saïd",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN4",
                "nombre": "  Farouk Ben Mustapha",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN5",
                "nombre": "  Dylan Bronn",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN6",
                "nombre": "  Mohamed Dräger",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN7",
                "nombre": "  Bilel Ifa",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN8",
                "nombre": "  Ali Maâloul",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN9",
                "nombre": "  Hamza Mathlouthi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN10",
                "nombre": "Yassine Meriah",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN11",
                "nombre": "Montassar Talbi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN12",
                "nombre": "Mohamed Ali Ben Romdhane",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN13",
                "nombre": "Wahbi Khazri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN14",
                "nombre": "Aïssa Laïdouni",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN15",
                "nombre": "Ferjani Sassi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN16",
                "nombre": "Ellyes Skhiri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN17",
                "nombre": "Anis Slimane",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN18",
                "nombre": "Seifeddine Jaziri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN19",
                "nombre": "Youssef Msakni",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "TUN20",
                "nombre": "Naïm Sliti",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      },
      {
        "nombre": "Grupo E",
        "equipos": [
          {
            "nombre": "España",
            "codigo_pais": "es",
            "codigo_album": "ESP",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "ESP1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP3",
                "nombre": "  Unai Simón",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP4",
                "nombre": "  Robert Sánchez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP5",
                "nombre": "  César Azpilicueta",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP6",
                "nombre": "  Eric García",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP7",
                "nombre": "  Jordi Alba",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP8",
                "nombre": "  Aymeric Laporte",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP9",
                "nombre": "  Pau Torres",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP10",
                "nombre": "Gavi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP11",
                "nombre": "Koke",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP12",
                "nombre": "Marcos Llorente",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP13",
                "nombre": "Pedri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP14",
                "nombre": "Rodri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP15",
                "nombre": "Sergio Busquets",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP16",
                "nombre": "Dani Olmo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP17",
                "nombre": "Ansu Fati",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP18",
                "nombre": "Ferran Torres",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP19",
                "nombre": "Álvaro Morata",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "ESP20",
                "nombre": "Pablo Sarabia",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Costa Rica",
            "codigo_pais": "cr",
            "codigo_album": "CRC",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "CRC1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC3",
                "nombre": "  Keylor Navas",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC4",
                "nombre": "  Leonel Moreira",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC5",
                "nombre": "  Ricardo Blanco",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC6",
                "nombre": "  Francisco Calvo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC7",
                "nombre": "  Óscar Duarte",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC8",
                "nombre": "  Keysher Fuller",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC9",
                "nombre": "  Bryan Oviedo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC10",
                "nombre": "Juan Pablo Vargas",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC11",
                "nombre": "Kendall Waston",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC12",
                "nombre": "Celso Borges",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC13",
                "nombre": "Orlando Galo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC14",
                "nombre": "Bryan Ruiz",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC15",
                "nombre": "Yeltsin Tejeda",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC16",
                "nombre": "ewison Bennette",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC17",
                "nombre": "Joel Campbell",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC18",
                "nombre": "Anthony Contreras",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC19",
                "nombre": "Gerson Torres",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRC20",
                "nombre": "Johan Venegas",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Alemania",
            "codigo_pais": "de",
            "codigo_album": "GER",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "GER1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER3",
                "nombre": "  Manuel Neuer",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER4",
                "nombre": "  Marc-André ter Stegen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER5",
                "nombre": "  Matthias Ginter",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER6",
                "nombre": "  Robin Gosens",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER7",
                "nombre": "  Thilo Kehrer",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER8",
                "nombre": "  David Raum",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER9",
                "nombre": "  Antonio Rüdiger",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER10",
                "nombre": "Niklas Süle",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER11",
                "nombre": "Leon Goretzka",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER12",
                "nombre": "İlkay Gündoğan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER13",
                "nombre": "Kai Havertz",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER14",
                "nombre": "Jonas Hofmann",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER15",
                "nombre": "Joshua Kimmich",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER16",
                "nombre": "Serge Gnabry",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER17",
                "nombre": "Thomas Müller",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER18",
                "nombre": "Marco Reus",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER19",
                "nombre": "Leroy Sané",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GER20",
                "nombre": "Timo Werner",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Japón",
            "codigo_pais": "jp",
            "codigo_album": "JPN",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "JPN1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN3",
                "nombre": "  Shuichi Gonda",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN4",
                "nombre": "  Eiji Kawashima",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN5",
                "nombre": "  Yuto Nagatomo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN6",
                "nombre": "  Yuta Nakayama",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN7",
                "nombre": "  Takehiro Tomiyasu",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN8",
                "nombre": "  Miki Yamane",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN9",
                "nombre": "  Maya Yoshida",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN10",
                "nombre": "Wataru Endo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN11",
                "nombre": "Genki Haraguchi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN12",
                "nombre": "Hidemasa Morita",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN13",
                "nombre": "Gaku Shibasaki",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN14",
                "nombre": "Ao Tanaka",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN15",
                "nombre": "Takuma Asano",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN16",
                "nombre": "Kyogo Furuhashi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN17",
                "nombre": "Junya Ito",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN18",
                "nombre": "Takumi Minamino",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN19",
                "nombre": "Kaoru Mitoma",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "JPN20",
                "nombre": "Yuya Osako",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      },
      {
        "nombre": "Grupo F",
        "equipos": [
          {
            "nombre": "Bélgica",
            "codigo_pais": "be",
            "codigo_album": "BEL",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "BEL1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL3",
                "nombre": "  Thibaut Courtois",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL4",
                "nombre": "  Simon Mignolet",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL5",
                "nombre": "  Toby Alderweireld",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL6",
                "nombre": "  Timothy Castagne",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL7",
                "nombre": "  Jason Denayer",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL8",
                "nombre": "  Thomas Meunier",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL9",
                "nombre": "  Jan Vertonghen",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL10",
                "nombre": "Yannick Carrasco",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL11",
                "nombre": "Kevin De Bruyne",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL12",
                "nombre": "Charles De Ketelaere",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL13",
                "nombre": "Thorgan Hazard",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL14",
                "nombre": "Youri Tielemans",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL15",
                "nombre": "Hans Vanaken",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL16",
                "nombre": "Axel Witsel",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL17",
                "nombre": "Jérémy Doku",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL18",
                "nombre": "Eden Hazard",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL19",
                "nombre": "Romelu Lukaku",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BEL20",
                "nombre": "Dries Mertens",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Canadá",
            "codigo_pais": "ca",
            "codigo_album": "CAN",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "CAN1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN3",
                "nombre": "  Milan Borjan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN4",
                "nombre": "  Maxime Crépeau",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN5",
                "nombre": "  Samuel Adekugbe",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN6",
                "nombre": "  Doneil Henry",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN7",
                "nombre": "  Alistair Johnston",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN8",
                "nombre": "  Richie Laryea",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN9",
                "nombre": "  Kamal Miller",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN10",
                "nombre": "Steven Vitória",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN11",
                "nombre": "Tajon Buchanan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN12",
                "nombre": "Alphonso Davies",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN13",
                "nombre": "Stephen Eustáquio",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN14",
                "nombre": "Atiba Hutchinson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN15",
                "nombre": "Mark-Anthony Kaye",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN16",
                "nombre": "Jonathan Osorio",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN17",
                "nombre": "Samuel Piette",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN18",
                "nombre": "Jonathan David",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN19",
                "nombre": "David Junior Hoilett",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CAN20",
                "nombre": "Cyle Larin",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Marruecos",
            "codigo_pais": "ma",
            "codigo_album": "MAR",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "MAR1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR3",
                "nombre": "  Yassine Bounou",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR4",
                "nombre": "  Munir Mohamedi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR5",
                "nombre": "  Nayef Aguerd",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR6",
                "nombre": "  Achraf Hakimi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR7",
                "nombre": "  Adam Masina",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR8",
                "nombre": "  Samy Mmaee",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR9",
                "nombre": "  Romain Saïss",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR10",
                "nombre": "Selim Amallah",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR11",
                "nombre": "Sofyan Amrabat",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR12",
                "nombre": "Aymen Barkok",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR13",
                "nombre": "Ilias Chair",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR14",
                "nombre": "Imrân Louza",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR15",
                "nombre": "Sofiane Boufal",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR16",
                "nombre": "Ayoub El Kaabi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR17",
                "nombre": "Youssef En-Nesyri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR18",
                "nombre": "Ryan Mmaee",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR19",
                "nombre": "Munir",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "MAR20",
                "nombre": "Tarik Tissoudali",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Croacia",
            "codigo_pais": "hr",
            "codigo_album": "CRO",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "CRO1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO3",
                "nombre": "  Dominik Livaković",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO4",
                "nombre": "  Ivica Ivušić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO5",
                "nombre": "  Duje Ćaleta-Car",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO6",
                "nombre": "  Joško Gvardiol",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO7",
                "nombre": "  Josip Juranović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO8",
                "nombre": "  Dejan Lovren",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO9",
                "nombre": "  Borna Sosa",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO10",
                "nombre": "Domagoj Vida",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO11",
                "nombre": "Marcelo Brozović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO12",
                "nombre": "Mateo Kovačić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO13",
                "nombre": "Luka Modrić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO14",
                "nombre": "Mario Pašalić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO15",
                "nombre": "Ivan Perišić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO16",
                "nombre": "Nikola Vlašić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO17",
                "nombre": "Josip Brekalo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO18",
                "nombre": "Andrej Kramarić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO19",
                "nombre": "Marko Livaja",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CRO20",
                "nombre": "Mislav Oršić",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      },
      {
        "nombre": "Grupo G",
        "equipos": [
          {
            "nombre": "Brasil",
            "codigo_pais": "br",
            "codigo_album": "BRA",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "BRA1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA3",
                "nombre": "  Alisson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA4",
                "nombre": "  Ederson",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA5",
                "nombre": "  Alex Sandro",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA6",
                "nombre": "  Danilo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA7",
                "nombre": "  Éder Militão",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA8",
                "nombre": "  Marquinhos",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA9",
                "nombre": "  Thiago Silva",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA10",
                "nombre": "Casemiro",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA11",
                "nombre": "Philippe Coutinho",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA12",
                "nombre": "Fabinho",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA13",
                "nombre": "Fred",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA14",
                "nombre": "Lucas Paquetá",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA15",
                "nombre": "Antony",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA16",
                "nombre": "Gabriel Jesus",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA17",
                "nombre": "Neymar Jr",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA18",
                "nombre": "Raphinha",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA19",
                "nombre": "Richarlison",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "BRA20",
                "nombre": "Vinícius Jr",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Serbia",
            "codigo_pais": "rs",
            "codigo_album": "SRB",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "SRB1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB3",
                "nombre": "  Predrag Rajković",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB4",
                "nombre": "  Vanja Milinković-Savić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB5",
                "nombre": "  Nikola Milenković",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB6",
                "nombre": "  Strahinja Pavlović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB7",
                "nombre": "  Miloš Veljković",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB8",
                "nombre": "  Filip Đuričić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB9",
                "nombre": "  Nemanja Gudelj",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB10",
                "nombre": "Filip Kostić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB11",
                "nombre": "Darko Lazović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB12",
                "nombre": "Saša Lukić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB13",
                "nombre": "Nemanja Maksimović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB14",
                "nombre": "Sergej Milinković-Savić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB15",
                "nombre": "Nemanja Radonjić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB16",
                "nombre": "Andrija Živković",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB17",
                "nombre": "Luka Jović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB18",
                "nombre": "Aleksandar Mitrović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB19",
                "nombre": "Dušan Tadić",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SRB20",
                "nombre": "Dušan Vlahović",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Suiza",
            "codigo_pais": "ch",
            "codigo_album": "SUI",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "SUI1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI3",
                "nombre": "  Yann Sommer",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI4",
                "nombre": "  Gregor Kobel",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI5",
                "nombre": "  Manuel Akanji",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI6",
                "nombre": "  Nico Elvedi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI7",
                "nombre": "  Kevin Mbabu",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI8",
                "nombre": "  Ricardo Rodríguez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI9",
                "nombre": "  Fabian Schär",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI10",
                "nombre": "Silvan Widmer",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI11",
                "nombre": "Remo Freuler",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI12",
                "nombre": "Xherdan Shaqiri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI13",
                "nombre": "Djibril Sow",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI14",
                "nombre": "Granit Xhaka",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI15",
                "nombre": "Denis Zakaria",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI16",
                "nombre": "Steven Zuber",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI17",
                "nombre": "Breel Embolo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI18",
                "nombre": "Noah Okafor",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI19",
                "nombre": "Haris Seferović",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "SUI20",
                "nombre": "Ruben Vargas",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Camerún",
            "codigo_pais": "cm",
            "codigo_album": "CMR",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "CMR1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR3",
                "nombre": "  André Onana",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR4",
                "nombre": "  Devis Epassy",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR5",
                "nombre": "  Jean-Charles Castelletto",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR6",
                "nombre": "  Collins Fai",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR7",
                "nombre": "  Olivier Mbaizo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR8",
                "nombre": "  Harold Moukoudi",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR9",
                "nombre": "  Michael Ngadeu",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR10",
                "nombre": "Nouhou",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR11",
                "nombre": "Martin Hongla",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR12",
                "nombre": "Pierre Kunde",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR13",
                "nombre": "James Léa Siliki",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR14",
                "nombre": "Samuel Oum Gouet",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR15",
                "nombre": "André-Frank Zambo Anguissa",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR16",
                "nombre": "Vincent Aboubakar",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR17",
                "nombre": "Stéphane Bahoken",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR18",
                "nombre": "Eric Maxim Choupo-Moting",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR19",
                "nombre": "Nicolas Moumi Ngamaleu",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "CMR20",
                "nombre": "Karl Toko Ekambi",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      },
      {
        "nombre": "Grupo H ",
        "equipos": [
          {
            "nombre": "Portugal",
            "codigo_pais": "pt",
            "codigo_album": "POR",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "POR1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR3",
                "nombre": "  Diogo Costa",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR4",
                "nombre": "  Rui Patrício",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR5",
                "nombre": "  João Cancelo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR6",
                "nombre": "  José Fonte",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR7",
                "nombre": "  Nuno Mendes",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR8",
                "nombre": "  Pepe",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR9",
                "nombre": "  Raphaël Guerreiro",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR10",
                "nombre": "Rúben Dias",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR11",
                "nombre": "Bernardo Silva",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR12",
                "nombre": "Bruno Fernandes",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR13",
                "nombre": "Danilo Pereira",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR14",
                "nombre": "João Moutinho",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR15",
                "nombre": "Renato Sanches",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR16",
                "nombre": "Rúben Neves",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR17",
                "nombre": "André Silva",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR18",
                "nombre": "Cristiano Ronaldo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR19",
                "nombre": "Diogo Jota",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "POR20",
                "nombre": "Gonçalo Guedes",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Ghana",
            "codigo_pais": "gh",
            "codigo_album": "GHA",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "GHA1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA3",
                "nombre": "  Joe Wollacott",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA4",
                "nombre": "  Richard Ofori",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA5",
                "nombre": "  Daniel Amartey",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA6",
                "nombre": "  Abdul-Rahman Baba",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA7",
                "nombre": "  Alexander Djiku",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA8",
                "nombre": "  Gideon Mensah",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA9",
                "nombre": "  Jonathan Mensah",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA10",
                "nombre": "Andy Yiadom",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA11",
                "nombre": "Iddrisu Baba",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA12",
                "nombre": "Mohammed Kudus",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA13",
                "nombre": "Daniel-Kofi Kyereh",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA14",
                "nombre": "Thomas Partey",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA15",
                "nombre": "Mubarak Wakaso",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA16",
                "nombre": "Felix Afena-Gyan",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA17",
                "nombre": "André Ayew",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA18",
                "nombre": "Jordan Ayew",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA19",
                "nombre": "Issahaku Abdul Fatawu",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "GHA20",
                "nombre": "Kamaldeen Sulemana",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Uruguay",
            "codigo_pais": "uy",
            "codigo_album": "URU",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "URU1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU3",
                "nombre": "  Fernando Muslera",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU4",
                "nombre": "  Sergio Rochet",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU5",
                "nombre": "  Ronald Araújo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU6",
                "nombre": "  Martín Cáceres",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU7",
                "nombre": "  José María Giménez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU8",
                "nombre": "  Diego Godín",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU9",
                "nombre": "  Mathías Olivera",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU10",
                "nombre": "Matías Viña",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU11",
                "nombre": "Rodrigo Bentancur",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU12",
                "nombre": "Giorgian De Arrascaeta",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU13",
                "nombre": "Nicolás De La Cruz",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU14",
                "nombre": "Lucas Torreira",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU15",
                "nombre": "Federico Valverde",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU16",
                "nombre": "Matías Vecino",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU17",
                "nombre": "Edinson Cavani",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU18",
                "nombre": "Darwin Núñez",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU19",
                "nombre": "Facundo Pellistri",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "URU20",
                "nombre": "Luis Suárez",
                "existe": false,
                "repetido": 0
              }
            ]
          },
          {
            "nombre": "Corea del Sur",
            "codigo_pais": "kr",
            "codigo_album": "KOR",
            "catidad": 0,
            "cromos": [
              {
                "codigo": "KOR1",
                "nombre": "  Logo Equipo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR3",
                "nombre": "  Seung-gyu Kim",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR4",
                "nombre": "  Hyeon-woo Jo",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR5",
                "nombre": "  Chul Hong",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR6",
                "nombre": "  Tae-hwan Kim",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR7",
                "nombre": "  Min-jae Kim",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR8",
                "nombre": "  Young-gwon Kim",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR9",
                "nombre": "  Jin-su Kim",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR10",
                "nombre": "Yong Lee",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR11",
                "nombre": "In-beom Hwang",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR12",
                "nombre": "Woo-young Jung",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR13",
                "nombre": "Jae-sung Lee",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR14",
                "nombre": "Seung-ho Paik",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR15",
                "nombre": "Gue-sung Cho",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR16",
                "nombre": "Hee-chan Hwang",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR17",
                "nombre": "Ui-jo Hwang",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR18",
                "nombre": "Chang-hoon Kwon",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR19",
                "nombre": "Heung-min Son",
                "existe": false,
                "repetido": 0
              },
              {
                "codigo": "KOR20",
                "nombre": "Min-kyu Song",
                "existe": false,
                "repetido": 0
              }
            ]
          }
        ]
      }
    ]
  };
}
