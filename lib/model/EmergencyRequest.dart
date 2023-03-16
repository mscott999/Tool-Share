import 'Team.dart';

class EmergencyRequest {
  late String _name;
  late int _quantity;

  EmergencyRequest(this._name, this._quantity);

  EmergencyRequest.fromJson(Map<String, dynamic> json)
      : _name = json['_name'],
        _quantity = int.parse(json['_quantity']);

  Map<String, dynamic> toJson() => {
        '_name': _name,
        '_quantity': _quantity.toString(),
      };

  String getName() {
    return _name;
  }

  int getQuantity() {
    return _quantity;
  }
}
