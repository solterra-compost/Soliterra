import 'package:equatable/equatable.dart';
import 'package:solterra/features/landing/domain/entities/enquiry_entity.dart';

class EnquiryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FormDetailRequested extends EnquiryEvent {
  EnquiryEntity enquiry;
  FormDetailRequested({required this.enquiry});
  @override
  List<Object?> get props => [enquiry];
}
