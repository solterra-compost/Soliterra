class EnquiryState {}

class InitialState extends EnquiryState {}

class SubmitLoadingState extends EnquiryState {}

class SubmitSuccessState extends EnquiryState {
  String? message;
  SubmitSuccessState({this.message});
}

class SubmitNetworkErrorState extends EnquiryState {
  String message;
  SubmitNetworkErrorState({required this.message});
}

class SubmitErrorState extends EnquiryState {
  String message;
  SubmitErrorState({required this.message});
}
