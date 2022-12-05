//Stringにしたい
enum TokenType { following, likePost, likeComment, mistake }

//引数にTokenType.followingを入れるとStringの”following”がreturnされます
String returnTokenTypeString({required TokenType tokenType}) =>
    tokenType.toString().substring(10);

String followingTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.following);

String likePostTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.likePost);

String likeCommentTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.following);

TokenType mapToTokenType({required Map<String, dynamic> tokenMap}) {
  //tokenのデータを取得してそのTokenTypeのStringを得る
  //それがfollowingかlikePostかを判別
  final String tokenTypeString = tokenMap['tokenType'];
  if (tokenTypeString == followingTokenTypeString) {
    return TokenType.following;
  } else if (tokenTypeString == likePostTokenTypeString) {
    return TokenType.likePost;
  } else if (tokenTypeString == likeCommentTokenTypeString) {
    return TokenType.likeComment;
  } else {
    return TokenType.mistake;
  }
}
