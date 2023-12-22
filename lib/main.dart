
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/pages/sign_in/sign_in.dart';
import 'package:shop_app_using_bloc/pages/welcome/welcome_bloc.dart';
import 'package:shop_app_using_bloc/pages/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white
            ),
            useMaterial3: true,
          ),
          home: const Welcome(),
          routes: {
            SignIn.route: (context) => const SignIn()
          },
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final counterBloc = BlocProvider.of<CounterBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('blocker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: BlocBuilder<CounterBloc, CounterState>(
//             builder: (context, state) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text(
//                     'You have pushed the button this many times:',
//                   ),
//                   Text(
//                     '${counterBloc.state.counter}',
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       OutlinedButton(
//                         onPressed: (){
//                           counterBloc.add(AddCounter());
//                         },
//                         child: const Icon(Icons.add),
//                       ),
//                       OutlinedButton(
//                           onPressed: (){
//                             counterBloc.add(RemoveCounter());
//                           },
//                         child: const Icon(Icons.remove),
//                       ),
//                     ],
//                   )
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
