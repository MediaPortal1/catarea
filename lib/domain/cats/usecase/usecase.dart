abstract class UseCaseIn<V>{
  Future<V> invoke();
}

abstract class UseCaseOut<V>{
  Future<bool> invoke(V v);
}