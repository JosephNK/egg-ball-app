import 'package:eb_resource/eb_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_common.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit_component.dart';

class AppComponentConfigure extends LFAppComponentConfigure {
  @override
  LFAppBarComponentConfigure setupAppbar() {
    return LFAppBarComponentConfigure(
      titleStyle: EBTextStyles.headlineBlack,
      backIconSize: 20.0,
      backgroundColor: EBColors.baseWhite,
      elevation: 0.0,
      actionsRightMargin: 12.0,
    );
  }

  @override
  LFAlertDialogConfigure? setupAlert() {
    return LFAlertDialogConfigure(
      cancelText: 'L10N_CANCEL'.tr(),
      okText: 'L10N_OK'.tr(),
      errorMessageTitle: 'L10N_NOTIFICATION'.tr(),
      titleStyle: EBTextStyles.p600TextBase,
      messageStyle: EBTextStyles.p600TextBase,
      okTextBackgroundColor: EBColors.baseBlack,
      okTextStyle: EBTextStyles.p600TextBase.copyWith(
        color: EBColors.baseWhite,
      ),
      cancelTextBackgroundColor: EBColors.baseWhite,
      cancelTextBorderColor: EBColors.gray300,
      cancelTextStyle: EBTextStyles.p600TextBase.copyWith(
        color: EBColors.baseBlack,
      ),
      buttonPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
    );
  }

  @override
  LFBottomSheetConfigure setupBottomSheet() {
    return LFBottomSheetConfigure(
      cancelText: 'L10N_CANCEL'.tr(),
    );
  }
}
