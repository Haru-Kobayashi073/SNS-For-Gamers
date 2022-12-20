Map<String, dynamic> returnSearchToken({required List<String> searchWords}) {
  Map<String, dynamic> searchToken = {};
  for (final searchWord in searchWords) {
    searchToken[searchWord] = true;
  }
  return searchToken;
}
