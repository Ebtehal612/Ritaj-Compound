import '../../../core/result/result.dart';
import '../../../core/use_cases/base_use_case.dart';
import '../entities/delivery_permit.dart';
import '../repo/permits_repo.dart';

class GetActiveDeliveriesUseCase implements BaseUseCase<List<DeliveryPermit>, NoParams> {
  final PermitsRepo _repo;

  GetActiveDeliveriesUseCase(this._repo);

  @override
  Future<Result<List<DeliveryPermit>>> call({required NoParams params}) {
    return _repo.getActiveDeliveries();
  }
}
