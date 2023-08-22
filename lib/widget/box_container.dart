import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final bool hasError;
  final Color? color;
  final Color? errorColor;
  final BoxConstraints? constraints;
  final bool showShadow;
  final DecorationImage? decorationImage;
  final BoxShape shape;
  final bool enablePadding;
  final bool showCount;
  final String? count;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  const BoxContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.hasError = false,
    this.color,
    this.errorColor,
    this.constraints,
    this.showShadow = true,
    this.decorationImage,
    this.shape = BoxShape.rectangle,
    this.enablePadding = true,
    this.showCount = false,
    this.count,
    this.padding,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showCount
        ? Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                margin: const EdgeInsets.all(5),
                width: width,
                height: height,
                constraints: constraints,
                curve: Curves.easeInToLinear,
                decoration: BoxDecoration(
                  border: border,
                  shape: shape,
                  image: decorationImage,
                  color: color ?? Theme.of(context).cardColor,
                  borderRadius: shape != BoxShape.rectangle
                      ? null
                      : BorderRadius.circular(20),
                  boxShadow: showShadow
                      ? [
                          BoxShadow(
                            color: hasError
                                ? errorColor ?? Theme.of(context).errorColor
                                : Theme.of(context).highlightColor,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0.0, 0.0),
                          ),
                        ]
                      : null,
                ),
                child: Padding(
                  padding: child is TextField ||
                          child is TextFormField ||
                          child is Stack ||
                          !enablePadding
                      ? const EdgeInsets.all(0.0)
                      : padding ?? const EdgeInsets.all(15),
                  child: child,
                ),
              ),
              Positioned(
                top: 3,
                right: 3,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: showShadow
                        ? [
                            BoxShadow(
                              color: hasError
                                  ? errorColor ?? Theme.of(context).errorColor
                                  : Theme.of(context).highlightColor,
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: const Offset(0.0, 0.0),
                            ),
                          ]
                        : null,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      count!,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              )
            ],
          )
        : AnimatedContainer(
            duration: Duration(milliseconds: 100),
            margin: const EdgeInsets.all(5),
            width: width,
            height: height,
            constraints: constraints,
            curve: Curves.easeInToLinear,
            decoration: BoxDecoration(
              shape: shape,
              image: decorationImage,
              color: color ?? Theme.of(context).cardColor,
              borderRadius: shape != BoxShape.rectangle
                  ? null
                  : BorderRadius.circular(20),
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                        color: hasError
                            ? errorColor ?? Theme.of(context).errorColor
                            : Theme.of(context).highlightColor,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0.0, 0.0),
                      ),
                    ]
                  : null,
            ),
            child: Padding(
              padding: child is TextField ||
                      child is TextFormField ||
                      child is Stack ||
                      !enablePadding
                  ? const EdgeInsets.all(0.0)
                  : padding ?? const EdgeInsets.all(15),
              child: child,
            ),
          );
  }
}
