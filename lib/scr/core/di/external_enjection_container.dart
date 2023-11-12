import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final slExternal = GetIt.instance;

Future<void> init() async {
  slExternal.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        colors: true,
        printEmojis: true,
      ),
    ),
  );

  slExternal.registerLazySingleton<A>(() => A());
  slExternal.registerLazySingleton<B>(() => B(slExternal.get<A>()));
  slExternal.registerLazySingleton<C>(() => C(slExternal.get<B>()));
}

class A {}

class B {
  final A a;

  B(this.a);
}

class C {
  final B b;

  C(this.b);
}

void main() {
  A newObject = A();
  final A newObject1 = slExternal.get<A>();
  final C c = C(B(A()));
}
