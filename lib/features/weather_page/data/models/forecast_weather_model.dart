import 'package:weather_app/features/weather_page/data/models/current_weather_model.dart';

class ForecastWeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  ForecastWeatherModel({this.location, this.current, this.forecast});

  ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }

}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  // double? avgtempC;
  // double? avgtempF;
  // double? maxwindMph;
  // double? maxwindKph;
  // int? totalprecipMm;
  // int? totalprecipIn;
  // int? totalsnowCm;
  // int? avgvisKm;
  // int? avgvisMiles;
  // int? avghumidity;
  // int? dailyWillItRain;
  // int? dailyChanceOfRain;
  // int? dailyWillItSnow;
  // int? dailyChanceOfSnow;
  Condition? condition;
  // int? uv;

  Day(
      {this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.mintempF,
      // this.avgtempC,
      // this.avgtempF,
      // this.maxwindMph,
      // this.maxwindKph,
      // this.totalprecipMm,
      // this.totalprecipIn,
      // this.totalsnowCm,
      // this.avgvisKm,
      // this.avgvisMiles,
      // this.avghumidity,
      // this.dailyWillItRain,
      // this.dailyChanceOfRain,
      // this.dailyWillItSnow,
      // this.dailyChanceOfSnow,
      this.condition,
      // this.uv
      });

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    // avgtempC = json['avgtemp_c'];
    // avgtempF = json['avgtemp_f'];
    // maxwindMph = json['maxwind_mph'];
    // maxwindKph = json['maxwind_kph'];
    // totalprecipMm = json['totalprecip_mm'];
    // totalprecipIn = json['totalprecip_in'];
    // totalsnowCm = json['totalsnow_cm'];
    // avgvisKm = json['avgvis_km'];
    // avgvisMiles = json['avgvis_miles'];
    // avghumidity = json['avghumidity'];
    // dailyWillItRain = json['daily_will_it_rain'];
    // dailyChanceOfRain = json['daily_chance_of_rain'];
    // dailyWillItSnow = json['daily_will_it_snow'];
    // dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    // uv = json['uv'];
  }


}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination,
      this.isMoonUp,
      this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  // double? windMph;
  // double? windKph;
  // int? windDegree;
  // String? windDir;
  // int? pressureMb;
  // double? pressureIn;
  // int? precipMm;
  // int? precipIn;
  // int? snowCm;
  // int? humidity;
  // int? cloud;
  // double? feelslikeC;
  // double? feelslikeF;
  // double? windchillC;
  // double? windchillF;
  // double? heatindexC;
  // double? heatindexF;
  // double? dewpointC;
  // double? dewpointF;
  // int? willItRain;
  int? chanceOfRain;
  // int? willItSnow;
  // int? chanceOfSnow;
  // int? visKm;
  // int? visMiles;
  // double? gustMph;
  // double? gustKph;
  // int? uv;

  Hour(
      {this.timeEpoch,
      this.time,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      // this.windMph,
      // this.windKph,
      // this.windDegree,
      // this.windDir,
      // this.pressureMb,
      // this.pressureIn,
      // this.precipMm,
      // this.precipIn,
      // this.snowCm,
      // this.humidity,
      // this.cloud,
      // this.feelslikeC,
      // this.feelslikeF,
      // this.windchillC,
      // this.windchillF,
      // this.heatindexC,
      // this.heatindexF,
      // this.dewpointC,
      // this.dewpointF,
      // this.willItRain,
      this.chanceOfRain,
      // this.willItSnow,
      // this.chanceOfSnow,
      // this.visKm,
      // this.visMiles,
      // this.gustMph,
      // this.gustKph,
      // this.uv
      });

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    // windMph = json['wind_mph'];
    // windKph = json['wind_kph'];
    // windDegree = json['wind_degree'];
    // windDir = json['wind_dir'];
    // pressureMb = json['pressure_mb'];
    // pressureIn = json['pressure_in'];
    // precipMm = json['precip_mm'];
    // precipIn = json['precip_in'];
    // snowCm = json['snow_cm'];
    // humidity = json['humidity'];
    // cloud = json['cloud'];
    // feelslikeC = json['feelslike_c'];
    // feelslikeF = json['feelslike_f'];
    // windchillC = json['windchill_c'];
    // windchillF = json['windchill_f'];
    // heatindexC = json['heatindex_c'];
    // heatindexF = json['heatindex_f'];
    // dewpointC = json['dewpoint_c'];
    // dewpointF = json['dewpoint_f'];
    // willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    // willItSnow = json['will_it_snow'];
    // chanceOfSnow = json['chance_of_snow'];
    // visKm = json['vis_km'];
    // visMiles = json['vis_miles'];
    // gustMph = json['gust_mph'];
    // gustKph = json['gust_kph'];
    // uv = json['uv'];
  }


}
