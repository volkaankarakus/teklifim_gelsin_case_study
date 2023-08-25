// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';

class OfferModel {
  int? card_id;
  int? bank_id;
  String? card_name;
  double? annual_payment;
  double? shopping_interest;
  double? overdue_interest;
  double? cash_advance_interest;
  String? img_url;
  String? url;
  int? sponsored;
  bool? active;
  List<dynamic>? campaigns;
  List<dynamic>? categories;
  double? rating;
  OfferModel({
    this.card_id,
    this.bank_id,
    this.card_name,
    this.annual_payment,
    this.shopping_interest,
    this.overdue_interest,
    this.cash_advance_interest,
    this.img_url,
    this.url,
    this.sponsored,
    this.active,
    this.campaigns,
    this.categories,
    this.rating,
  });

  OfferModel copyWith({
    int? card_id,
    int? bank_id,
    String? card_name,
    double? annual_payment,
    double? shopping_interest,
    double? overdue_interest,
    double? cash_advance_interest,
    String? img_url,
    String? url,
    int? sponsored,
    bool? active,
    List<dynamic>? campaigns,
    List<dynamic>? categories,
    double? rating,
  }) {
    return OfferModel(
      card_id: card_id ?? this.card_id,
      bank_id: bank_id ?? this.bank_id,
      card_name: card_name ?? this.card_name,
      annual_payment: annual_payment ?? this.annual_payment,
      shopping_interest: shopping_interest ?? this.shopping_interest,
      overdue_interest: overdue_interest ?? this.overdue_interest,
      cash_advance_interest:
          cash_advance_interest ?? this.cash_advance_interest,
      img_url: img_url ?? this.img_url,
      url: url ?? this.url,
      sponsored: sponsored ?? this.sponsored,
      active: active ?? this.active,
      campaigns: campaigns ?? this.campaigns,
      categories: categories ?? this.categories,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'card_id': card_id,
      'bank_id': bank_id,
      'card_name': card_name,
      'annual_payment': annual_payment,
      'shopping_interest': shopping_interest,
      'overdue_interest': overdue_interest,
      'cash_advance_interest': cash_advance_interest,
      'img_url': img_url,
      'url': url,
      'sponsored': sponsored,
      'active': active,
      'campaigns': campaigns,
      'categories': categories,
      'rating': rating,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      card_id: map['card_id'] != null ? map['card_id'] as int : null,
      bank_id: map['bank_id'] != null ? map['bank_id'] as int : null,
      card_name: map['card_name'] != null ? map['card_name'] as String : null,
      annual_payment: map['annual_payment'] != null
          ? map['annual_payment'] as double
          : null,
      shopping_interest: map['shopping_interest'] != null
          ? map['shopping_interest'] as double
          : null,
      overdue_interest: map['overdue_interest'] != null
          ? map['overdue_interest'] as double
          : null,
      cash_advance_interest: map['cash_advance_interest'] != null
          ? map['cash_advance_interest'] as double
          : null,
      img_url: map['img_url'] != null ? map['img_url'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      sponsored: map['sponsored'] != null ? map['sponsored'] as int : null,
      active: map['active'] != null ? map['active'] as bool : null,
      campaigns: map['campaigns'] != null
          ? List<dynamic>.from((map['campaigns'] as List<dynamic>))
          : null,
      categories: map['categories'] != null
          ? List<dynamic>.from((map['categories'] as List<dynamic>))
          : null,
      rating: map['rating'] != null ? map['rating'].toDouble() as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) =>
      OfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferModel(card_id: $card_id, bank_id: $bank_id, card_name: $card_name, annual_payment: $annual_payment, shopping_interest: $shopping_interest, overdue_interest: $overdue_interest, cash_advance_interest: $cash_advance_interest, img_url: $img_url, url: $url, sponsored: $sponsored, active: $active, campaigns: $campaigns, categories: $categories, rating: $rating)';
  }

  @override
  bool operator ==(covariant OfferModel other) {
    if (identical(this, other)) return true;

    return other.card_id == card_id &&
        other.bank_id == bank_id &&
        other.card_name == card_name &&
        other.annual_payment == annual_payment &&
        other.shopping_interest == shopping_interest &&
        other.overdue_interest == overdue_interest &&
        other.cash_advance_interest == cash_advance_interest &&
        other.img_url == img_url &&
        other.url == url &&
        other.sponsored == sponsored &&
        other.active == active &&
        listEquals(other.campaigns, campaigns) &&
        listEquals(other.categories, categories) &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return card_id.hashCode ^
        bank_id.hashCode ^
        card_name.hashCode ^
        annual_payment.hashCode ^
        shopping_interest.hashCode ^
        overdue_interest.hashCode ^
        cash_advance_interest.hashCode ^
        img_url.hashCode ^
        url.hashCode ^
        sponsored.hashCode ^
        active.hashCode ^
        campaigns.hashCode ^
        categories.hashCode ^
        rating.hashCode;
  }
}
