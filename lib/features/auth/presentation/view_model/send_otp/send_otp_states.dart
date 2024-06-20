abstract class SendOtpStates{}

class SendOtpInitState extends SendOtpStates{}
class SendOtpLoadingState extends SendOtpStates{}
class SendOtpErrorState extends SendOtpStates{
  final String error;

  SendOtpErrorState(this.error);
}
class SendOtpSuccessState extends SendOtpStates{}