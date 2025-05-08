import 'package:wtoolbox/3rd_party/lib_getx.dart';

class CommonMeMneTranslations extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': {
      "key": "${1}",
      "label": "me_MNE",
      "language": "Crnogorski",
      "appTitle": "BuraCloud",
      "applicationTitle": "BuraCloud",
      "developedBy": "BURA \n CLOUD",
      "developedByIcon": "bura_cloud_logo.svg",
      "application_info": '''{
        "name": {
          "key": "Naziv aplikacije",
          "value": "BuraCloud",
          "icon": "bc_icon.png"
        },
        "version": {
          "key": "Verzija",
          "value": "1.0.0"
        },
        "developedBy": {
          "key": "Razvijen od strane",
          "value": "Bura Cloud Montenegro"
        }
      }''',
      "languages": '''[
        { 
          "key":      ${1},
          "label":    "me_MNE",
          "language": "Crnogorski",
          "image":    "assets/flag_mne.png",
          "selected": ${true} 
        },
        {
          "key":      ${2},
          "label":    "en_US",
          "language": "Engleski",
          "image":    "assets/flag_great_britain.png", 
          "selected": ${false} 
        }
      ]''',
      "preferredLanguage": "Preferirani jezik",
      "search": "Pretraga...",
      "format": "Format: @value",
      "goBack": "Odustani",
      "continue": "Nastavi",
      "skip": "Preskoči",
      "cancel": "Odustani",
      "select": "Odabrati",
      "save": "Sačuvaj",
      "delete": "Izbriši",
      "edit": "Izmijeni",
      "details": "Detalji",
      "allow": "Dozvoli",
      "apply": "Primeniti",
      "submit1": "Prihvati",
      "submit2": "Slanje...",
      "next": "Sledeći",
      "add": "Dodati",
      "new": "Novi",
      "title": "Naziv",
      "loading": "Učitavanje...",
      "reviewAll": "Pregledajte sve",
      "viewAll": "Pregledajte sve",
      "emptyField": "Polje ''@value'' je prazno.",
      "routeNotFount": "Ruta nije pronađena.",
      "errorTitle": "Greška",
      "errorsTitle": "Greške",
      "errorMessage": "Nešto nije u redu. Molimo Vas, pokušajte ponovo!",
      "contentMissing": "Sadržaj ove stranice trenutno nije dostupan.",
      "loginOptionPin": "PIN",
      "loginOptionFingerprint": "Otisak prsta",
      "loginOptionFace": "Lice",
      "biometricsMessage": "Molimo potvrdite autentičnost da biste pristupili aplikaciji.",
      "testText": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "uploadFile": "Dodaj fajlove",
      "chooseFile": "Odaberite fajlove za otpremanje",
      "selectedFiles": "Odabrani fajlovi",
      "moreFormFields": "Prikaži više polja",
      "attachments": "Prilozi",
      "signature": "Potpis",
      "clear": "Obriši",
      "done": "Završeno",
      "confirm": "Potvrdi",
      // websocket errors
      "stompError1": "Nedostaje Auth token.",
      "stompError2": "Auth token nije validan.",
      "stompError3": "Nepoznata Websocket greška.",
      "stompError4": "Greška prilikom uspostavljanja Websocket konekcije.",
      // currency symbols
      "currencySymbolEuro": "@value \u{20AC}",
      "currencySymbolDollar": "\$ @value",
      // validation
      "emptySpaceValidator": "''@value'' sadrži prazan prostor.",
      "emailValidator": "''@value'' nije validan email.",
      "emailValidator1": "Moguć unos slova, brojeva i znakova . + _",
      "phoneValidator": "Telefonski broj moze da sadrži samo znak + i brojeve.",
      "letterValidator": "''@value'' sadrži slova.",
      "numberValidator": "''@value'' sadrži brojeve.",
      "nonAlphanumericValidator": "''@value'' sadrži nealfanumeričke znakove.",
      "invalidValidator": "''@value'' nije validan.",
      "negativeValidator": "''@value'' ne smije biti negativna.",
      // other
      "recentTransactions": "Nedavne transakcije",
      "flyMenuAwaitLabel": "Sačekajte rezultat...",
    },
  };

}