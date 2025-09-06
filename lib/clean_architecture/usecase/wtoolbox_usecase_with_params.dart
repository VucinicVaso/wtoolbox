abstract class WTUseCaseWithParams<T, P> {

  Future<T> call(P params);

}
