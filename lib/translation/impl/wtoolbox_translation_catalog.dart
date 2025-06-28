import '../wtoolbox_translations.dart';
import 'wtoolbox_me_mne_translations.dart';
import 'wtoolbox_en_us_translations.dart';

class WTTranslationCatalog extends WTTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': WTMeMneTranslations().keys['me_MNE']!,
    'en_US':  WTEnUsTranslations().keys['en_US']!,
  };

}