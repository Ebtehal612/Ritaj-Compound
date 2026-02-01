import '../../../core/result/result.dart';
import '../../../core/use_cases/base_use_case.dart';
import '../repo/permits_repo.dart';

class DeleteDeliveryPermitUseCase implements BaseUseCase<void, String> {
  final PermitsRepo _repo;

  DeleteDeliveryPermitUseCase(this._repo);

  @override
  Future<Result<void>> call({required String params}) {
    return _repo.deleteDeliveryPermit(id: params);
  }
}
