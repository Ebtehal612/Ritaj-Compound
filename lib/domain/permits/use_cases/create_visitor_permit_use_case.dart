import '../../../../core/result/result.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../entities/visitor_permit.dart';
import '../repo/permits_repo.dart';

class CreateVisitorPermitUseCase implements BaseUseCase<VisitorPermit, VisitorPermit> {
  final PermitsRepo _repo;
  CreateVisitorPermitUseCase(this._repo);

  @override
  Future<Result<VisitorPermit>> call({required VisitorPermit params}) {
    return _repo.createVisitorPermit(permit: params);
  }
}
