import 'Data.dart';
import '@meta.dart';

class MovieResponse {
  MovieResponse({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.metaa,});

  MovieResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    metaa = json['@meta'] != null ? meta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
  meta? metaa;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['@meta'] = metaa?.toJson();
    }
    return map;
  }

}