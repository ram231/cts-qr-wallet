part of 'cts_register_cubit.dart';

abstract class CtsRegisterState extends Equatable {
  const CtsRegisterState();

  @override
  List<Object> get props => [];
}

class CtsRegisterInitial extends CtsRegisterState {}

class CtsRegisterLoaded extends CtsRegisterState {
  final String qrCode;
  CtsRegisterLoaded({
    this.qrCode,
  });

  @override
  List<Object> get props => [qrCode];

  CtsRegisterLoaded copyWith({
    String qrCode,
  }) {
    return CtsRegisterLoaded(
      qrCode: qrCode ?? this.qrCode,
    );
  }
}
