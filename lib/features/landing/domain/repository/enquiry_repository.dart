import 'package:solterra/features/landing/domain/entities/enquiry_entity.dart';

abstract class EnquiryRepository {
  Future<void> submitEnquiryData({required EnquiryEntity enquiry});
}
