import 'package:wtoolbox/clean_architecture/repository/wtoolbox_repository.dart';
import 'package:wtoolbox/entity/message/message.dart';

abstract class MessageOutRepository extends WTRepository<Message> {

  Future<bool> updateById(int? queueId);

  Future<bool> deleteAllRead({ bool? read });

  Future<bool> deleteById(int? id);

  Future<Message> getById(int? id);

}