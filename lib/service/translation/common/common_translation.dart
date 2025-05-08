import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'common_me_mne_translations.dart';
import 'common_en_us_translations.dart';

class CommonTranslation extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': CommonMeMneTranslations().keys['me_MNE']!,
    'en_US':  CommonEnUsTranslations().keys['en_US']!,
  };

}