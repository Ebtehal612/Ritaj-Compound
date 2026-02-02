import 'package:fpdart/fpdart.dart';
import 'package:ritaj_compound/core/network/failure/failure.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
}
