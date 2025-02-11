//We could have used go_router or AutoRoute(with code generation)
//here but since I have only 3 screens, default Navigator will be used

import 'package:credbevy_task/src/global_export.dart';

final Map<String, Widget Function(BuildContext)> credBevRoutes = {
  CredBevyRoutes.HOME_SCREEN: (_) => CredBevyHomeScreen(),
  CredBevyRoutes.TRANSFER_MONEY_SCREEN: (_) => CredBevTrnsfrMoneyScreen(),
  CredBevyRoutes.SUCCESS_SCREEN: (_) => CredBevSuccessScreen()
};