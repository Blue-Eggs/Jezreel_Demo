import '../models/address.dart';
import '../models/servicelevel.dart';
import '../models/trackingstatus.dart';
import '../models/trackinghistory.dart';

class TrackInfo {
  final String tracking_number;
  final String carrier;
  final Servicelevel servicelevel;
  final Address address_from;
  final Address address_to;
  final String eta;
  final String originalEta;
  final TrackingStatus tracking_status;
  final List<TrackingStatus> tracking_history;

  TrackInfo({required this.tracking_number, 
            required this.carrier,
            required this.servicelevel,
            required this.address_from,
            required this.address_to,
            required this.eta,
            required this.originalEta,
            required this.tracking_status,
            required this.tracking_history,
            });

  factory TrackInfo.fromJson(Map<String, dynamic> json){
    return TrackInfo(
      tracking_number : json['tracking_number'],
      carrier : json['carrier'],
      servicelevel: new Servicelevel.fromJson(json['servicelevel']),
      address_from: new Address.fromJson(json['address_from']),
      address_to: new Address.fromJson(json['address_to']),
      eta : json['eta'],
      originalEta : json['originalEta'],
      tracking_status : new TrackingStatus.fromJson(json['tracking_status']),
      tracking_history: new TrackingStatus.fromJson(json['tracking_history']),
      );
  }
}
