import 'package:flutter/material.dart';
import 'package:ninja_ad/models/vocation.dart';
import 'package:ninja_ad/shared/styled_text.dart';
import 'package:ninja_ad/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
  });

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected? AppColors.secondaryColor: Colors.transparent ,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              //vocation img
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80,
                colorBlendMode: BlendMode.color,
                // ignore: deprecated_member_use
                color: !selected? Colors.black.withOpacity(0.8):Colors.transparent,
              ),

              const SizedBox(
                width: 10,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(vocation.title),
                    StyledText(vocation.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
