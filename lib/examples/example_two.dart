// /// For explaining nullable state
// // import 'package:flutter/material.dart';
// // import 'package:hooks_riverpod/hooks_riverpod.dart';
// //
// // void main() {
// //   runApp(const ProviderScope(child: MyApp()));
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Flutter Demo',
// //       darkTheme: ThemeData.dark(),
// //       themeMode: ThemeMode.dark,
// //       home: const HomePage(),
// //     );
// //   }
// // }
// //
// // extension OptionalInfixAddition<T extends num> on T? {
// //   T? operator +(T? other) {
// //     final shadow = this;
// //     if (shadow != null) {
// //       return shadow + (other ?? 0) as T;
// //     } else {
// //       return null;
// //     }
// //   }
// // }
// //
// // // Example
// // // void checkNumber(){
// // //   final int? a = null;
// // //   final int b = 1;
// // //   final result = a + b;
// // //   print(result);
// // //
// // // }
// // class CounterNotifier extends StateNotifier<int?> {
// //   CounterNotifier() : super(null);
// //
// //   void increment() => state = state == null ? state = 1 : state + 1;
// // }
// //
// // final countProvider = StateNotifierProvider<CounterNotifier, int?>((ref) {
// //   return CounterNotifier();
// // });
// //
// // class HomePage extends ConsumerWidget {
// //   const HomePage({
// //     Key? key,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     // checkNumber();
// //     return Scaffold(
// //         appBar: AppBar(
// //           centerTitle: true,
// //           title: Consumer(
// //             builder: (BuildContext context, WidgetRef ref, Widget? child) {
// //               final count = ref.watch(countProvider);
// //               final text = count ?? "press";
// //               return Text(
// //                 "$text",
// //                 style: Theme.of(context).textTheme.headline4,
// //               );
// //             },
// //           ),
// //         ),
// //         body: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             TextButton(
// //               onPressed: () => ref.read(countProvider.notifier).increment(),
// //               child: const Text("Increment"),
// //             )
// //           ],
// //         ));
// //   }
// // }
// /// For explaining aim of using StateNotifierProvider
// /// with more complex data
//
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       home: const HomePage(),
//     );
//   }
// }
//
// class CounterState {
//
//   CounterState({this.value = 0});
//   final int value;
//
//   CounterState copyWith({int? count}) {
//     return CounterState(
//         value: count ?? value
//     );
//   }
//
// }
//
// class CounterNotifier extends StateNotifier<CounterState?> {
//   CounterNotifier() : super(CounterState());
//
//   void increment() => state = state?.copyWith(count: state!.value + 1);
//   void decrement() => state = state?.copyWith(count: state!.value - 1);
// }
//
// final countProvider = StateNotifierProvider<CounterNotifier, CounterState?>((ref) {
//   return CounterNotifier();
// });
//
// class HomePage extends ConsumerWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // checkNumber();
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Consumer(
//             builder: (BuildContext context, WidgetRef ref, Widget? child) {
//               final count = ref.watch(countProvider);
//               final text = count!.value;
//               return Text(
//                 "$text",
//                 style: Theme.of(context).textTheme.headline4,
//               );
//             },
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextButton(
//               onPressed: () => ref.read(countProvider.notifier).increment(),
//               child: const Text("Increment"),
//             ),
//
//             TextButton(
//               onPressed: () => ref.read(countProvider.notifier).decrement(),
//               child: const Text("decrement"),
//             )
//           ],
//         ));
//   }
// }
