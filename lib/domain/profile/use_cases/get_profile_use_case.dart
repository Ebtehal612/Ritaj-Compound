
import 'package:fpdart/fpdart.dart';
import 'package:ritaj_compound/core/network/failure/failure.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase implements BaseUseCase<Profile, NoParams> {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<Failure, Profile>> call({required NoParams params}) async {
    return await repository.getProfile();
  }
}
