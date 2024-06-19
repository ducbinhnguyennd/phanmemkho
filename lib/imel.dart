class Imel {
  final String imel;

  Imel({required this.imel});

  Map<String, dynamic> toJson() {
    return {
      'imel': imel,
    };
  }
}
