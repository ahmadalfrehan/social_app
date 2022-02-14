import 'package:chat/laouts/Cubit/states.dart';
import 'package:chat/laouts/chat/Chat.dart';
import 'package:chat/laouts/feeds/feeds.dart';
import 'package:chat/laouts/settings/Sett.dart';
import 'package:chat/laouts/users/Userss.dart';
import 'package:chat/modulo/usersmoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  List<String> titles=[
    'Home',
    'Chat',
    'Users',
    'Settings',
  ];
  List<Widget> list =[
    FeedsScreen(),
    ChatScreen(),
    UsersScreen(),
    SettingScreen(),
  ];
  void ChangeBottomNav(int index){
    currrentIndex = index;
    emit(SocialChangeBottomNavStates());
  }
}
