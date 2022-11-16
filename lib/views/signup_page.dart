//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//package
import 'package:riverpod/riverpod.dart';
//model
import 'package:sns_vol2/models/signup_model.dart';

class SignPage extends ConsumerWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignUpModel signUpModel = ref.watch(signupProvider);
    final TextEditingController emailEditingCntoroller =
        TextEditingController(text: signUpModel.email);
    final TextEditingController passwordEditingCntoroller =
        TextEditingController(text: signUpModel.password);

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signUpModel.email = text,
            controller: emailEditingCntoroller,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => signUpModel.password = text,
            controller: passwordEditingCntoroller,
            obscureText: signUpModel.isObscure,
            decoration: InputDecoration(
                suffixIcon: InkWell(
              child: signUpModel.isObscure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onTap: () => signUpModel.toggleIsObscure(),
            )),
          ),
          Center(
            child: signUpModel.currentUser == null
                ? Text('Nullです。')
                : Text('Nullじゃないです。'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await signUpModel.createUser(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
