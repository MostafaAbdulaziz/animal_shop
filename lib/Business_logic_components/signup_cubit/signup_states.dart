abstract class SignupStates{}
class InitialSignupState extends SignupStates{}
class LoadingCreateAccountState extends SignupStates{}
class CreateAccountSuccessState extends SignupStates{}
class CreateAccountErrorState extends SignupStates{}
class StoreAccountErrorState extends SignupStates{}
class ChangeIconAndSecurePassState extends SignupStates{}
class ChangeIconAndSecureConfirmPassState extends SignupStates{}