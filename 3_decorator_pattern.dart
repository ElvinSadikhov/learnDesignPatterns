abstract class Beverage {
  double cost();
}

abstract class AddonDecorator extends Beverage {
  late Beverage beverage;
}

class Expresso extends Beverage {
  @override
  double cost() {
    return 2.00;
  }
}

class Late extends Beverage {
  @override
  double cost() {
    return 3.00;
  }
}

class Caramel extends AddonDecorator {
  @override
  late Beverage beverage;

  Caramel(Beverage beverage) {
    this.beverage = beverage;
  }

  @override
  double cost() {
    return beverage.cost() + 0.50;
  }
}

class Milk extends AddonDecorator {
  @override
  late Beverage beverage;

  Milk(Beverage beverage) {
    this.beverage = beverage;
  }

  @override
  double cost() {
    return this.beverage.cost() + 0.25;
  }
}

void main() {
  // but as video states, this exampl is not so logical
  // as we could just pass a collection of addon's to beverage and later calculate the cost of it
  // and the main purpose of this design pattern is actually to create variations in the implementation in decorator instances rather than value differences
  Beverage originalOrder = Expresso();
  Beverage caramelAndMilkOrder = Caramel(Milk(originalOrder));
  print("The cost of the order is ${caramelAndMilkOrder.cost()}");
  Beverage doubleMilkOrder = Milk(Milk(originalOrder));
  print("The cost of the order is ${doubleMilkOrder.cost()}");
}
