class Address {
  final String city;
  final String state;
  final String zip;
  final String country;

  Address(
      {required this.city,
      required this.state,
      required this.zip,
      required this.country});

  factory Address.fromJson(Map<String, dynamic> json) {

    return Address(
          city : json['city'], 
          state : json['state'],
          zip : json['zip'], 
          country : json['country']);
  }
}
