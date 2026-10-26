import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/home_cek_data.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/detail_riwayat.dart';
import 'package:jombang/pages/cek_data_kendaraan/hasil_uji/home_hasil_uji.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/home_riwayat.dart';
import 'package:jombang/pages/home/home.dart';
import 'package:jombang/pages/pendaftaran/pendaftaran.dart';
import 'package:jombang/pages/persyaratan/detail_persyaratan.dart';
import 'package:jombang/pages/persyaratan/persyaratan.dart';

class AppNavigation {
  static String initial = "/home";
  static CustomTransitionPage buildPageWithDefaultTransition<T>(
      {required BuildContext context,
      required GoRouterState state,
      required Widget child,
      required bool fade,
      required bool leftToRight}) {
    return CustomTransitionPage<T>(
      transitionDuration: const Duration(milliseconds: 400),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          fade
              ? FadeTransition(opacity: animation, child: child)
              : SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: leftToRight
                          ? const Offset(-1, 0)
                          : const Offset(1, 0),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeIn)),
                  ),
                  child: child),
    );
  }

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: HomePage(),
            fade: true,
            leftToRight: false),
      ),
      GoRoute(
        name: 'persyaratan',
        path: '/persyaratan',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const PersyaratanPage(),
            fade: true,
            leftToRight: false),
        routes: [
          GoRoute(
            name: 'detailpersyaratan',
            path: '/detailpersyaratan',
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: const DetailPersyaratanPage(),
                    // child: DetailPersyaratanPage(
                    //     persyaratan: state.uri.queryParameters['nama']!),
                    fade: false,
                    leftToRight: false),
          ),
        ],
      ),
      GoRoute(
        name: 'cekdatakendaraan',
        path: '/cekdatakendaraan',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const HomeCekData(),
            fade: true,
            leftToRight: false),
      ),
      GoRoute(
        name: 'cekhasiluji',
        path: '/cekhasiluji',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const HomeHasilUji(),
            fade: true,
            leftToRight: false),
      ),
      GoRoute(
        name: 'riwayatkendaraan',
        path: '/riwayatkendaraan',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const HomeRiwayat(),
            fade: true,
            leftToRight: false),
        routes: [
          GoRoute(
            name: 'detailriwayat',
            path: '/detailriwayat',
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: DetailRiwayat(),
                    // child: DetailPersyaratanPage(
                    //     persyaratan: state.uri.queryParameters['nama']!),
                    fade: false,
                    leftToRight: false),
          ),
        ],
      ),
      GoRoute(
        name: 'pendaftaran',
        path: '/pendaftaran',
        builder: (context, state) => const PendaftaranPage(),
      ),
      // GoRoute(
      //   name: 'profile',
      //   path: '/profile',
      //   builder: (context, state) => const Pendaftaran(),
      // ),
      // GoRoute(
      //   name: 'informasi',
      //   path: '/informasi',
      //   builder: (context, state) => const Pendaftaran(),
      // ),
    ],
  );
}
