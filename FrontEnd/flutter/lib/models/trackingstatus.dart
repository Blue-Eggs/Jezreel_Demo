import '../models/address.dart';


class TrackingStatus{
  final String status_date;
  final String status_details;
  final Address? location;
  final String object_created;
  final String object_updated;
  final String object_id;
  final String status;

  TrackingStatus({
    required this.status_date,
    required this.status_details,
    required this.location,
    required this.object_created,
    required this.object_updated,
    required this.object_id,
    required this.status
    }
  );


  factory TrackingStatus.fromJson(Map<String,dynamic> json){

    
    return TrackingStatus(
      status_date: json['status_date'], 
      status_details: json['status_details'], 
      location: json['location'] == null ? null : Address.fromJson(json['location']),
      object_created: json['object_created'], 
      object_updated: json['object_updated'], 
      object_id: json['object_id'], 
      status: json['status'],
      );
  
    // return TrackingStatus(
    //   status_date: json['status_date'], 
    //   status_details: json['status_details'], 
    //   location: Address.fromJson(json['location']), 
    //   object_created: json['object_created'], 
    //   object_updated: json['object_updated'], 
    //   object_id: json['object_id'], 
    //   status: json['status'],
    //   );
  }

}