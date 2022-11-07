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
// class HomePage extends ConsumerWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text('Films')),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const FilterWidget(),
//           Consumer(builder: (context, ref, child){
//             final filter = ref.watch(favoriteStatusProvider);
//             switch(filter){
//               case FavoriteStatus.all :
//                 return FilmsList(provider: allFilmsProvider);
//               case FavoriteStatus.favorite :
//                 return FilmsList(provider: favoriteFilmsProvider);
//
//               case FavoriteStatus.notFavorite :
//                 return FilmsList(provider: nonFavoriteFilmsProvider);
//
//             }
//           })
//
//         ],
//       ),
//     );
//   }
// }
//
// class FilmsNotifier extends StateNotifier<List<Film>> {
//   FilmsNotifier() : super(allFilms);
//
//   void update(Film film, bool isFavorite) {
//     state = state
//         .map(
//           (thisFilm) =>
//       thisFilm.id == film.id
//           ? thisFilm.copy(isFavorite: isFavorite)
//           : thisFilm,
//     ).toList();
//   }
// }
//
// enum FavoriteStatus { all, favorite, notFavorite }
//
// // Status provider
// final favoriteStatusProvider =
// StateProvider<FavoriteStatus>((_) => FavoriteStatus.all);
// // All films provider
// final allFilmsProvider =
// StateNotifierProvider<FilmsNotifier, List<Film>>((_) => FilmsNotifier());
// // All favorite provider
// final favoriteFilmsProvider = Provider<Iterable<Film>>(
//       (ref) => ref.watch(allFilmsProvider).where((film) => film.isFavorite),
// );
// // All NON favorite provider
// final nonFavoriteFilmsProvider = Provider<Iterable<Film>>(
//       (ref) => ref.watch(allFilmsProvider).where((film) => !film.isFavorite),
// );
//
//
// class FilmsList extends ConsumerWidget {
//   final AlwaysAliveProviderBase<Iterable<Film>> provider;
//
//   const FilmsList({
//     required this.provider,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final films = ref.watch(provider);
//
//     return Expanded(
//       child: ListView.builder(
//         itemCount: films.length,
//         itemBuilder: (context, index) {
//           final film = films.elementAt(index);
//           final favoriteIcon = film.isFavorite
//               ? const Icon(Icons.favorite, color: Colors.red,)
//               : const Icon(Icons.favorite, color: Colors.black,);
//           return ListTile(
//             title: Text(film.title),
//             subtitle: Text(film.description),
//             trailing: IconButton(
//               icon: favoriteIcon,
//               onPressed: () {
//                 final isFavorite = !film.isFavorite;
//                 ref.read(allFilmsProvider.notifier).update(film, isFavorite);
//               },
//             ),
//
//           );
//         },
//       ),
//     );
//   }
// }
//
// class FilterWidget extends StatelessWidget {
//   const FilterWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//         builder: (context, ref, child) {
//       return DropdownButton(
//         value: ref.watch(favoriteStatusProvider),
//         items: FavoriteStatus.values.map((fs) =>
//         DropdownMenuItem(value: fs,child: Text(fs.toString().split('.').last,),),
//
//         ).toList(),
//         onChanged: ( FavoriteStatus? fs ) {
//         ref.read(favoriteStatusProvider.state).state = fs!;
//
//       },
//
//       );
//     });
//   }
// }
//
//
// @immutable
// class Film {
//   final String id;
//   final String title;
//   final String description;
//   final bool isFavorite;
//
//   const Film({required this.id,
//     required this.title,
//     required this.description,
//     required this.isFavorite});
//
//   Film copy({required bool isFavorite}) =>
//       Film(
//           id: id,
//           title: title,
//           description: description,
//           isFavorite: isFavorite);
//
//   @override
//   String toString() =>
//       "Film(id: $id, title: $title, description: $description,isFavorite: $isFavorite)";
//
//   @override
//   bool operator ==(covariant Film other) =>
//       id == other.id && isFavorite == other.isFavorite;
//
//   @override
//   int get hashCode => Object.hashAll([id, isFavorite]);
// }
//
// const allFilms = [
//   Film(
//       id: '1',
//       title: "The Shawshank Redemption",
//       description: "Description for the Shawshank Redemption",
//       isFavorite: false),
//   Film(
//       id: '2',
//       title: "The Godfather",
//       description: "Description for the Godfather",
//       isFavorite: false),
//   Film(
//       id: '3',
//       title: "The Godfather: Part II",
//       description: "Description for The Godfather: Part II",
//       isFavorite: false),
//   Film(
//       id: '4',
//       title: "The Dark Knight",
//       description: "Description for The Dark Knight",
//       isFavorite: false),
// ];