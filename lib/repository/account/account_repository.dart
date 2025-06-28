import 'package:wtoolbox/repository/wtoolbox_repository.dart';
import 'package:wtoolbox/entity/account/account.dart';

abstract class AccountRepository extends WTRepository<Account> {

  Future<Account> getSelected();

}