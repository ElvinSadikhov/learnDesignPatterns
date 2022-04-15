abstract class Receiver {
  Set<String> get actions;
}

abstract class Command {
  Receiver _receiver;
  late String name;

  Command(this._receiver);

  void execute();

  @override
  String toString() => name;
}

class Invoker {
  List<String> history = [];

  void execute(Command cmd) {
    cmd.execute();
    history.add("[${DateTime.now()}] Executed $cmd");
  }

  @override
  String toString() =>
      history.fold("", (events, event) => events + "$event\r\n");
}

class TurnOnCommand extends Command {
  String name = "TurnOn";
  TurnOnCommand(Light light) : super(light);
  @override
  void execute() => (_receiver as Light).turnOn();
}

class TurnOffCommand extends Command {
  String name = "TurnOff";
  TurnOffCommand(Light light) : super(light);
  @override
  void execute() => (_receiver as Light).turnOn();
}

class Light implements Receiver {
  @override
  Set<String> get actions => Set.from(["off", "on"]);

  void turnOn() => print("Light is on!");
  void turnOff() => print("Light is off!");
}

class LightSwitch {
  Invoker _switch = Invoker();
  Light light;

  LightSwitch(this.light);

  String get history => _switch.toString();

  void perform(String action) {
    if (!light.actions.contains(action)) return print("Uh..whAt?");

    switch (action) {
      case "on":
        return _switch.execute(TurnOnCommand(light));
      case "off":
        return _switch.execute(TurnOffCommand(light));
    }
  }
}

void main() {
  var myLamp = Light();
  var lightSwitch = LightSwitch(myLamp);

  lightSwitch.perform("on");
  lightSwitch.perform("off");
  lightSwitch.perform("up");

  print("Some logs: \n" "${lightSwitch.history}");
}
