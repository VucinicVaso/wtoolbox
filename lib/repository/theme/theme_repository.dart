import '../wtoobox_repository.dart';
import '../../entity/theme/wt_theme.dart';

abstract class ThemeRepository extends WTRepository<WTTheme> {

  Future<WTTheme> getSelected();

}