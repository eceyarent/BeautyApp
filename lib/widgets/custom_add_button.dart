import 'package:flutter/material.dart';

class CustomAddButton extends StatefulWidget {
  CustomAddButton(
      {Key? key,
      required this.count,
      required this.onChange,
      required this.loading,
      this.countColor = Colors.black,
      this.addIcon = const Icon(
        Icons.add,
      ),
      this.removeIcon = const Icon(
        Icons.remove,
      ),
      this.buttonColor = Colors.black,
      this.customWidth = 105,
      this.customheight = 30})
      : super(key: key);

  final ValueChanged<int> onChange;
  final int count;
  final bool loading;

  final Color countColor;
  final Color buttonColor;
  final Icon addIcon;
  final Icon removeIcon;
  final double customWidth;
  final double customheight;
  @override
  State<CustomAddButton> createState() => _CustomAddButtonState();
}

class _CustomAddButtonState extends State<CustomAddButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: widget.customWidth,
      height: widget.customheight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: IconButton(
              onPressed: widget.loading
                  ? null
                  : () {
                      widget.onChange(widget.count - 1);
                    },
              icon: widget.removeIcon,
              padding: EdgeInsets.zero,
              color: widget.buttonColor,
              iconSize: 12,
            ),
          ),
          SizedBox(
            child: Text(
              widget.count.toString(),
              style: TextStyle(
                  fontSize: 8.0,
                  fontWeight: FontWeight.w600,
                  color: widget.countColor),
            ),
          ),
          SizedBox(
            child: IconButton(
              // burası da + zaten :D
              onPressed: widget.loading
                  ? null
                  : () {
                      widget.onChange(widget.count + 1);
                    },
              icon: widget.addIcon,
              padding: EdgeInsets.zero,
              color: widget.buttonColor,
              iconSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
