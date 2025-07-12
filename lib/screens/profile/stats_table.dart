import 'package:flutter/material.dart';
import 'package:ninja_ad/models/character.dart';
import 'package:ninja_ad/shared/styled_text.dart';
import 'package:ninja_ad/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.star,
                    color: widget.character.points > 0
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const StyledText('Stats points available: '),
                const Expanded(
                    child: SizedBox(
                  width: 30,
                )),
                StyledHeading(widget.character.points.toString()),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          //stats table
          Table(
            children: widget.character.statsAsformattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
                children: [
                  //stats title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: StyledHeading(stat['title']!),
                    ),
                  ),

                  //stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!),
                    ),
                  ),

                  //icon to increase stats
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: AppColors.textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat['title']!);
                          turns += 0.1;
                        });
                      },
                    ),
                  ),

                  //icon to decrease stats
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStat(stat['title']!);
                          turns -= 0.1;
                        });
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
