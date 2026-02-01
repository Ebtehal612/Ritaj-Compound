import 'package:fpdart/fpdart.dart';
import 'package:ritaj_compound/domain/permits/entities/visitor_permit.dart';
import 'package:ritaj_compound/domain/permits/repo/permits_repo.dart';
import '../../../core/network/failure/failure.dart';
import '../../../core/result/result.dart';
import '../../../domain/permits/entities/delivery_permit.dart';
import '../models/visitor_permit_model.dart';
import '../models/delivery_permit_model.dart';
import '../remote/permits_remote_data_source.dart';
import '../local/permits_local_data_source.dart';


class PermitsRepoImpl implements PermitsRepo {
  final PermitsRemoteDataSource _remoteDataSource;
  final PermitsLocalDataSource _localDataSource;
  PermitsRepoImpl(this._remoteDataSource, this._localDataSource);

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
      // Save to local cache
      await _localDataSource.saveVisitorPermits(models);
      return Right(models.map((e) => e.toEntity()).toList());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<List<VisitorPermit>>> getCachedVisitors() async {
    try {
      final models = await _localDataSource.getVisitorPermits();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteVisitorPermit({required String id}) async {
    try {
      await _remoteDataSource.deleteVisitorPermit(id: id);
      // Synchronize local cache
      final currentCached = await _localDataSource.getVisitorPermits();
      final updatedCached = currentCached.where((p) => p.id != id).toList();
      await _localDataSource.saveVisitorPermits(updatedCached);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<DeliveryPermit>> createDeliveryPermit({required DeliveryPermit permit}) async {
    try {
      final createdPermitModel = await _remoteDataSource.createDeliveryPermit(
        permit: DeliveryPermitModel.fromEntity(permit),
      );
      return Right(createdPermitModel.toEntity());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<List<DeliveryPermit>>> getActiveDeliveries() async {
    try {
      final models = await _remoteDataSource.getActiveDeliveries();
      // Save to local cache
      await _localDataSource.saveDeliveryPermits(models);
      return Right(models.map((e) => e.toEntity()).toList());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<List<DeliveryPermit>>> getCachedDeliveries() async {
    try {
      final models = await _localDataSource.getDeliveryPermits();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteDeliveryPermit({required String id}) async {
    try {
      await _remoteDataSource.deleteDeliveryPermit(id: id);
      // Synchronize local cache
      final currentCached = await _localDataSource.getDeliveryPermits();
      final updatedCached = currentCached.where((p) => p.id != id).toList();
      await _localDataSource.saveDeliveryPermits(updatedCached);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }
}
