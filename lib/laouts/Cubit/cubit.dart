import 'dart:io';

import 'package:chat/laouts/Cubit/states.dart';
import 'package:chat/laouts/chat/Chat.dart';
import 'package:chat/laouts/feeds/feeds.dart';
import 'package:chat/laouts/settings/Sett.dart';
import 'package:chat/laouts/users/Userss.dart';
import 'package:chat/modulo/usersmoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../constant.dart';

class SociallCubit extends Cubit<SocialStates> {
  SociallCubit() : super(SocialInitialStates());

  static SociallCubit get(context) => BlocProvider.of(context);
  List<Map<String, dynamic>> elements = [];
  UsersModel? UU;

  void getUsers() {
    emit(
      SocialGetUserLoadingStates(),
    );
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      UU = UsersModel.fromJson(value.data() as Map<String, dynamic>);
      print(
        value.data().toString(),
      );
      emit(
        SocialGetUserSuccessStates(),
      );
    }).catchError((onError) {
      print("errrrrrrrrrrrrrrrrrrrrooooooooooooooooooooorrrrrrrrrrrrrrrrrrrr" +
          onError.toString());
      emit(SocialGetUserErrorStates(onError.toString()));
    });
  }

  int currrentIndex = 0;
  List<String> titles = [
    'Home',
    'Chat',
    'Users',
    'Settings',
  ];
  List<Widget> list = [
    FeedsScreen(),
    ChatScreen(),
    UsersScreen(),
    SettingScreen(),
  ];

  void ChangeBottomNav(int index) {
    currrentIndex = index;
    emit(SocialChangeBottomNavStates());
  }

  var imageProfile;
  final Picker = ImagePicker();

  getImageProfile(ImageSource sre) async {
    final Pac = await Picker.pickImage(source: sre);
    emit(SocialImagePickedProfileSuccessStates());
    if (Pac != null) {
      imageProfile = File(Pac.path);
    } else {
      emit(SocialImagePickedProfileErrorStates());
      print('no image selected');
    }
  }

  var imageCover;

  getImageCover(ImageSource sre) async {
    final Pac = await Picker.pickImage(source: sre);
    emit(SocialImagePickedCoverSuccessStates());
    if (Pac != null) {
      imageCover = File(Pac.path);
    } else {
      emit(SocialImagePickedCoverErrorStates());
      print('no imageCovered Selected');
    }
  }

  String? PrifileImageUrl;
  String? CoverImageUrl;

  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageProfile!.path).pathSegments.last}')
        .putFile(imageProfile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        emit(SocialUploadImageProfileSuccessStates());
        PrifileImageUrl = value;
      }).catchError((onError) {
        print("errrrrrrrrrrrrrrrooooooor" + onError.toString());
        emit(SocialUploadImageProfileErrorStates());
      });
    }).catchError((onError) {
      print("error" + onError.toString());
      emit(SocialUploadImageProfileErrorStates());
    });
  }

  void uploadCoverImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageCover!.path).pathSegments.last}')
        .putFile(imageCover)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        emit(SocialUploadImageCoverSuccessStates());
        CoverImageUrl = value;
      }).catchError((onError) {
        print("errrrrrrrrrrrrrrrooooooor" + onError.toString());
        emit(SocialUploadImageCoverErrorStates());
      });
    }).catchError((onError) {
      print("error" + onError.toString());
      emit(SocialUploadImageCoverErrorStates());
    });
  }

  void UpdateUserImages({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUpdateUserLoadingStates());
    if (imageProfile != null) {
      uploadProfileImage();
    } else if (imageCover != null) {
      uploadCoverImage();
    } else if (imageProfile != null && imageCover != null) {
    } else {
      UpdateUser(
        phone: phone,
        name: name,
        bio: bio,
      );
    }
  }

  void UpdateUser({
    required String name,
    required String phone,
    required String bio,
  }) {
    {
      UsersModel UserModelUpdate = UsersModel(
        name: name,
        phone: phone,
        Bio: bio,
        email: UU!.email,
        uId: UU!.uId,
        Cover: CoverImageUrl ?? UU!.ImageProfile,
        ImageProfile: PrifileImageUrl ?? UU!.Cover,
        isEmailVerifaed: false,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update(UserModelUpdate.toMap())
          .then((value) {
        getUsers();
      }).catchError((onError) {
        print(onError.toString());
      });
    }
  }
}
