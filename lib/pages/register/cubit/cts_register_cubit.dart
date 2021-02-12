import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cts_register_state.dart';

class CtsRegisterCubit extends Cubit<CtsRegisterState> {
  CtsRegisterCubit() : super(CtsRegisterInitial());

  void initialize(String qrCode) {
    emit(CtsRegisterLoaded(
      qrCode: qrCode,
    ));
  }
}
