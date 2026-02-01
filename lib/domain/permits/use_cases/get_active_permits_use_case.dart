import '../../../../core/result/result.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../entities/visitor_permit.dart';
import '../repo/permits_repo.dart';

class GetActivePermitsUseCase implements BaseUseCase<List<VisitorPermit>, NoParams> {
  final PermitsRepo _repo;
  GetActivePermitsUseCase(this._repo);

  @override
  Future<Result<List<VisitorPermit>>> call({required NoParams params}) {
    return _repo.getActivePermits();
  }
}
