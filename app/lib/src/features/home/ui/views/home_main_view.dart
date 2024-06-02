import 'package:eb_components/eb_components.dart';
import 'package:eggball/src/features/qr_scan/ui/qr_code_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () async {
              const qrCode =
                  'http://m.dhlottery.co.kr/?v=1121q172124333541q101820273542q173138404145q022326304041q0405151718191719215202';
              _getLottoNumbers(qrCode);

              return;
              final r = await LFNavigation.pushNamed(
                context,
                '/QRCodeScannerScreen',
                child: const QRCodeScannerScreen(),
              );
              if (r is Map<String, String>) {
                final code = r['QRCODE'];
                if (code != null) {
                  // http://m.dhlottery.co.kr/?v=1121q172124333541q101820273542q173138404145q022326304041q0405151718191719215202
                  print('QR Code: $code');
                }
              }
            },
            child: const EBText('Camera'),
          ),
        ),
      ],
    );
  }

  void _getLottoNumbers(String qrCode) {
    try {
      final uri = Uri.parse(qrCode);
      final queryParameters = uri.queryParameters;
      final v = queryParameters['v'];
      if (v != null) {
        final items = v.split('q');
        List<List<String>> results = [];
        for (final item in items) {
          if (item.length >= 12) {
            final str = item.substring(0, 12);
            List<String> result = [];
            for (var i = 0; i < str.length; i += 2) {
              result.add(str.substring(i, i + 2));
            }
            results.add(result);
          }
        }
        print('results: $results');
      }
    } catch (e) {
      Logging.e('Invalid QR Code: $qrCode');
    }
  }
}
