import 'package:flutter_bloc/flutter_bloc.dart';

enum Contrevent { increment, decrement }

class ContrBloc extends Bloc<Contrevent, int> {
  ContrBloc() : super(0);

  @override
  Stream<int> mapEventToState(Contrevent event) async* {
    switch (event) {
      case Contrevent.increment:
        yield state + 1;
        break;
      case Contrevent.decrement:
        yield state - 1;
        break;
    }
  }
}
