class Usuario {
  final String id;
  final String telefono;
  final String clave;
  final String rol;
  final String nombre;

  Usuario(
    this.rol,
    this.nombre,
    this.id, {
    required this.telefono,
    required this.clave,
  });
}
