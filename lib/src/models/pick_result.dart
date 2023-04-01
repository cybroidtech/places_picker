import 'dart:collection';

import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';

class PickResult {
  PickResult({
    this.placeId,
    this.geometry,
    this.formattedAddress,
    this.types,
    this.addressComponents,
    this.adrAddress,
    this.formattedPhoneNumber,
    this.id,
    this.reference,
    this.icon,
    this.name,
    this.openingHours,
    this.photos,
    this.internationalPhoneNumber,
    this.priceLevel,
    this.rating,
    this.scope,
    this.url,
    this.vicinity,
    this.utcOffset,
    this.website,
    this.reviews,
  });

  final String? placeId;
  final Geometry? geometry;
  final String? formattedAddress;
  final List<String>? types;
  final List<AddressComponent>? addressComponents;

  // Below results will not be fetched if 'usePlaceDetailSearch' is set to false (Defaults to false).
  final String? adrAddress;
  final String? formattedPhoneNumber;
  final String? id;
  final String? reference;
  final String? icon;
  final String? name;
  final OpeningHoursDetail? openingHours;
  final List<Photo>? photos;
  final String? internationalPhoneNumber;
  final PriceLevel? priceLevel;
  final num? rating;
  final String? scope;
  final String? url;
  final String? vicinity;
  final num? utcOffset;
  final String? website;
  final List<Review>? reviews;

  factory PickResult.fromGeocodingResult(GeocodingResult result) {
    return PickResult(
      placeId: result.placeId,
      geometry: result.geometry,
      formattedAddress: result.formattedAddress,
      types: result.types,
      addressComponents: result.addressComponents,
    );
  }

  factory PickResult.fromPlaceDetailResult(PlaceDetails result) {
    return PickResult(
      placeId: result.placeId,
      geometry: result.geometry,
      formattedAddress: result.formattedAddress,
      types: result.types,
      addressComponents: result.addressComponents,
      adrAddress: result.adrAddress,
      formattedPhoneNumber: result.formattedPhoneNumber,
      id: result.id,
      reference: result.reference,
      icon: result.icon,
      name: result.name,
      openingHours: result.openingHours,
      photos: result.photos,
      internationalPhoneNumber: result.internationalPhoneNumber,
      priceLevel: result.priceLevel,
      rating: result.rating,
      scope: result.scope,
      url: result.url,
      vicinity: result.vicinity,
      utcOffset: result.utcOffset,
      website: result.website,
      reviews: result.reviews,
    );
  }

  Map<String, dynamic> toPlaceDetailResultMap() {
    Map<String, dynamic> map = HashMap();

    map['placeId'] = placeId;
    map['geometry'] = geometry?.toJson();
    map['location'] = geometry?.location.toJson();
    map['formattedAddress'] = formattedAddress;
    map['types'] = types?.map((e) => e).toList();

    map['addressComponents'] =
        addressComponents?.map((e) => e.toJson()).toList();

    map['adrAddress'] = adrAddress;
    map['formattedPhoneNumber'] = formattedPhoneNumber;
    map['id'] = id;
    map['reference'] = reference;
    map['icon'] = icon;
    map['name'] = name;
    map['openingHours'] = openingHours?.toJson();
    map['photos'] = photos?.map((e) => e.toJson()).toList();
    map['internationalPhoneNumber'] = internationalPhoneNumber;
    map['priceLevel'] = priceLevel;
    map['rating'] = rating;
    map['scope'] = scope;
    map['url'] = url;
    map['vicinity'] = vicinity;
    map['utcOffset'] = utcOffset;
    map['website'] = website;
    map['reviews'] = reviews?.map((e) => e.toJson()).toList();

    return map;
  }
}
