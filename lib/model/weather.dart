class Weather {
  String _description = '';
  String _date = '';
  String _conditionImage = '';
  String _temp = '';
  String _wind = '';
  String _humid = '';
  String _locationName = '';

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get conditionImage => _conditionImage;

  set conditionImage(String value) {
    _conditionImage = value;
  }

  String get temp => _temp;

  set temp(String value) {
    _temp = value;
  }

  String get wind => _wind;

  set wind(String value) {
    _wind = value;
  }

  String get humid => _humid;

  set humid(String value) {
    _humid = value;
  }

  String get locationName => _locationName;

  set locationName(String value) {
    _locationName = value;
  }
}
