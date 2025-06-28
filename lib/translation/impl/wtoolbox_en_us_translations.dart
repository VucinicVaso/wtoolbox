import '../wtoolbox_translations.dart';

class WTEnUsTranslations extends WTTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "key": "${2}",
      "label": "en_US",
      "language": "English",
      "developedBy": "Vaso Vucinic",
      "languages": '''[
        { 
          "key":      ${1}, 
          "label":    "me_MNE",
          "language": "Montenegrin",
          "image":    "assets/mne_flag.png",
          "selected": ${false}
        },
        {
          "key":      ${2},
          "label":    "en_US",
          "language": "English",
          "image":    "assets/great_britain_flag.png", 
          "selected": ${true} 
        }
      ]''',
      "preferredLanguage": "Preferred language",
      "search": "Search...",
      "format": "Format: @value",
      "goBack": "Return",
      "continue": "Continue",
      "skip": "Skip",
      "cancel": "Cancel",
      "select": "Select",
      "save": "Save",
      "delete": "Delete",
      "edit": "Edit",
      "details": "Details",
      "allow": "Allow",
      "apply": "Apply",
      "submit1": "Submit",
      "submit2": "Submitting...",
      "next": "Next",
      "add": "Add",
      "new": "New",
      "title": "Title",
      "loading": "Loading...",
      "reviewAll": "Review all",
      "viewAll": "View all",
      "emptyField": "Field ''@value'' is empty.",
      "routeNotFount": "Route not found.",
      "errorTitle": "Error",
      "errorsTitle": "Errors",
      "errorMessage": "Something went wrong please try again!",
      "contentMissing": "The content of these page is currently unavailable.",
      "loginOptionPin": "PIN",
      "loginOptionFingerprint": "Fingerprint",
      "loginOptionFace": "Face",
      "biometricsMessage": "Please authenticate to access the application.",
      "testText": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "uploadFile": "Upload files",
      "chooseFile": "Choose files to upload",
      "selectedFiles": "Selected files",
      "moreFormFields": "Show more fields",
      "attachments": "Attachments",
      "signature": "Signature",
      "clear": "Clear",
      "done": "Done",
      "confirm": "Confirm",
      // websocket errors
      "stompError1": "Auth token is missing.",
      "stompError2": "Auth token is invalid.",
      "stompError3": "'Unknown Websocket error.",
      // validation
      "emptySpaceValidator": "''@value'' contains empty space.",
      "emailValidator": "''@value'' is not a valid email.",
      "emailValidator1": "It is possible to enter letters, numbers and characters . + _",
      "phoneValidator": "Phone number can only contain sign + and numbers.",
      "letterValidator": "''@value'' contains letters.",
      "numberValidator": "''@value'' contains numbers.",
      "nonAlphanumericValidator": "''@value'' contains non-alphanumeric characters.",
      "invalidValidator": "''@value'' is invalid.",
      "negativeValidator": "''@value'' must not be negative.",
    },
  };

}