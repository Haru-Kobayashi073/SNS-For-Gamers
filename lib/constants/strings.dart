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
const String reauthenticationPageTitle = '再認証';
const String updatePasswordPageTitle = 'パスワードを変更';
const String updateEmailPageTitle = 'メールアドレスを変更';

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
const String editProfileText = "edit"; //'編集'
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
const String reauthenticateText = '再認証';
const String updatePasswordText = "パスワードを変更する";
const String updateEmailText = "メールアドレスを変更する";
const String updateButtonText = "変更";
const String explainUpdateEmailText = '新しいメールアドレスを入力してください。\n メールが送信されます。';

//alert msg
const String muteUserAlertMsg = 'このユーザーを本当にミュートしますか？';
const String unMuteUserAlertMsg = '本当にこのユーザーのミュートを解除しますか？';
const String muteCommentAlertMsg = '本当にコメントをミュートしますか?';
const String unMuteCommentAlertMsg = '本当にこのコメントのミュートを解除しますか？';
const String mutePostAlertMsg = 'この投稿を本当にミュートしますか？';
const String unMutePostAlertMsg = '本当にこの投稿のミュートを解除しますか？';
const String muteReplyAlertMsg = 'このリプライを本当にミュートしますか？';
const String unMuteReplyAlertMsg = '本当にこのリプライのミュートを解除しますか？';
const String maxSearchLengthMsg = "検索できるのは100文字までです";
// FieldKey
const String usersFieldKey = "users";
// message
const String userCreatedMsg = "ユーザーが作成できました";
const String noAccountMsg = 'アカウントをお持ちでない場合';
const String adminMsg = "管理者の動作が完了しました";
const String emailAlreadyInUseMsg = "入力されたメールアドレスはすでに登録済みです。";
const String invalidEmailMsg = "入力されたメールアドレスは無効です。";
const String operationNotAllowedMsg = "管理者によって許可されていません。";
const String weakPasswordMsg = "入力されたパスワードは危険です。";
const String userNotFoundMsg = "入力されたメールアドレスに対応するユーザーが見つかりませんでした。";
const String userDisabledMsg = "ユーザーが無効化されています";
const String wrongPasswordMsg = "パスワードが違います。";
const String userMismatchMsg = "ユーザーが対応していません。";
const String invalidCredentialMsg = 'プロバイダのクリデンシャルが有効ではありません。';
const String reauthenticatedMsg = '再認証が完了しました';
const String requiresRecentLoginMsg = '再認証を行なってください';
const String updatedPasswordMsg = "パスワードの変更が完了しました。";
const String sendMailMsg = "メールが送信されました";
const String missingAndroidPkgNameMsg = 'Android Pkg Nameが見つかりません';
const String missingIosBundleIdMsg = 'ios bundle idが見つかりません。';
const String createdPostMsg = "投稿が完了しました。";

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
