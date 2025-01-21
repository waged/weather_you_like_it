import 'package:weather_you_like_it/repository/app_repo.dart';

class AppService {
  final IAppRepo appRepo;

  AppService({required this.appRepo});

  // Future<Either<Failure, User>> getAccountDetails() async {
  //   return appRepo.getAccountDetailsModel();
  // }
}
