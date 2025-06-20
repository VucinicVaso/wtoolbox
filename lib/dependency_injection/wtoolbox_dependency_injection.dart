abstract class WTDependencyInjection {

  // create instances for services, repositories, database
  Future<void> register({ String? dotenvFileName });

  // remove instances for services, repositories, database
  Future<void> unregister();

}