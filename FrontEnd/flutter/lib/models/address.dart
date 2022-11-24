class Address {
  final String? city;
  final String? state;
  final String? zip;
  final String? country;

  Address(
      {required this.city,
      required this.state,
      required this.zip,
      required this.country});

  factory Address.fromJson(Map<String, dynamic> json) {

    return Address(
          city : json['city'] == null ? null : json['city'], 
          state : json['state'] == null ? null : json['state'],
          zip : json['zip'] == null ? null : json['zip'], 
          country : json['country'] == null ? null : json['country']);
  }
}
