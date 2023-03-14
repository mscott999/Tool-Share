import 'Team.dart';

class EmergencyRequest {
  late String _name;
  late int _quantity;

  EmergencyRequest(this._name, this._quantity);

  String getName() {
    return _name;
  }

  int getQuantity() {
    return _quantity;
  }
}
