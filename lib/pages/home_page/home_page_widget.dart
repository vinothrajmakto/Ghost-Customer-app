// import '/flutter_flow/flutter_flow_util.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'home_page_model.dart';
// export 'home_page_model.dart';
//
// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({super.key});
//
//   @override
//   State<HomePageWidget> createState() => _HomePageWidgetState();
// }
//
// class _HomePageWidgetState extends State<HomePageWidget> {
//   late HomePageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomePageModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       context.pushNamed(
//         'intro',
//         extra: <String, dynamic>{
//           kTransitionInfoKey: const TransitionInfo(
//             hasTransition: true,
//             transitionType: PageTransitionType.fade,
//             duration: Duration(milliseconds: 3000),
//           ),
//         },
//       );
//     });
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: const Color(0xFF183835),
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(0.0, 265.0, 0.0, 0.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(0.0),
//               child: Image.asset(
//                 'assets/images/Ghost_-_Logo.png',
//                 width: double.infinity,
//                 height: 265.0,
//                 fit: BoxFit.none,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Above is the original code
// The below code checks for onboarding

// import '/flutter_flow/flutter_flow_util.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home_page_model.dart';
// export 'home_page_model.dart';
//
// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({super.key});
//
//   @override
//   State<HomePageWidget> createState() => _HomePageWidgetState();
// }
//
// class _HomePageWidgetState extends State<HomePageWidget> {
//   late HomePageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomePageModel());
//
//     // Check if the onboarding has been completed
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       await _checkOnboardingStatus();
//     });
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }
//
//   Future<void> _checkOnboardingStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;
//
//     if (isOnboardingCompleted) {
//       // Navigate directly to the main page
//       context.pushNamed(
//         'MainPage',
//         extra: <String, dynamic>{
//           kTransitionInfoKey: const TransitionInfo(
//             hasTransition: true,
//             transitionType: PageTransitionType.fade,
//             duration: Duration(milliseconds: 3000),
//           ),
//         },
//       );
//     } else {
//       // Navigate to the onboarding screen
//       context.pushNamed(
//         'intro',
//         extra: <String, dynamic>{
//           kTransitionInfoKey: const TransitionInfo(
//             hasTransition: true,
//             transitionType: PageTransitionType.fade,
//             duration: Duration(milliseconds: 3000),
//           ),
//         },
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: const Color(0xFF183835),
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(0.0, 265.0, 0.0, 0.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(0.0),
//               child: Image.asset(
//                 'assets/images/Ghost_-_Logo.png',
//                 width: double.infinity,
//                 height: 265.0,
//                 fit: BoxFit.none,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//animations

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // Check if the onboarding has been completed
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _checkOnboardingStatus();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;

    if (isOnboardingCompleted) {
      // Navigate directly to the main page
      context.pushNamed(
        'MainPage',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 3000),
          ),
        },
      );
    } else {
      // Navigate to the onboarding screen
      context.pushNamed(
        'intro',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 1000),
          ),
        },
      );
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF183835),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 265.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Ghost_-_Logo.png',
                    width: double.infinity,
                    height: 265.0,
                    fit: BoxFit.none,
                  ),
                ),
              ),
              // Rotating loader animation
              const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 4.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
