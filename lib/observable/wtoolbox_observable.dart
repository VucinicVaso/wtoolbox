import 'wtoolbox_observer.dart';

abstract class WTObservable {

  // list of observers
  List<WTObserver>? observers = List<WTObserver>.empty(growable: true);

  void subscribe(WTObserver? observer);

  void unsubscribe(String? observerName);

  void notifySubscriber(Map<String, dynamic>? message);

}