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
// const names = [
//   'Nasibali Aka',
//   'Jamshid Aka',
//   'Muhammadjon',
//   'Abdulaziz',
//   'Akrom',
//   'Islam',
//   'Imomboy'
// ];
// final tickerProvider = StreamProvider((ref) => Stream.periodic(const Duration(seconds: 1), (x) => x + 1));
//
// final namesProvider = StreamProvider((ref) => ref.watch(tickerProvider.stream).map((event) => names.getRange(0, event)));
//
// class HomePage extends ConsumerWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final names = ref.watch(namesProvider);
//
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text('Stream Provider')),
//       body: names.when(
//         data: (names) {
//           return ListView.builder(
//               itemCount: names.length,
//
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(names.elementAt(index)),
//                 );
//               });
//         },
//         error: (error, stackTrace) => const Text("Reached the end of the list"),
//         loading: () => const Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }
//
//
//
//
//
