class IDuck {
  IFlyStrategy? _flyStrategy;
  IQuackStrategy? _quackStrategy;
  void fly() {}
  void quack() {}
}

class IFlyStrategy {
  void fly() {}
}

class IQuackStrategy {
  void quack() {}
}

class SimpleQuacking implements IQuackStrategy {
  @override
  void quack() {
    print("SimpleQuacking is quacking!");
  }
}

class NoQuacking implements IQuackStrategy {
  @override
  void quack() {
    print("NoQuacking is not quacking!");
  }
}

class SimpleFlying implements IFlyStrategy {
  @override
  void fly() {
    print("SimpleFlying is flying!");
  }
}

class NoFlying implements IFlyStrategy {
  @override
  void fly() {
    print("NoFlying is not flying!");
  }
}

class CityDuck implements IDuck {
  IFlyStrategy? _flyStrategy;
  IQuackStrategy? _quackStrategy;

  CityDuck(IFlyStrategy flyStrategy, IQuackStrategy quackStrategy) {
    this._flyStrategy = flyStrategy;
    this._quackStrategy = quackStrategy;
  }

  @override
  void fly() {
    _flyStrategy?.fly();
  }

  @override
  void quack() {
    _quackStrategy?.quack();
  }
}

class WildDuck implements IDuck {
  IFlyStrategy? _flyStrategy;
  IQuackStrategy? _quackStrategy;

  WildDuck(IFlyStrategy flyStrategy, IQuackStrategy quackStrategy) {
    this._flyStrategy = flyStrategy;
    this._quackStrategy = quackStrategy;
  }

  @override
  void fly() {
    _flyStrategy?.fly();
  }

  @override
  void quack() {
    _quackStrategy?.quack();
  }
}

void main() {
  CityDuck cityDuck = CityDuck(NoFlying(), SimpleQuacking());
  cityDuck.fly();
  cityDuck.quack();

  WildDuck wildDuck = WildDuck(SimpleFlying(), NoQuacking());
  wildDuck.fly();
  wildDuck.quack();
}
