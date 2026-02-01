import '../../../core/result/result.dart';
import '../../../core/use_cases/base_use_case.dart';
import '../entities/delivery_permit.dart';
import '../repo/permits_repo.dart';

class CreateDeliveryPermitUseCase implements BaseUseCase<DeliveryPermit, DeliveryPermit> {
  final PermitsRepo _repo;

  CreateDeliveryPermitUseCase(this._repo);

  @override
  Future<Result<DeliveryPermit>> call({required DeliveryPermit params}) {
    return _repo.createDeliveryPermit(permit: params);
  }
}
