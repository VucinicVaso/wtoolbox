abstract class WTDatabase {

  Future<void> createConnection();

  Future<void> closeConnection();

}