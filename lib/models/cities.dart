class City {
  String _city;
  String _admin;
  String _country;
  int _populationProper;
  String _iso2;
  String _capital;
  String _lat;
  String _lng;
  int _population;

  City({
    String city,
    String admin,
    String country,
    int populationProper,
    String iso2,
    String capital,
    String lat,
    String lng,
    int population,
  }) {
    this._city = city;
    this._admin = admin;
    this._country = country;
    this._populationProper = populationProper;
    this._iso2 = iso2;
    this._capital = capital;
    this._lat = lat;
    this._lng = lng;
    this._population = population;
  }

  City.fromJson(Map<String, dynamic> json) {
    _city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this._city;
    data['admin'] = this._admin;
    data['country'] = this._country;
    data['population_proper'] = this._populationProper;
    data['iso2'] = this._iso2;
    data['capital'] = this._capital;
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    data['population'] = this._population;
    return data;
  }
}
