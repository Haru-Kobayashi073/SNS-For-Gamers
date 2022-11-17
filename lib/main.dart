//flutter
import 'package:flutter/material.dart';
//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sns_vol2/views/login_page.dart';
//model
import 'package:sns_vol2/models/main_model.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // MyAppが起動した最初の時にユーザーがログインしているかどうかの確認
    //この変数を一回きり
    final MainModel mainmodel = ref.watch(mainProvider);
    final User? onceUser = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: mainmodel.currentUser == null
          ? LoginPage(
              mainModel: mainmodel,
            )
          : MyHomePage(
              title: 'Flutter Demo Home Page',
              mainModel: mainmodel,
            ),
    );
  }
}
//ConsumerWidgetは中でmodelを呼び出す、MyAppで呼ばれたmodelをStatelessWidgetに受け渡している
class MyHomePage extends StatelessWidget {
  const MyHomePage(
      {super.key, required this.title, required MainModel this.mainModel});
  final String title;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () => routes.toSignUpPage(context: context),
              child: const Text('サインアップページ')),
          ElevatedButton(
              onPressed: () =>
                  routes.toLoginpPage(context: context, mainModel: mainModel),
              child: const Text('ログインページ')),
        ],
      ),
    );
  }
}
