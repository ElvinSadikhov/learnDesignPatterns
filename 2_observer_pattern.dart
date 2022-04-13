class IObservable {
  void add(IObserver observer) {}
  void remove(IObserver observer) {}
  void notify() {}
}

class IObserver {
  void update() {}
}

class WeatherStation implements IObservable {
  List<IObserver> observers = [];
  late double _temperature;

  @override
  void add(IObserver observer) {
    this.observers.add(observer);
  }

  @override
  void remove(IObserver observer) {
    this.observers.remove(observer);
  }

  @override
  void notify() {
    for (IObserver observer in observers) {
      observer.update();
    }
  }

  double getTemperature() => _temperature;

  void setTemperature(double temperature) {
    this._temperature = temperature;
    notify();
  }
}

class PhoneDisplay implements IObserver {
  late WeatherStation weatherStation;

  PhoneDisplay(WeatherStation weatherStation) {
    this.weatherStation = weatherStation;
  }

  @override
  void update() {
    double curTemperature = weatherStation.getTemperature();
    print("PhoneDisplay is updated! ($curTemperature)");
  }
}

class LedDisplay implements IObserver {
  late WeatherStation weatherStation;

  LedDisplay(WeatherStation weatherStation) {
    this.weatherStation = weatherStation;
  }

  @override
  void update() {
    double curTemperature = weatherStation.getTemperature();
    print("LedDisplay is updated! ($curTemperature)");
  }
}

void main() {
  WeatherStation weatherStation = WeatherStation();
  PhoneDisplay phoneDisplay = PhoneDisplay(weatherStation);
  LedDisplay ledDisplay = LedDisplay(weatherStation);

  weatherStation
    ..add(phoneDisplay)
    ..add(ledDisplay);

  weatherStation.setTemperature(20);

  weatherStation.remove(phoneDisplay);
  weatherStation.setTemperature(30);
}
