abstract class UpdateProfileStates{}
class InitialUpdateProfileState extends UpdateProfileStates{}
class ChangeIconAndSecurePassState extends UpdateProfileStates{}
class ChangeIconAndSecureConfirmPassState extends UpdateProfileStates{}
class UpdateUserDataSuccessState extends UpdateProfileStates{}
class UpdateUserDataErrorState extends UpdateProfileStates{
  final String error;
  UpdateUserDataErrorState(this.error);
}
class GetUserDataSuccessState extends UpdateProfileStates{}
class GetUserDataErrorState extends UpdateProfileStates{}
class ChangePhotoSuccessState extends UpdateProfileStates{}
class ChangePhotoErrorState extends UpdateProfileStates{}

class UploadPhotoSuccessState extends UpdateProfileStates{}
class UploadPhotoErrorState extends UpdateProfileStates{}
class LoadingUpdateDataState extends UpdateProfileStates{}
class LoadingUpdateImageState extends UpdateProfileStates{}
