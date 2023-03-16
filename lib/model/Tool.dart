import 'dart:convert';

class Tool {
  int _quantity;
  List<bool> _daysAvailable;
  String _title;

  Tool(this._quantity, this._daysAvailable, this._title);

  Tool.fromJson(Map<String, dynamic> json)
      : _quantity = int.parse(json['_quantity']),
        _daysAvailable = jsonDecode(json['_daysAvailable']),
        _title = json['_title'];

  Map<String, dynamic> toJson() => {
        '_quantity': _quantity.toString(),
        '_dayAvailable': jsonEncode(_daysAvailable),
        '_title': _title,
      };

  int compareTo(Tool tool) {
    return _quantity.compareTo(tool.getQuantity());
  }

  int getQuantity() {
    return _quantity;
  }

  List<bool> getDaysAvailable() {
    return _daysAvailable;
  }

  String getTitle() {
    return _title;
  }
}
