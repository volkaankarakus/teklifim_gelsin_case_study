// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:teklifim_gelsin_case_study/model/offer_model.dart';

class OffersModel {
  String? id;
  DateTime? created_at;
  List<OfferModel>? sponsored_offers;
  List<OfferModel>? active_offers;
  List<OfferModel>? passive_offers;
  OffersModel({
    this.id,
    this.created_at,
    this.sponsored_offers,
    this.active_offers,
    this.passive_offers,
  });

  OffersModel copyWith({
    String? id,
    DateTime? created_at,
    List<OfferModel>? sponsored_offers,
    List<OfferModel>? active_offers,
    List<OfferModel>? passive_offers,
  }) {
    return OffersModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      sponsored_offers: sponsored_offers ?? this.sponsored_offers,
      active_offers: active_offers ?? this.active_offers,
      passive_offers: passive_offers ?? this.passive_offers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at,
      'sponsored_offers': sponsored_offers?.map((x) => x?.toMap()).toList(),
      'active_offers': active_offers?.map((x) => x?.toMap()).toList(),
      'passive_offers': passive_offers?.map((x) => x?.toMap()).toList(),
    };
  }

  factory OffersModel.fromMap(Map<String, dynamic> map) {
    return OffersModel(
      id: map['id'] != null ? map['id'] as String : null,
      created_at: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int)
          : null,
      sponsored_offers: map['sponsored_offers'] != null
          ? List<OfferModel>.from(
              (map['sponsored_offers'] as List<dynamic>).map<OfferModel?>(
                (x) => OfferModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      active_offers: map['active_offers'] != null
          ? List<OfferModel>.from(
              (map['active_offers'] as List<dynamic>).map<OfferModel?>(
                (x) => OfferModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      passive_offers: map['passive_offers'] != null
          ? List<OfferModel>.from(
              (map['passive_offers'] as List<dynamic>).map<OfferModel?>(
                (x) => OfferModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OffersModel.fromJson(String source) =>
      OffersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OffersModel(id: $id, created_at: $created_at, sponsored_offers: $sponsored_offers, active_offers: $active_offers, passive_offers: $passive_offers)';
  }

  @override
  bool operator ==(covariant OffersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created_at == created_at &&
        listEquals(other.sponsored_offers, sponsored_offers) &&
        listEquals(other.active_offers, active_offers) &&
        listEquals(other.passive_offers, passive_offers);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created_at.hashCode ^
        sponsored_offers.hashCode ^
        active_offers.hashCode ^
        passive_offers.hashCode;
  }
}
