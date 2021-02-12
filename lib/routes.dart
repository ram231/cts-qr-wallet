part of 'main.dart';

const routeDashboard = '/dashboard';
const routeLogin = '/login';
const routeRegister = '/register';
const routeUser = '/user';
const routeCheckpoint = '/checkpoint';
const routeScan = '/scan';
@visibleForTesting
Route ctsRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeDashboard:
      return CupertinoPageRoute(builder: (context) {
        return const CtsDashboardScaffold();
      });
    case routeLogin:
      return CupertinoPageRoute(
        builder: (context) => const CtsLoginScaffold(),
        settings: settings,
      );
    case routeScan:
      return CupertinoPageRoute<String>(builder: (context) {
        return const QRScannerScaffold();
      });
    case routeRegister:
      return CupertinoPageRoute<bool>(
        builder: (context) {
          return BlocProvider(
            create: (context) =>
                CtsRegisterCubit()..initialize(settings.arguments),
            child: const RegisterQRScaffold(),
          );
        },
        settings: settings,
      );
    case routeCheckpoint:
      break;
    default:
      return CupertinoPageRoute(
        builder: (context) => const CtsLoginScaffold(),
        settings: settings,
      );
  }
  return CupertinoPageRoute(builder: (context) {
    return CtsSplashScreen();
  });
}
