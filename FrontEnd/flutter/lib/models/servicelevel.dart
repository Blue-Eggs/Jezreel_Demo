class Servicelevel {
  final String name;
  final String token;

  Servicelevel({required this.name, required this.token});

  factory Servicelevel.fromJson(Map<String, dynamic> json) {
    return Servicelevel(
          name: json['name'], 
          token: json['token']
    );
  }
}
