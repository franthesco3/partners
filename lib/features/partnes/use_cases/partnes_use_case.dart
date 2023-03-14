import '../../../api/routes/get_partnes_routes.dart';
import 'package:partners/support/models/partners.dart';

typedef Failure = Function(String error);
typedef Success = Function(List<Partnes> partnes);

abstract class PartnesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class PartnesUceCase extends PartnesUseCaseProtocol {
  final GetPartnesRoutesProtocol routes;

  PartnesUceCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getPartnes(
      success: (partnes) {
        try {
          final result = List<Partnes>.from(
              partnes.map((partne) => Partnes.fromMap(partne)));
          success?.call(result);
        } on Error catch (error) {
          failure?.call(error.stackTrace.toString());
        }
      },
      failure: (error) {
        failure?.call(error.message);
      },
    );
  }
}
