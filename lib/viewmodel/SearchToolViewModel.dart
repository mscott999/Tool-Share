import '../main.dart';
import '../model/Tool.dart';

class SearchToolViewModel {
  static List<String> getToolNames() {
    List<String> _sortedResults = [];
    getTeamMap().forEach((key, value) {
      value.getToolList().forEach((Tool tool) {
        _sortedResults.add(tool.getTitle());
      });
    });
    _sortedResults = _sortedResults.toSet().toList();
    _sortedResults.sort();
    return _sortedResults;
  }

  static void searchForTool(String name) {
    null;
    print('Searching for ' + name);
  }
}
