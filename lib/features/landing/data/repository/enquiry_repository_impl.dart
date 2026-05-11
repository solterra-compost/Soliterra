import 'package:solterra/features/landing/data/model/enquiry_model.dart';
import 'package:solterra/features/landing/data/sources/enquiry_remote_datasource.dart';
import 'package:solterra/features/landing/domain/entities/enquiry_entity.dart';
import 'package:solterra/features/landing/domain/repository/enquiry_repository.dart';

class EnquiryRepositoryImpl implements EnquiryRepository {
  EnquiryRemoteDatasource datasource;
  EnquiryRepositoryImpl({required this.datasource});
  @override
  Future<void> submitEnquiryData({required EnquiryEntity enquiry}) async {
    final model = EnquiryModel.fromEntity(enquiry);
    await datasource.submitData(model: model);
  }
}
