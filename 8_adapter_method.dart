abstract class Target {
  void execute();
}

class Adapter extends Target {
  Adaptee _adaptee;

  Adapter(this._adaptee);

  @override
  void execute() {
    _adaptee.specialExecute();
  }
}

class Adaptee {
  void specialExecute() {
    print("Doing some speacial things in Adaptee...");
  }
}

class Client {
  Target _smth;

  Client(this._smth);

  void doOperation() {
    _smth.execute();
  }
}

void main() {
  Adaptee adaptee = Adaptee();
  Target adapter = Adapter(adaptee);
  Client obj = Client(adapter);
  obj.doOperation();
}
