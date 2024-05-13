import 'package:barberia/modelo/Citas.dart';
import 'package:hive_flutter/hive_flutter.dart';


class CitasControlador {
  final _citas = Hive.box('Citas');

  List<Citas> get citas {
    List<Citas> lista = [];
    for (var p in _citas.values) {
      lista.add(
        Citas(
          id: p['id'],
          nombre: p['nombre'],
          precio: p['precio'],
        ),
      );
    }

    return lista;
  }

  String agregarCitas(
    String id,
    String nombre,
    double precio,
  ) {
    if (_citas.containsKey(id)) return 'El producto ya existe';

    if (id.isEmpty || nombre.isEmpty || precio <= 0 ) {
      return 'Datos incorrectos';
    }

    var citas = {
      'id': id,
      'nombre': nombre,
      'precio': precio,
    };

    _citas.put(id, citas);

    return 'Citas agregado';
  }

  String editarCitas(
    String id,
    String nombre,
    double precio,
  ) {
    if (!_citas.containsKey(id)) return 'El producto no existe';

    if (id.isEmpty || nombre.isEmpty || precio <= 0 ) {
      return 'Datos incorrectos';
    }

    var citas = {
      'id': id,
      'nombre': nombre,
      'precio': precio,
    };

    _citas.put(id, citas);

    return 'Citas editado';
  }

  String eliminarCitas(String id) {
    if (!_citas.containsKey(id)) return 'Esta Citas no existe';

    _citas.delete(id);

    return 'Citas eliminado';
  }

  String eliminarTodo() {
    _citas.clear();
    return 'Citas eliminados';
  }


}
