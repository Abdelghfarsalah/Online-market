import 'package:equatable/equatable.dart';

import 'data.dart';

class Seachmodel extends Equatable {
  final bool? status;
  final dynamic message;
  final Data? data;

  const Seachmodel({this.status, this.message, this.data});

  factory Seachmodel.fromJson(Map<String, dynamic> json) => Seachmodel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] ),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
