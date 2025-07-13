import 'package:wtoolbox/clean_architecture/repository/wtoolbox_repository.dart';
import 'package:wtoolbox/entity/message/message.dart';

abstract class MessageInRepository extends WTRepository<Message>  {

  Future<bool> deleteAllByAppName({ String? applicationName, bool? isRead });

  Future<bool> deleteById(int? id);

  Future<Message> getById(int? id);

  Future<int> getLast();

  Future<List<Message>> getAllByAppName({ String? applicationName, bool? isRead });

}