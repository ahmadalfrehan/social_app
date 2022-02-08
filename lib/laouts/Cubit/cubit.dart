import 'package:chat/laouts/Cubit/states.dart';
import 'package:chat/modulo/usersmoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';

class SociallCubit extends Cubit<SocialStates> {
  SociallCubit() : super(SocialInitialStates());
  static SociallCubit get(context) => BlocProvider.of(context);

  void getUsers() {
    emit(SocialGetUserLoadingStates());
    UsersModel UU;
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print('the data that comen is :');
      print(value.data().toString());
      emit(SocialGetUserSuccessStates());
    }).catchError((onError) {
      print(onError.toString().toString());
      emit(SocialGetUserErrorStates(onError.toString()));
    });
  }
}
