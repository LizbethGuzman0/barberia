import 'package:barberia/modelo/Citas.dart';

class VCita {
  String id;
  List<FilaCitas> Citas;
  double total;
  String fecha;

  VCita({
    required this.id,
    required this.Citas,
    this.total = 0,
    required this.fecha,
  });


  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'Citas': Citas.map((p) => p.toJson()).toList(),
      'total': total,
      'fecha': fecha,
    };
  }

  factory VCita.fromJson(Map<dynamic, dynamic> json) {
    return VCita(
      id: json['id'],
      Citas: List<FilaCitas>.from(
        json['citas'].map((p) => FilaCitas.fromJson(p)),
      ),
      total: json['total'],
      fecha: json['fecha'],
    );
  }
}

class FilaCitas {
  Citas citas;
  int cantidad;

  FilaCitas({
    required this.citas,
    required this.cantidad,
  });

  double get subtotal => citas.precio * cantidad;

  Map<String, dynamic> toJson() {
    return {
      'producto': citas.toJson(),
      'cantidad': cantidad,
    };
  }

  factory FilaCitas.fromJson(Map<dynamic, dynamic> json) {
    return FilaCitas(
      citas: Citas.fromJson(json['Citas']),
      cantidad: json['cantidad'],
    );
  }
}
