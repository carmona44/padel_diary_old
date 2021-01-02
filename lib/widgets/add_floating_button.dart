import 'package:flutter/material.dart';
import 'package:padel_diary/widgets/modals/fit_modal.dart';
import 'package:padel_diary/widgets/modals/floating_modal.dart';

class AddFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showFloatingModalBottomSheet(
          context: context,
          builder: (context) => ModalFit(),
        );
      },
    );
  }
}
