import 'package:fpdart/fpdart.dart';
import '../../../core/network/failure/failure.dart';
import '../../../core/result/result.dart';
import '../../../domain/permits/entities/visitor_permit.dart';
import '../../../domain/permits/repo/permits_repo.dart';
import '../models/visitor_permit_model.dart';
import '../remote/permits_remote_data_source.dart';

class PermitsRepoImpl implements PermitsRepo {
  final PermitsRemoteDataSource _remoteDataSource;
  PermitsRepoImpl(this._remoteDataSource);

  @override
  Future<Result<VisitorPermit>> createVisitorPermit({required VisitorPermit permit}) async {
    try {
      final createdPermitModel = await _remoteDataSource.createVisitorPermit(
        permit: VisitorPermitModel.fromEntity(permit),
      );
      return Right(createdPermitModel.toEntity());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<List<VisitorPermit>>> getActivePermits() async {
    try {
      final models = await _remoteDataSource.getActivePermits();
      return Right(models.map((e) => e.toEntity()).toList());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteVisitorPermit({required String id}) async {
    try {
      await _remoteDataSource.deleteVisitorPermit(id: id);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }
}
