class AirportResponseModel {
  AirportDataResponseModel? airportDataResponseModel;

  AirportResponseModel({this.airportDataResponseModel});

  AirportResponseModel.fromJson(Map<dynamic, dynamic> json) {
    airportDataResponseModel = json['$airportDataResponseModel'] != null
        ? AirportDataResponseModel.fromJson(json['$airportDataResponseModel'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    if (airportDataResponseModel != null) {
      data['$airportDataResponseModel'] = airportDataResponseModel!.toJson();
    }
    return data;
  }
}

class AirportDataResponseModel {
  String? icao;
  String? iata;
  String? name;
  String? city;
  String? state;
  String? country;
  dynamic elevation;
  dynamic lat;
  dynamic lon;
  String? tz;

  AirportDataResponseModel(
      {this.icao,
      this.iata,
      this.name,
      this.city,
      this.state,
      this.country,
      this.elevation,
      this.lat,
      this.lon,
      this.tz});

  AirportDataResponseModel.fromJson(Map<dynamic, dynamic> json) {
    icao = json['icao'];
    iata = json['iata'];
    name = json['name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    elevation = json['elevation'];
    lat = json['lat'];
    lon = json['lon'];
    tz = json['tz'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['icao'] = icao;
    data['iata'] = iata;
    data['name'] = name;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['elevation'] = elevation;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz'] = tz;
    return data;
  }
}
