import 'package:flutter/material.dart';

class RuleItem extends StatelessWidget {
  const RuleItem({super.key, required this.onClick});
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Expanded(
                child: Image.network("https://www.researchgate.net/publication/353422038/figure/fig2/AS:1048906112700416@1627090113328/Image-7-4-3-2-5-9-3-11-45-3-0-2-4-0-1-7.ppm"),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("Shlagbaumli temir yo'l kesishmasi")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
