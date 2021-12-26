import 'package:async/async.dart';
import 'package:flutter/material.dart';

/// FindoField provide to searching with debounce features.
///
/// [onChanged] It'll getting data after the duration while user stopping write.
/// [decoration] Draw your custom decoration

class FindoField extends StatefulWidget {
  const FindoField({
    Key? key,
    required this.onChanged,
    this.decoration,
    this.controller,
    this.maximumLength,
    this.duration = const Duration(milliseconds: 300),
    this.onCancel,
    this.textStyle,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final InputDecoration? decoration;
  final int? maximumLength;
  final Duration duration;
  final VoidCallback? onCancel;
  final TextStyle? textStyle;

  @override
  _FindoFieldState createState() => _FindoFieldState();
}

class _FindoFieldState extends State<FindoField> {
  late CancelableOperation<void> cancellableOperation;
  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(Future.delayed(widget.duration), onCancel: widget.onCancel);
  }

  void _onItemChanged(String value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: _onItemChanged,
      style: widget.textStyle,
      keyboardType: TextInputType.text,
      maxLines: widget.maximumLength,
      decoration: widget.decoration ?? const InputDecoration(prefixIcon: Icon(Icons.search)),
    );
  }
}
