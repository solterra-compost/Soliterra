import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solterra/core/config/env.dart';
import 'package:solterra/core/network/api_client.dart';
import 'package:solterra/features/landing/data/repository/enquiry_repository_impl.dart';
import 'package:solterra/features/landing/data/sources/enquiry_remote_datasource.dart';
import 'package:solterra/features/landing/domain/usecases/submit_enquiry_usecase.dart';
import 'package:solterra/features/landing/presentation/bloc/enquiry_submit_bloc.dart';
import 'package:solterra/features/landing/presentation/pages/landing_page.dart';

class AppRouter {
  static GoRouter router() => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => EnquiryBloc(
            submitEnquiryUsecase: SubmitEnquiryUsecase(
              repo: EnquiryRepositoryImpl(
                datasource: EnquiryRemoteDatasource(
                  apiClient: ApiClient(
                    Env.baseUrl,
                    anonKey: Env.anonKey,

                    tokenController: () => "",
                  ),
                ),
              ),
            ),
          ),
          child: LandingPage(),
        ),
      ),
    ],
  );
}
