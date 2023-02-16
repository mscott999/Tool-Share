class Tool {
  int _quantity;
  List<String> _daysAvailable;
  String _title;

  Tool(this._quantity, this._daysAvailable, this._title);

  int compareTo(Tool tool) {
    return _quantity.compareTo(tool.getQuantity());
  }

  int getQuantity() {
    return _quantity;
  }

  List<String> getDaysAvailable() {
    return _daysAvailable;
  }

  String getTitle() {
    return _title;
  }
}
