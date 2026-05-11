// features/enquiry/domain/entities/enquiry_entity.dart

class EnquiryEntity {
  // final String id;
  final String timeStamp;
  final String name;
  final String phoneNo;
  final String description;

  const EnquiryEntity({
    // required this.id,
    required this.name,
    required this.timeStamp,
    required this.phoneNo,
    required this.description,
  });
}