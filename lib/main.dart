//flutter
import 'package:flutter/material.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/sns_bottom_navigation_bar.dart';
import 'package:sns_vol2/models/sns_bottom_navigation_bar_model.dart';
import 'package:sns_vol2/views/login_page.dart';
//model
import 'package:sns_vol2/models/main_model.dart';
import 'package:sns_vol2/views/main/home_screen.dart';
import 'package:sns_vol2/views/main/profile_screen.dart';
import 'package:sns_vol2/views/main/search_screen.dart';
//options
import 'firebase_options.dart';
//constants
import 'package:sns_vol2/constants/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MyAppが起動した最初の時にユーザーがログインしているかどうかの確認
    //この変数を一回きり
    final User? onceUser = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(),
      home: onceUser == null
          ? LoginPage()
          : MyHomePage(
              title: appTitle,
            ),
    );
  }
}

//ConsumerWidgetは中でmodelを呼び出す、MyAppで呼ばれたmodelをStatelessWidgetに受け渡している
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final SNSBottomNavigationBarModel snsBottomNavigationBarModel =
        ref.watch(snsBottomNavigationBarProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainModel.isLoading
          ? Center(
              child: const Text(loadingText),
            )
          : PageView(
              controller: snsBottomNavigationBarModel.pageController,
              onPageChanged: (index) =>
                  snsBottomNavigationBarModel.onPageChanged(index: index),
              //childrenの数はElementsの数
              children: [
                //注意：ページジャないのでScaffold
                HomeScreen(),
                SearchScreen(),
                ProfileScreen(mainModel: mainModel,),
              ],
            ),
      bottomNavigationBar: SNSBottomNavigationBar(
          snsBottomNavigationBarModel: snsBottomNavigationBarModel),
    );
  }
}
