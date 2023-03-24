//flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//constants
import 'package:sns_vol2/constants/strings.dart';
import 'package:sns_vol2/constants/colors.dart' as colors;
//details
import 'package:sns_vol2/details/normal_appbar.dart';
import 'package:sns_vol2/details/rounded_button.dart';
import 'package:sns_vol2/details/rounded_text_field.dart';
import 'package:sns_vol2/details/user_image.dart';
//domain
import 'package:sns_vol2/domain/firestore_user/firestore_user.dart';
//models
import 'package:sns_vol2/models/edit_profile_model.dart';
import 'package:sns_vol2/models/main_model.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EditProfileModel editProfileModel = ref.watch(editProfileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final TextEditingController nameEditingController =
        TextEditingController(text: editProfileModel.userName);
    final TextEditingController textEditingController =
        TextEditingController(text: editProfileModel.introduction);
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colors.green,
      appBar: const NormalAppBar(title: editProfileTitle),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async => await editProfileModel.onImageTapped(),
                child: editProfileModel.croppedFile == null
                    ? UserImage(
                        length: 100,
                        userImageURL: mainModel.firestoreUser.userImageURL,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(300.0),
                        child: Container(
                            width: maxWidth * 0.25,
                            height: maxWidth * 0.25,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.circle,
                            ),
                            child: Image.file(editProfileModel.croppedFile!)),
                      ),
              ),
              SizedBox(
                height: maxHeight * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.04),
                    child: const Text(
                      'Name',
                      style: TextStyle(color: colors.white),
                    ),
                  ),
                  RoundedTextField(
                      keybordType: TextInputType.name,
                      onChanged: (value) => editProfileModel.userName = value,
                      controller: nameEditingController,
                      color: Colors.white,
                      borderColor: Colors.grey,
                      hintText: firestoreUser.userName),
                ],
              ),
              SizedBox(
                height: maxHeight * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.04),
                    child: const Text(
                      'Introduction',
                      style: TextStyle(color: colors.white),
                    ),
                  ),
                  RoundedTextField(
                      keybordType: TextInputType.text,
                      onChanged: (value) => editProfileModel.introduction = value,
                      controller: textEditingController,
                      color: Colors.white,
                      borderColor: Colors.grey,
                      hintText: firestoreUser.introduction),
                ],
              ),
              SizedBox(
                height: maxHeight * 0.05,
              ),
              RoundedButton(
                onPressed: () async => await editProfileModel.updateUserInfo(
                    context: context, mainModel: mainModel),
                widthRate: 0.3,
                color: Colors.black,
                text: updateText,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
