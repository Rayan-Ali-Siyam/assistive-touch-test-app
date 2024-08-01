import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class AssistiveTouchView extends StatefulWidget {
  const AssistiveTouchView({super.key});

  @override
  State<AssistiveTouchView> createState() => _AssistiveTouchViewState();
}

class _AssistiveTouchViewState extends State<AssistiveTouchView> {
  Color color = const Color(0xFFFFFFFF);
  BoxShape shape = BoxShape.circle;
  bool inActionPage = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await FlutterOverlayWindow.resizeOverlay(150, 150);
        setState(() {
          shape = BoxShape.circle;
        });
        return false;
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        child: GestureDetector(
          onTap: () async {
            if (shape == BoxShape.circle) {
              await FlutterOverlayWindow.resizeOverlay(500, 500);
              setState(() {
                shape = BoxShape.rectangle;
              });
            } else {
              await FlutterOverlayWindow.resizeOverlay(150, 150);
              setState(() {
                shape = BoxShape.circle;
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: shape == BoxShape.circle ? color : Colors.black12,
                shape: shape,
                borderRadius: shape == BoxShape.circle
                    ? null
                    : BorderRadius.circular(15)),
            child: Center(
              child: shape == BoxShape.circle
                  ? FlutterLogo()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await FlutterOverlayWindow.resizeOverlay(150, 150);
                            setState(() {
                              shape = BoxShape.circle;
                            });
                          },
                          child: Text("Collapse"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await FlutterOverlayWindow.resizeOverlay(150, 150);
                            setState(() {
                              shape = BoxShape.circle;
                            });
                          },
                          child: Text("Action Button"),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () async {
                            setState(() {
                              shape = BoxShape.circle;
                            });
                            await FlutterOverlayWindow.closeOverlay();
                          },
                          child: Text("Close"),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
