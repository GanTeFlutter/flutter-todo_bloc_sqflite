// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_dev.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: assets/env/.dev.env
final class _EnvDev {
  static const List<int> _enviedkeybaseUrl = <int>[
    2160217926,
    481820689,
    3688248041,
    332905037,
    3343933894,
    1558300085,
    3947430500,
    614424542,
    3954274810,
    2626238321,
    3170477812,
    63476673,
    1014320865,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    2160217895,
    481820794,
    3688247936,
    332904993,
    3343933866,
    1558300124,
    3947430423,
    614424498,
    3954274719,
    2626238213,
    3170477721,
    63476644,
    1014320846,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeysupabaseUrl = <int>[
    1244521122,
    4121925879,
    1054600751,
    4130894619,
    3044188263,
    4133124378,
    1612065530,
    1002353834,
    3401886613,
    1528921584,
    2560525346,
    2653805307,
    394965356,
    803233639,
    1925200768,
  ];

  static const List<int> _envieddatasupabaseUrl = <int>[
    1244521155,
    4121925764,
    1054600779,
    4130894696,
    3044188166,
    4133124478,
    1612065435,
    1002353881,
    3401886705,
    1528921475,
    2560525379,
    2653805215,
    394965279,
    803233542,
    1925200868,
  ];

  static final String supabaseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatasupabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasupabaseUrl[i] ^ _enviedkeysupabaseUrl[i]),
  );
}
