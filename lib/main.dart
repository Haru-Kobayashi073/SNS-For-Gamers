//flutter
import 'package:flutter/material.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/themes.dart';
import 'package:sns_vol2/details/sns_bottom_navigation_bar.dart';
import 'package:sns_vol2/details/sns_drawer.dart';
import 'package:sns_vol2/models/create_post_model.dart';
import 'package:sns_vol2/models/mute_users_model.dart';
import 'package:sns_vol2/models/sns_bottom_navigation_bar_model.dart';
import 'package:sns_vol2/models/themes_model.dart';
import 'package:sns_vol2/views/auth/verify_email_page.dart';
import 'package:sns_vol2/views/login_page.dart';
//model
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/views/main/articles_screen.dart';
import 'package:sns_vol2/views/main/home_screen.dart';
import 'package:sns_vol2/views/main/profile_screen.dart';
import 'package:sns_vol2/views/main/search_screen.dart';
//options
import 'firebase_options.dart';
//constants
import 'package:sns_vol2/constants/colors.dart' as colors;
import 'package:sns_vol2/constants/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int _mcgpalette2PrimaryValue = 0xFF388D5D;
    const MaterialColor customSwatch = MaterialColor(
      _mcgpalette2PrimaryValue,
      <int, Color>{
        50: Color(0xFFE7F1EC),
        100: Color(0xFFC3DDCE),
        200: Color(0xFF9CC6AE),
        300: Color(0xFF74AF8E),
        400: Color(0xFF569E75),
        500: Color(_mcgpalette2PrimaryValue),
        600: Color(0xFF328555),
        700: Color(0xFF2B7A4B),
        800: Color(0xFF247041),
        900: Color(0xFF175D30),
      },
    );
    // MyAppが起動した最初の時にユーザーがログインしているかどうかの確認
    //この変数を一回きり
    final User? onceUser = FirebaseAuth.instance.currentUser;
    final ThemeModel themeModel = ref.watch(themeProvider);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: themeModel.isDarkTheme
            ? darkThemeData(context: context)
            : lightThemeData(context: context),

        // ThemeData(
        //   primarySwatch: customSwatch,
        // ),
        home: onceUser == null //ユーザーが存在していないなら
            ? const LoginPage() //ログインページへ
            : onceUser.emailVerified?
                //ユーザーが存在し、メールが認証されている
                MyHomePage(
                    title: appTitle,
                    themeModel: themeModel,
                  )
                : const VerifyEmailPage()
        //ユーザーは存在するけれど、メールが認証されていない
        );
  }
}

//ConsumerWidgetは中でmodelを呼び出す、MyAppで呼ばれたmodelをStatelessWidgetに受け渡している
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title, required this.themeModel});
  final String title;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final SNSBottomNavigationBarModel snsBottomNavigationBarModel =
        ref.watch(snsBottomNavigationBarProvider);
    final CreatePostModel createPostModel = ref.watch(createPostModelProvider);
    final MuteUsersModel muteUserModel = ref.watch(muteUsersProvider);
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: colors.backScreenColor,
      // key: scaffoldKey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colors.appBarTextColor),
        elevation: 0,
        backgroundColor: colors.appBarBackColor,
        title: Text(
          title,
          style: const TextStyle(color: colors.appBarTextColor),
        ),
      ),
      drawer: Drawer(
        // backgroundColor: colors.backScreenColor,
        child: SNSDrawer(
          mainModel: mainModel,
          themeModel: themeModel,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createPostModel.showPostDialog(
            context: context, mainModel: mainModel),
        // backgroundColor: const Color(0xffD6A34A),
        backgroundColor: colors.floatingButtonBackColor,
        child: const Icon(
          Icons.new_label,
          color: colors.floatingButtonIconColor,
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: mainModel.isLoading
          ? const Center(
              child: Text(loadingText),
            )
          : PageView(
              controller: snsBottomNavigationBarModel.pageController,
              onPageChanged: (index) =>
                  snsBottomNavigationBarModel.onPageChanged(index: index),
              //childrenの数はElementsの数
              children: [
                //注意：ページじゃないのでScaffold
                HomeScreen(
                  mainModel: mainModel,
                  muteUsersModel: muteUserModel,
                  createPostModel: createPostModel,
                ),
                SearchScreen(
                  mainModel: mainModel,
                ),
                ArticleScreen(),
                ProfileScreen(
                  mainModel: mainModel,
                ),
              ],
            ),
      bottomNavigationBar: SNSBottomNavigationBar(
          snsBottomNavigationBarModel: snsBottomNavigationBarModel),
    );
  }
}
