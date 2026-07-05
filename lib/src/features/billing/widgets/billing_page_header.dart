import 'package:flutter/material.dart';

import '../../../shared/widgets/imsh_page_header.dart';

class BillingPageHeader extends StatelessWidget {
  const BillingPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImshPageHeader(
      title: 'Billing & Receipts',
      subtitle:
          'Manage your medical expenses and download digital receipts.',
    );
  }
}
