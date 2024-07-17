class ShoeComparison {
  final Map<String, dynamic> shoe1;
  final Map<String, dynamic> shoe2;
  final Map<String, dynamic> verdict;

  ShoeComparison(
      {required this.shoe1, required this.shoe2, required this.verdict});

  factory ShoeComparison.fromJson(Map<String, dynamic> json) {
    // Find the two shoe keys (they might vary)
    List<String> shoeKeys = json.keys.where((key) => key != 'verdict').toList();
    if (shoeKeys.length != 2) {
      throw FormatException(
          'Expected 2 shoe entries, found ${shoeKeys.length}');
    }

    return ShoeComparison(
      shoe1: json[shoeKeys[0]] as Map<String, dynamic>,
      shoe2: json[shoeKeys[1]] as Map<String, dynamic>,
      verdict: json['verdict'] as Map<String, dynamic>,
    );
  }
}
