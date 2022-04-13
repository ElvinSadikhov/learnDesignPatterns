import '3_factory_pattern.dart';

class IFactory {
  ProductFamilyA getProductA() {
    throw "Unimplemented method!";
  }

  ProductFamilyB getProductB() {
    throw "Unimplemented method!";
  }
}

class ProductFamilyA {
  String? name;
  double? size;
  static const String compability = "Windows";
}

class ProductFamilyB {
  String? name;
  double? size;
  static const String compability = "IOS";
}

class ConcreteFactory1 implements IFactory {
  @override
  ProductFamilyA getProductA() {
    return ConcreteProductA1("HP monitor", 16.0);
  }

  @override
  ProductFamilyB getProductB() {
    return ConcreteProductB1("HP mouse", 2);
  }
}

class ConcreteFactory2 implements IFactory {
  @override
  ProductFamilyA getProductA() {
    return ConcreteProductA2("MacBook laptop", 13);
  }

  @override
  ProductFamilyB getProductB() {
    return ConcreteProductB2("MacBook mouse", 3);
  }
}

class ConcreteProductA1 implements ProductFamilyA {
  @override
  String? name;

  @override
  double? size;

  ConcreteProductA1(this.name, this.size);
}

class ConcreteProductA2 implements ProductFamilyA {
  @override
  String? name;

  @override
  double? size;

  ConcreteProductA2(this.name, this.size);
}

class ConcreteProductB1 implements ProductFamilyB {
  @override
  String? name;

  @override
  double? size;

  ConcreteProductB1(this.name, this.size);
}

class ConcreteProductB2 implements ProductFamilyB {
  @override
  String? name;

  @override
  double? size;

  ConcreteProductB2(this.name, this.size);
}

void main() {
  ConcreteFactory1 cFactory1 = ConcreteFactory1();
  ConcreteFactory2 cFactory2 = ConcreteFactory2();

  ProductFamilyA winProduct1 = cFactory1.getProductA();
  ProductFamilyB winProduct2 = cFactory1.getProductB();

  ProductFamilyA iosProduct1 = cFactory2.getProductA();
  ProductFamilyB iosProduct2 = cFactory2.getProductB();

  print(
      "The size of the win product is ${winProduct1.size}, and the type is ${winProduct1.name}");
  print(
      "The size of the win product is ${winProduct2.size}, and the type is ${winProduct2.name}");

  print(
      "The size of the ios product is ${iosProduct1.size}, and the type is ${iosProduct1.name}");
  print(
      "The size of the ios product is ${iosProduct2.size}, and the type is ${iosProduct2.name}");
}
