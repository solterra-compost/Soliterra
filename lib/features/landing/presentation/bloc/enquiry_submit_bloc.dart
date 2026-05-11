import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solterra/features/landing/domain/usecases/submit_enquiry_usecase.dart';
import 'package:solterra/features/landing/presentation/bloc/enquiry_event.dart';
import 'package:solterra/features/landing/presentation/bloc/enquiry_state.dart';

class EnquiryBloc extends Bloc<EnquiryEvent, EnquiryState> {
  SubmitEnquiryUsecase submitEnquiryUsecase;
  EnquiryBloc({required this.submitEnquiryUsecase}) : super(InitialState()) {
    on<FormDetailRequested>(_formDetailSubmit);
  }
  Future<void> _formDetailSubmit(
    FormDetailRequested event,
    Emitter<EnquiryState> emit,
  ) async {
    emit(SubmitLoadingState());
    try {
      await submitEnquiryUsecase(enquiry: event.enquiry);
      print('Enquiry submitted successfully');
      emit(SubmitSuccessState());
    } on SocketException {
      print('Network error: Check internet connection');
      emit(
        SubmitNetworkErrorState(
          message: "Check your internet connection and try again later.",
        ),
      );
    } catch (e) {
      print('Submission error: $e');
      emit(
        SubmitErrorState(
          message: 'Something went wrong. Please try again later.',
        ),
      );
    }
  }
}
