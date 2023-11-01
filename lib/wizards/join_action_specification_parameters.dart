import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/wizards/join_action_specification_parameters.dart';

class JoinActionSpecificationParameters extends NewAppWizardParameters {
  late JoinActionSpecifications joinActionSpecifications;

  JoinActionSpecificationParameters(
      {required bool requiresAccessToLocalFileSystem,
      required bool availableInLeftDrawer,
      required bool availableInRightDrawer,
      required bool availableInAppBar,
      required bool availableInHomeMenu,
      required bool available,
      required JoinPaymentType paymentType}) {
    joinActionSpecifications = JoinActionSpecifications(
      requiresAccessToLocalFileSystem: requiresAccessToLocalFileSystem,
      availableInLeftDrawer: availableInLeftDrawer,
      availableInRightDrawer: availableInRightDrawer,
      availableInAppBar: availableInAppBar,
      availableInHomeMenu: availableInHomeMenu,
      available: available,
      paymentType: paymentType,
    );
  }
}
