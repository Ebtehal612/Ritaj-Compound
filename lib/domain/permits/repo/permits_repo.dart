import '../../../core/result/result.dart';
import '../entities/visitor_permit.dart';

abstract class PermitsRepo {
  Future<Result<VisitorPermit>> createVisitorPermit({required VisitorPermit permit});
  Future<Result<List<VisitorPermit>>> getActivePermits();
  Future<Result<void>> deleteVisitorPermit({required String id});
}
