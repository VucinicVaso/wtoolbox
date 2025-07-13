abstract class WTUseCaseWithParams<Type, Params> {

  Future<Type> call(Params params);

}
