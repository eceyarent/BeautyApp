import 'package:flutter/material.dart';

///Counter button class
class AddButton extends StatefulWidget {
  ///Constructor for the counter button
  const AddButton(
      {Key? key,
      required this.count,
      required this.onChange,
      required this.loading,
      this.countColor = Colors.black,
      this.addIcon = const Icon(Icons.add),
      this.removeIcon = const Icon(Icons.remove),
      this.buttonColor = Colors.red,
      this.progressColor = Colors.red,
      this.customWidth = 12,
      this.customheight = 12})
      : super(key: key);
  // Mükemmel oldu :D dışardan vermezse width height ona da 18 dedik
  final double customWidth;
  final double customheight;

  ///Value of the counter displayed in the center
  final int count;

  ///Color of the counter value
  final Color countColor;

  ///Value change callback when the buttons are pressed
  final ValueChanged<int> onChange;

  ///For showing the linear progress indicator
  final bool loading;

  ///Color of the progress indicator
  final Color progressColor;

  ///Color of the icon button
  final Color buttonColor;

  ///Add button icon
  ///default: Icons.add
  final Icon addIcon;

  ///Remove button icon
  ///default: Icons.remove
  final Icon removeIcon;

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

// Bu Button senin oldu artık :D Bu arada çıkamıyorum senin yüzünden  Çok güzel müzikler açıyorsun ...
// İstersek bunu dışarı açarız Çağıurdığımız yerden veririz oda güzel olur bence çünkü burdan değiş falan sıkıntı uğraştuırı :D
class _AnimatedCounterState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    // Biz komple containerı küçültmek istiyoruz ama - ve + butonuna 32 width heigt vermiş kötü kod birde :D
    // Burda radiusu da çıkarsak daha güzel olur hemen yapalım :D Ama bi deneyelim mi alttaki ne işe yarıyor ?
    //
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ClipRRect(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.loading)
                LinearProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(widget.progressColor),
                  backgroundColor: Colors.transparent,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: widget.customWidth,
                      height: widget.customheight,
                      child: IconButton(
                        onPressed: widget.loading
                            ? null
                            : () {
                                widget.onChange(widget.count - 1);
                              },
                        icon: widget.removeIcon,
                        padding: EdgeInsets.zero,
                        color: widget.buttonColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      layoutBuilder: (Widget? currentChild,
                          List<Widget> previousChildren) {
                        return currentChild!;
                      },
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final Animation<Offset> inAnimation = Tween<Offset>(
                                begin: const Offset(1.0, 0.0), end: Offset.zero)
                            .animate(animation);
                        final Animation<Offset> outAnimation = Tween<Offset>(
                                begin: const Offset(-1.0, 0.0),
                                end: Offset.zero)
                            .animate(animation);

                        if (child.key.toString() == widget.count.toString()) {
                          return ClipRect(
                            child: SlideTransition(
                                position: inAnimation, child: child),
                          );
                        } else {
                          return ClipRect(
                            child: SlideTransition(
                                position: outAnimation, child: child),
                          );
                        }
                      },
                      child: SizedBox(
                        // Burası ortadaki sayı
                        key: Key(widget.count.toString()),
                        width: widget.customWidth,
                        height: widget.customheight,
                        child: Center(
                          child: Text(
                            widget.count.toString(),
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: widget.countColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: widget.customWidth,
                      height: widget.customheight,
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
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
