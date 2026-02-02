import 'package:fpdart/fpdart.dart';
import 'package:ritaj_compound/core/network/failure/failure.dart';
import 'package:ritaj_compound/core/network/exceptions.dart';
import '../../../domain/profile/entities/profile.dart';
import '../../../domain/profile/repositories/profile_repository.dart';
import '../data_source/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final remoteProfile = await remoteDataSource.getProfile();
      return Right(remoteProfile.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }
}
