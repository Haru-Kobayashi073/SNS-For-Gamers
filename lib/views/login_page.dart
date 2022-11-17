//flutter
import 'package:flutter/material.dart';
//package
import 'package:flutter_riverpod/flutter_riverpod.dart';
//model
import 'package:sns_vol2/models/login_model.dart';
import 'package:sns_vol2/models/main_model.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key, required MainModel this.mainModel}) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingCntoroller =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingCntoroller =
        TextEditingController(text: loginModel.password);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            controller: emailEditingCntoroller,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => loginModel.password = text,
            controller: passwordEditingCntoroller,
            obscureText: loginModel.isObscure,
            decoration: InputDecoration(
                suffixIcon: InkWell(
              child: loginModel.isObscure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onTap: () => loginModel.toggleIsObscure(),
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async =>
            await loginModel.login(context: context, mainModel: mainModel),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
