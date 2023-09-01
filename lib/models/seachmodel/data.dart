import 'package:equatable/equatable.dart';

import 'datum.dart';

class Data extends Equatable {
  final dynamic currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final dynamic from;
  final dynamic lastPage;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final String? path;
  final dynamic perPage;
  final dynamic prevPageUrl;
  final dynamic to;
  final dynamic total;

  const Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json['current_page'],
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e ))
            .toList(),
        firstPageUrl: json['first_page_url'] ,
        from: json['from'] ,
        lastPage: json['last_page'],
        lastPageUrl: json['last_page_url'] ,
        nextPageUrl: json['next_page_url'] as dynamic,
        path: json['path'] ,
        perPage: json['per_page'],
        prevPageUrl: json['prev_page_url'] as dynamic,
        to: json['to'],
        total: json['total'] ,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };

  @override
  List<Object?> get props {
    return [
      currentPage,
      data,
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total,
    ];
  }
}
