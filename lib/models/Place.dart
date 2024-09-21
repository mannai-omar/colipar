abstract class Place {
  String get name;
  String get code;
}

class Port implements Place {
  @override
  final String name;
  @override
  final String code;

  Port({required this.name, required this.code});
}

class Airport implements Place {
  @override
  final String name;
  @override
  final String code;

  Airport({required this.name, required this.code});
}