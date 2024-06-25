abstract class SendFileStates{}

class SendFileInitState extends SendFileStates{}
class SendFileLoadingState extends SendFileStates{}
class SendFileErrorState extends SendFileStates{
  final String error;

 SendFileErrorState(this.error);
}
class SendFileSuccessState extends SendFileStates{}