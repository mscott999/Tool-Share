class Tool {
  int _quantity;
  List<bool> _daysAvailable;
  String _title;

  Tool(this._quantity, this._daysAvailable, this._title);

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
