abstract class Command {
  IReceiver _receiver;
  Instructions instructions;

  Command(this._receiver, this.instructions);

  void execute() {
    this._receiver.action(instructions);
  }

  void unexecute() {
    this._receiver.undo();
  }
}

class IReceiver {
  void action(Instructions instructions) {}
  void undo() {}
}

enum Instructions { LightOn, LightOff, BrightnessUp, BrightnessDown }

class RemoteController {
  List<Command?> commands = [];
  Command? on;
  Command? off;
  Command? up;
  Command? down;

  RemoteController(this.on, this.off, this.up, this.down);

  void clickOn() {
    this.on!.execute();
    commands.add(on);
  }

  void clickOff() {
    this.off!.execute();
    commands.add(off);
  }

  void clickUp() {
    this.up!.execute();
    commands.add(up);
  }

  void clickDown() {
    this.down!.execute();
    commands.add(down);
  }

  void clickUndo() {
    this.commands.removeLast()!.unexecute();
  }
}

class LightOnCommand extends Command {
  LightOnCommand(IReceiver _receiver, Instructions instructions)
      : super(_receiver, instructions);
}

class LightOffCommand extends Command {
  LightOffCommand(IReceiver _receiver, Instructions instructions)
      : super(_receiver, instructions);
}

class BrightnessUpCommand extends Command {
  BrightnessUpCommand(IReceiver _receiver, Instructions instructions)
      : super(_receiver, instructions);
}

class BrightnessDownCommand extends Command {
  BrightnessDownCommand(IReceiver _receiver, Instructions instructions)
      : super(_receiver, instructions);
}

class Light implements IReceiver {
  @override
  void action(Instructions instructions) {
    switch (instructions) {
      case Instructions.LightOn:
        print("Working on light on");
        break;
      case Instructions.LightOff:
        print("Working on light off");
        break;
      case Instructions.BrightnessUp:
        print("Working on brightness up");
        break;
      case Instructions.BrightnessDown:
        print("Working on brightness down");
        break;
    }
  }

  @override
  void undo() {}
}

void main() {
  Light light = Light(); // Receiver
  RemoteController ctrl = RemoteController(
      LightOnCommand(light, Instructions.LightOn),
      LightOffCommand(light, Instructions.LightOff),
      BrightnessUpCommand(light, Instructions.BrightnessUp),
      BrightnessDownCommand(light, Instructions.BrightnessDown)); // Invoker

  ctrl.clickOn();
  ctrl.clickDown();
}
