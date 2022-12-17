//Stringにしたい
enum TokenType {
  following,
  likePost,
  likeComment,
  likeReply,
  muteUser,
  muteComment,
  mutePost,
  muteReply,
  mistake
}

//引数にTokenType.followingを入れるとStringの”following”がreturnされます
String returnTokenTypeString({required TokenType tokenType}) =>
    tokenType.toString().substring(10);

String followingTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.following);

String likePostTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.likePost);

String likeCommentTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.likeComment);

String likeReplyTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.likeReply);

String muteUserTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.muteUser);

String muteCommentTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.muteComment);

String mutePostTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.mutePost);

String muteReplyTokenTypeString =
    returnTokenTypeString(tokenType: TokenType.muteReply);

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
  } else if (tokenTypeString == likeReplyTokenTypeString) {
    return TokenType.likeReply;
  } else if (tokenTypeString == muteUserTokenTypeString) {
    return TokenType.muteUser;
  } else if (tokenTypeString == muteCommentTokenTypeString) {
    return TokenType.muteComment;
  } else if (tokenTypeString == mutePostTokenTypeString) {
    return TokenType.mutePost;
  } else if (tokenTypeString == muteReplyTokenTypeString) {
    return TokenType.muteReply;
  } else {
    return TokenType.mistake;
  }
}
