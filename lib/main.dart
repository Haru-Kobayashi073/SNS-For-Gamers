//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
//model
import 'package:sns_vol2/main_model.dart';
//options
import 'firebase_options.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainmodel = ref.watch(mainProvider);
    final TextEditingController emailEditingCntoroller =
        TextEditingController(text: mainmodel.email);
    final TextEditingController passwordEditingCntoroller =
        TextEditingController(text: mainmodel.password);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => mainmodel.email = text,
            controller: emailEditingCntoroller,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => mainmodel.password = text,
            controller: passwordEditingCntoroller,
          ),
          Center(
            child: mainmodel.currentUser == null
                ? Text('Nullです。')
                : Text('Nullじゃないです。'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async =>
            await mainmodel.createUser(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
