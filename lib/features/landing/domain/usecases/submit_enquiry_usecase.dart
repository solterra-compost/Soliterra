import 'package:solterra/features/landing/domain/entities/enquiry_entity.dart';
import 'package:solterra/features/landing/domain/repository/enquiry_repository.dart';

class SubmitEnquiryUsecase {
  EnquiryRepository repo;
  SubmitEnquiryUsecase({required this.repo});

  Future<void> call({required EnquiryEntity enquiry}) {
    return repo.submitEnquiryData(enquiry: enquiry);
  }
}
