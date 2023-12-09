// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sabokbar_d/core/network/token_handler.dart';
// import 'package:sabokbar_d/core/usecases/usecase.dart';
// import 'package:sabokbar_d/features/splash/domain/entities/send_otp_response.dart';
// import 'package:sabokbar_d/features/splash/domain/use_cases/get_token.dart';
// import 'package:sabokbar_d/features/splash/domain/use_cases/get_user.dart';
// import 'package:sabokbar_d/injection.dart';
//
// import '../../../../core/error/failures.dart';
// import '../../domain/use_cases/send_otp_use_case.dart';
//
// part 'login_event.dart';
//
// part 'login_state.dart';
//
// class SplashBloc extends Bloc<SplashEvent, SplashState> {
//   final GetSetting getSetting;
//   final GetUser getUser;
//   final GetToken getToken;
//
//   SplashBloc({required this.getSetting, required this.getUser, required this.getToken}) : super(const Empty()) {
//     on<GetSettingEvent>((event, emit) async {
//       emit(const Empty());
//       final either = await getSetting.call(NoParams());
//       either.fold((l) {
//         handleFailure(l, emit);
//       }, (r) {
//         emit(Update(setting: r));
//       });
//     });
//     on<GetLocalDataEvent>((event, emit) async {
//       final either = await getToken.call(NoParams());
//       await either.fold((l) {
//         if (l is DataFailure) {
//           emit(const LoginScreenState());
//         } else {
//           handleFailure(l, emit);
//         }
//       }, (r) async {
//         final eitherUser = await getUser.call(NoParams());
//         eitherUser.fold((lUser) {
//           if (lUser is DataFailure) {
//             emit(const LoginScreenState());
//           } else {
//             handleFailure(lUser, emit);
//           }
//         }, (rUser) {
//           serviceLocator.registerLazySingleton(() => TokenClass(token: r, user: rUser));
//
//           emit(const HomeScreenState());
//         });
//       });
//     });
//
//     on<HandleUpdate>(
//       (event, emit) {
//         if (event.isForced) {
//           emit(ForceUpdate(event.link));
//         } else {
//           emit(NormalUpdate(event.link));
//         }
//       },
//     );
//   }
//
//   void handleFailure(Failure failure, emit) {
//     switch (failure.runtimeType) {
//       case DataFailure:
//         emit(
//           Error(
//             message: (failure as DataFailure).message,
//           ),
//         );
//         break;
//       case ApiFailure:
//         emit(
//           Error(
//             message: (failure as ApiFailure).message,
//           ),
//         );
//         break;
//       case ServerFailure:
//         emit(
//           Error(
//             message: (failure as ServerFailure).message,
//           ),
//         );
//         break;
//       case InternetFailure:
//         emit(
//           const ErrorInternet(),
//         );
//         break;
//       default:
//         emit(
//           const Error(
//             message: 'Fatal Error!',
//           ),
//         );
//     }
//   }
// }
