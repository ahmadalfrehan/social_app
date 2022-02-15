abstract class SocialStates {}

class SocialInitialStates extends SocialStates {}

class SocialGetUserLoadingStates extends SocialStates {}

class SocialGetUserSuccessStates extends SocialStates {}

class SocialGetUserErrorStates extends SocialStates {
  final String error;
  SocialGetUserErrorStates(this.error);
}

class SocialChangeBottomNavStates extends SocialStates {}

class SocialNewPostStateStates extends SocialStates {}

class SocialImagePickedProfileSuccessStates extends SocialStates {}

class SocialImagePickedProfileErrorStates extends SocialStates {}

class SocialImagePickedCoverSuccessStates extends SocialStates {}

class SocialImagePickedCoverErrorStates extends SocialStates {}

class SocialUploadImageProfileSuccessStates extends SocialStates {}

class SocialUploadImageProfileErrorStates extends SocialStates {}

class SocialUploadImageCoverSuccessStates extends SocialStates {}

class SocialUploadImageCoverErrorStates extends SocialStates {}

class SocialUpdateImageStates extends SocialStates {}

class SocialUpdateUserLoadingStates extends SocialStates {}

class SocialUpdateCoverStates extends SocialStates {}
