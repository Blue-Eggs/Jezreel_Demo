

import '../models/address.dart';
import '../models/servicelevel.dart';
import '../models/trackingstatus.dart';
class TrackInfo {
  String tracking_number;
  String carrier;
  Servicelevel servicelevel;
  Address address_from;
  Address address_to;
  String eta;
  String original_eta;
  TrackingStatus tracking_status;
  List<TrackingStatus> tracking_history;

  TrackInfo({required this.tracking_number, 
            required this.carrier,
            required this.servicelevel,
            required this.address_from,
            required this.address_to,
            required this.eta,
            required this.original_eta,
            required this.tracking_status,
            required this.tracking_history,
            });

  

  factory TrackInfo.fromJson(Map<String, dynamic> json){
    print(json['tracking_history'][0]);
    //TrackingStatus.fromJson(json['tracking_history'][0]);

    return TrackInfo(
      tracking_number : json['tracking_number'],
      carrier : json['carrier'],
      servicelevel: Servicelevel.fromJson(json['servicelevel']),
      address_from: Address.fromJson(json['address_from']),
      address_to: Address.fromJson(json['address_to']),
      eta : json['eta'],
      original_eta : json['original_eta'],
      tracking_status : TrackingStatus.fromJson(json['tracking_status']),
      tracking_history: List<TrackingStatus>.generate(json['tracking_history'].length, (i)
      => TrackingStatus.fromJson(json['tracking_history'][i])),
      
      );
  }
}

//List<Status> otherStatuses = List<Status>.generate(statuses.length,(i) => Status(name: statuses[i].name , isCheck:statuses[i].isCheck));