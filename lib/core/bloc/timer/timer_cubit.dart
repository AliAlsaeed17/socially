import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<double> {
  Timer? _timer;
  final double _increment;
  final Duration _interval;

  TimerCubit()
      : _increment = 0.005,
        _interval = const Duration(milliseconds: 50),
        super(0.0);

  void startTimer() {
    _timer?.cancel();
    emit(0.0);
    _timer = Timer.periodic(_interval, (timer) {
      if (state >= 1.0) {
        _timer?.cancel();
      } else {
        emit(state + _increment);
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    emit(0.0);
    startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
