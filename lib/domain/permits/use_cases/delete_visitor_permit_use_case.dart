import '../../../../core/result/result.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../repo/permits_repo.dart';

class DeleteVisitorPermitUseCase implements BaseUseCase<void, String> {
  final PermitsRepo _repo;
  DeleteVisitorPermitUseCase(this._repo);

  @override
  Future<Result<void>> call({required String params}) {
    return _repo.deleteVisitorPermit(id: params);
  }
}
