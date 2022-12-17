// titles
import 'package:uuid/uuid.dart';

const String appTitle = "SNS";
const String signupTitle = "新規登録";
const String loginTitle = "ログイン";
const String cropperTitle = 'クロッパー';
const String accountTitle = 'アカウント';
const String themeTitle = 'テーマ';
const String passiveUserProfileTitle = 'プロフィール';
const String adminTitle = '管理者';
const String commentTitle = 'コメント';
const String replyTitle = 'リプライ';
const String editProfileTitle = 'プロフィール編集';
const String muteUsersPageTitle = 'ミュートしているユーザー';
const String muteCommentsPageTitle = 'ミュートしているコメント';
const String mutePostsPageTitle = 'ミュートしている投稿';
const String muteRepliesPageTitle = 'ミュートしているリプライ';
// texts
const String mailAddressText = "メールアドレス";
const String passwordText = "パスワード";
const String signupText = "新規登録を行う";
const String loginText = "ログインする";
const String logoutText = "ログアウトを行う";
const String loadingText = 'Loading';
const String uploadText = 'アップロードする';
const String createPostText = '投稿を作成する';
const String reloadText = '再読み込みを行う';
const String createCommentText = 'コメントを作成';
const String createReplyText = 'リプライを作成する';
const String editProfileText = 'プロフィールを編集する';
const String updateText = '更新';
const String showMuteUsersText = 'ミュートしているユーザーを表示';
const String yesText = 'はい';
const String noText = 'いいえ';
const String backText = '戻る';
const String muteUserText = 'ユーザーをミュートする';
const String unMuteUserText = 'ユーザーのミュートを解除する';
const String muteCommentText = 'コメントをミュートする';
const String unMuteCommentText = 'コメントのミュートを解除する';
const String showMuteCommentsText = 'ミュートしているコメントを表示';
const String mutePostButtonText = '投稿をミュート';
const String muteCommentButtonText = 'コメントをミュート';
const String muteUserButtonText = 'ユーザーをミュート';
const String muteReplyButtonText = 'リプライをミュート';
const String unMutePostText = '投稿のミュートを解除する';
const String showMutePostsText = 'ミュートしている投稿を表示';
const String mutePostText = '投稿をミュートする';
const String showMuteRepliesText = 'ミュートしているリプライを表示';
const String muteReplyText = 'リプライをミュート';
const String unMuteReplyText = 'リプライのミュートを解除';

//alert
const String muteUserAlertMsg = 'このユーザーを本当にミュートしますか？';
const String unMuteUserAlertMsg = '本当にこのユーザーのミュートを解除しますか？';
const String muteCommentAlertMsg = '本当にコメントをミュートしますか?';
const String unMuteCommentAlertMsg = '本当にこのコメントのミュートを解除しますか？';
const String mutePostAlertMsg = 'この投稿を本当にミュートしますか？';
const String unMutePostAlertMsg = '本当にこの投稿のミュートを解除しますか？';
const String muteReplyAlertMsg = 'このリプライを本当にミュートしますか？';
const String unMuteReplyAlertMsg = '本当にこのリプライのミュートを解除しますか？';
// FieldKey
const String usersFieldKey = "users";
// message
const String userCreatedMsg = "ユーザーが作成できました";
const String noAccountMsg = 'アカウントをお持ちでない場合';
//prefs key
const String isDarkThemePrefsKey = 'isDarkTheme';

// bottom navigation bar
const String homeText = "Home";
const String searchText = "Search";
const String profileText = "Profile";
String returnUuidV4() {
  const Uuid uuid = Uuid();
  return uuid.v4();
}

String returnJpgFileName() => '${returnUuidV4()}.jpg';
