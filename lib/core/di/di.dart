import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void init() {
  // Register Navigation Service
  // di.registerSingleton<NavigationService>(NavigationServiceImpl());

  // Register Connectivity Service
  // di.registerSingleton<ConnectivityService>(
  //   ConnectivityServiceImpl(),
  // );

  // Register Analytics Service
  // di.registerSingleton<AnalyticsService>(AnalyticsServiceImpl());

  // Register BaseScreenCubit
  // di.registerFactory<BaseScreenCubit>(
  //   () => BaseScreenCubit(
  //     navigationService: di(),
  //     analyticsService: di(),
  //     connectivityService: di(),
  //   ),
  // );
}
