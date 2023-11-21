abstract class BaseInteractor<T, R> {
  Future<R> call(T argument);
}

abstract class BaseNoArgsIteractors<R> {
  Future<R> call();
}
