class Citas {
  String id;
  String nombre;
  double precio;

  Citas({
    required this.id,
    required this.nombre,
    required this.precio,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'precio': precio,
    };
  }

  factory Citas.fromJson(Map<dynamic, dynamic> json) {
    return Citas(
      id: json['id'],
      nombre: json['nombre'],
      precio: json['precio'],
    );
  }
}
