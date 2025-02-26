import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sidedrawer_event.dart';
part 'sidedrawer_state.dart';

class SidedrawerBloc extends Bloc<SidedrawerEvent, SidedrawerState> {
  SidedrawerBloc() : super(SidedrawerInitial()) {
    on<SidedrawerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
