import '../wtoolbox_translations.dart';
import 'common_me_mne_translations.dart';
import 'common_en_us_translations.dart';

class CommonTranslations extends WTTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': CommonMeMneTranslations().keys['me_MNE']!,
    'en_US':  CommonEnUsTranslations().keys['en_US']!,
  };

}