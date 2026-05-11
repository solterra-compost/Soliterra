import 'package:solterra/core/network/api_client.dart';
import 'package:solterra/features/landing/data/model/enquiry_model.dart';

class EnquiryRemoteDatasource {
  ApiClient apiClient;
  EnquiryRemoteDatasource({required this.apiClient});
  Future<void> submitData({required EnquiryModel model}) async {
    print('Submitting to Supabase: ${model.toJson()}');
    final response = await apiClient.post(
      "/rest/v1/solterra_queries",
      requiresAuth: false,
      body: model.toJson(),
    );
    
    print('Supabase response: $response');
  }
}
