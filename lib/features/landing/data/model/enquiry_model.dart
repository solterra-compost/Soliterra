import 'package:solterra/features/landing/domain/entities/enquiry_entity.dart';

class EnquiryModel extends EnquiryEntity {
  const EnquiryModel({
    // required super.id,
    required super.name,
    required super.timeStamp,
    required super.phoneNo,
    required super.description,
  });

  // Entity → Model (for sending to API)
  factory EnquiryModel.fromEntity(EnquiryEntity entity) => EnquiryModel(
    // id: entity.id,
    name: entity.name,
    timeStamp: entity.timeStamp,
    phoneNo: entity.phoneNo,
    description: entity.description,
  );

  // Model → JSON (for API body)
  Map<String, dynamic> toJson() => {
    "name": name,
    "created_at": timeStamp,
    "phone_no": phoneNo,
    "description": description,
  };

  // JSON → Model (for API response)
  factory EnquiryModel.fromJson(Map<String, dynamic> json) => EnquiryModel(
    // id: json["id"] ?? "",
    timeStamp: json["created_at"] ?? "",
    name: json["name"] ?? "",
    phoneNo: json["phone_no"] ?? "",
    description: json["description"] ?? "",
  );
}
