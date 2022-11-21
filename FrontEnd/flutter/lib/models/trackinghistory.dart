import 'package:packagetracker/models/trackingstatus.dart';

import '../models/address.dart';

class TrackingHistory{
  List<TrackingStatus> tracking_history;

  TrackingHistory({required this.tracking_history});

  factory TrackingHistory.fromJson(Map<String,dynamic> json){
    return TrackingHistory(
        tracking_history: json['tracking_history']);
  }
}