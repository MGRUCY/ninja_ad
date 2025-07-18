import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.akatab(
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading(this.text,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text.toUpperCase(),
      style: GoogleFonts.kanit(
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
//

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.kanit(
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}