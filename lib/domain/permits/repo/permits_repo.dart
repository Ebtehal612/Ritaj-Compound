import '../../../core/result/result.dart';
import '../entities/visitor_permit.dart';
import '../entities/delivery_permit.dart';


abstract class PermitsRepo {
  Future<Result<VisitorPermit>> createVisitorPermit({required VisitorPermit permit});
  Future<Result<List<VisitorPermit>>> getActivePermits();
  Future<Result<List<VisitorPermit>>> getCachedVisitors();
  Future<Result<void>> deleteVisitorPermit({required String id});

  Future<Result<DeliveryPermit>> createDeliveryPermit({required DeliveryPermit permit});
  Future<Result<List<DeliveryPermit>>> getActiveDeliveries();
  Future<Result<List<DeliveryPermit>>> getCachedDeliveries();
  Future<Result<void>> deleteDeliveryPermit({required String id});
}
