import 'package:flutter/material.dart';

String? Selectedpassionlables;

class PassionChipViewItem extends StatefulWidget {
  final IconData avatarsIcons;
  final String labels;
  const PassionChipViewItem({
    super.key,
    required this.labels,
    required this.avatarsIcons,
  });

  @override
  State<PassionChipViewItem> createState() => _PassionChipViewItemState();
}

class _PassionChipViewItemState extends State<PassionChipViewItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    Selectedpassionlables = widget.labels;
    return RawChip(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 17),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        widget.labels,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14,
          fontFamily: 'Sk-Modernist',
          fontWeight: FontWeight.w400,
        ),
      ),
      avatar: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          widget.avatarsIcons,
          color: isSelected ? Colors.white : Colors.red,
        ),
      ),
      selected: isSelected,
      backgroundColor: isSelected ? Colors.red : Colors.white,
      selectedColor: Colors.red,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFE8E6EA)),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      onSelected: (value) {
        setState(() {
          isSelected = value;
          Selectedpassionlables = widget.labels;
        });
      },
    );
  }
}
