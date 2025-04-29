import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StreamoraLoadingWidget extends StatelessWidget {
  const StreamoraLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(child: Lottie.asset("assets/lotties/loading.json")),
          Text(
            "Loading... Please Wait.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
