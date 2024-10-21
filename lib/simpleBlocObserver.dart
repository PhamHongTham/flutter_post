// ignore_for_file: file_names

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override

  //Xử lý sự kiện chuyển tiếp, ghi lại các trạng thái trước và sau khi thay đổi.
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
  }

  @override
  //Xử lý lỗi xảy ra trong BLoC, cho phép ghi lại thông tin lỗi.
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
