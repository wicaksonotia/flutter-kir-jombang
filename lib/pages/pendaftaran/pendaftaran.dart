import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Pendaftaran extends StatefulWidget {
  const Pendaftaran({super.key});

  @override
  State<Pendaftaran> createState() => _PendaftaranState();
}

class _PendaftaranState extends State<Pendaftaran> {
  // @override
  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(interceptor);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   BackButtonInterceptor.remove(interceptor);
  // }

  // bool interceptor(bool btnEvent, RouteInfo info) {
  //   context.goNamed('home');
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) {
          print("<<=======>>>123");
          return;
        }
        print("<<=======>>>123");
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("data"),
          leading: IconButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
