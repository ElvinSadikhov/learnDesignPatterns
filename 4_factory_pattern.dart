class IFactory {
  IProduct getProduct() {
    throw "Not implemented";
  }
}

class IProduct {
  String? name;
  String? type;
  double? size;
}

class ConcreteFactoryA implements IFactory {
  @override
  IProduct getProduct() {
    return ConcreteProductA("Type-A product", "A", 1.0);
  }
}

class ConcreteFactoryB implements IFactory {
  @override
  IProduct getProduct() {
    return ConcreteProductB("Type-B product", "B", 2.0);
  }
}

class ConcreteProductA implements IProduct {
  @override
  String? name;

  @override
  double? size;

  @override
  String? type;

  ConcreteProductA(this.name, this.type, this.size);
}

class ConcreteProductB implements IProduct {
  @override
  String? name;

  @override
  double? size;

  @override
  String? type;

  ConcreteProductB(this.name, this.type, this.size);
}

void main() {
  IFactory factoryA = ConcreteFactoryA();
  IFactory factoryB = ConcreteFactoryB();

  IProduct productA = factoryA.getProduct();
  IProduct productB = factoryB.getProduct();

  print(
      "The size of the product is ${productA.size}, and the type is ${productA.type}");
  print(
      "The size of the product is ${productB.size}, and the type is ${productB.type}");
}
