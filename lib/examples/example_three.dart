// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }
//
// enum City {
//   stockholm,
//   paris,
//   tokyo,
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
// // typedef WeatherEmoji = String;
// const unKnownWeatherEmoji = '🤷';
//
// Future<String> getWeather(City city) {
//   return Future.delayed(
//       const Duration(seconds: 1),
//       () => {
//             City.paris: '💨',
//             City.stockholm: '🌤 ',
//             City.tokyo: '❄',
//           }[city]!);
// }
//
// // UI writes to this and reads from this
// final currentCityProvider = StateProvider<City?>((ref) => null);
//
// // UI reads this
// final weatherProvider = FutureProvider<String>((ref) {
//   final city = ref.watch(currentCityProvider);
//   if (city != null) {
//     return getWeather(city);
//   } else {
//     return unKnownWeatherEmoji;
//   }
// });
//
// class HomePage extends ConsumerWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentWeather = ref.watch(weatherProvider);
//
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text('Weather')),
//       body: Column(
//         children: [
//           currentWeather.when(
//             data: (data) => Text(
//               data,
//               style: const TextStyle(fontSize: 40),
//             ),
//             error: (_, __) => const Text('Error '),
//             loading: () =>const Padding(
//               padding:  EdgeInsets.all(8.0),
//               child:  CircularProgressIndicator(),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: City.values.length,
//                 itemBuilder: (context, index) {
//                   final city = City.values[index];
//                   final bool isSelected = city == ref.watch(currentCityProvider);
//                   return ListTile(
//                     title: Text(city.toString()),
//                     trailing: isSelected ? const Icon(Icons.check) : null,
//                     onTap: () =>
//                         ref.read(currentCityProvider.notifier).state = city,
//                   );
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }
