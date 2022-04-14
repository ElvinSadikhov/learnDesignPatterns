class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal(); // private constructor declaration
}

void main() {
  Singleton obj = Singleton();
  print(obj);

  Singleton obj2 = Singleton();
  print(obj2);
}
