import '../wtoolbox_observable.dart';
import '../wtoolbox_observer.dart';

class WTObservableImpl extends WTObservable {

  @override
  void subscribe(WTObserver? observer) {
    if(observers!.where((o) => o.getName() == observer!.getName()).isEmpty) {
      observers!.add(observer!);
    }
  }

  @override
  void unsubscribe(String? observerName) {
    if(observers!.where((o) => o.getName() == observerName).isNotEmpty) {
      observers!.removeWhere((o) => o.getName() == observerName);
    }
  }

  @override
  void notifySubscriber(Map<String, dynamic>? message) async {
    if(observers!.where((o) => o.getName() == message!['application']).isNotEmpty) {
      final observer = observers!.firstWhere((o) => o.getName() == message!['application']);
      observer.notify(message);
    }
  }

}