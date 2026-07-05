import 'package:flutter/material.dart';

import '../../models/appointment_model.dart';
import 'imsh_theme_extension.dart';

extension AppointmentStatusBadgeColors on AppointmentStatus {
  (Color background, Color foreground) appointmentBadgeColors(
    ColorScheme scheme,
    ImshThemeExtension imsh,
  ) =>
      switch (this) {
        AppointmentStatus.confirmed =>
          (imsh.infoContainer, imsh.onInfoContainer),
        AppointmentStatus.pending =>
          (imsh.warningContainer, imsh.onWarningContainer),
        AppointmentStatus.cancelled => (
            scheme.errorContainer,
            scheme.onErrorContainer,
          ),
        AppointmentStatus.completed =>
          (imsh.successContainer, imsh.onSuccessContainer),
      };
}

extension ConsultationResultStatusBadgeColors on ConsultationResultStatus {
  (Color background, Color foreground) consultationBadgeColors(
    ColorScheme scheme,
    ImshThemeExtension imsh,
  ) =>
      switch (this) {
        ConsultationResultStatus.normal =>
          (imsh.infoContainer, imsh.onInfoContainer),
        ConsultationResultStatus.completed => (
            scheme.surfaceContainerHigh,
            scheme.onSurfaceVariant,
          ),
        ConsultationResultStatus.abnormal => (
            scheme.errorContainer,
            scheme.onErrorContainer,
          ),
        ConsultationResultStatus.pending =>
          (imsh.warningContainer, imsh.onWarningContainer),
      };
}
