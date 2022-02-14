import 'package:chat/modulo/usersmoder.dart';
import 'package:chat/register/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
    required bool isEmailVerifaed,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
          createUser(name: name, email: email, phone: phone, uId: value.user!.uid, isEmailVerifaed: isEmailVerifaed);
      emit(RegisterSuccessState());
      print('amva');
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
      print("slbnsonbaso;w" + onError.toString());
    });
  }


  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required bool isEmailVerifaed,
  }) async {
    UsersModel U = UsersModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      Bio: "Write Your Bio",
      Cover: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwGPF8X5lgcLBtUZUXV9kPPpfw7IuIsTq3uQ&usqp=CAU',
      ImageProfile: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3mGL7MA05qMPhCSSbB7C2bfI6I6Hyzuv_mZkh6lxhJ54qfhBAA-y7tBIlVq7nldYRlas&usqp=CAU',
      isEmailVerifaed: isEmailVerifaed,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(U.toMap())
        .then((value) {
      emit(CreateSuccessState());
      print('done !');
    }).catchError((onError) {
      emit(CreateErrorState(onError.toString()));
      print(
          "errrrrrrrrrrrooooooooooooooooorrrrrrrrrrrrrr " + onError.toString());
    });
  }
}
