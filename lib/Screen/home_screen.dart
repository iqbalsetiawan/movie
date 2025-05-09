import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/Model/movie.dart';
import 'package:movie/Screen/details_screen.dart';
import 'package:movie/Services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> nowShowing;
  late Future<List<Movie>> upcoming;
  late Future<List<Movie>> popular;

  @override
  void initState() {
    super.initState();
    nowShowing = APIServices().getNowShowing();
    upcoming = APIServices().getUpcoming();
    popular = APIServices().getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
        actions: const [
          Icon(Icons.search_rounded),
          SizedBox(width: 20),
          Icon(Icons.notifications),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '   Now Showing',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: nowShowing,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final movies = snapshot.data!;
                  return CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: ((context, index, movieIndex) {
                      final movie = movies[index];
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen(
                                    movie: snapshot.data![index], idMovie: movie.idMovie);
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/original${movie.backdropPath}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 0,
                            right: 0,
                            child: Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.7,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                '   Upcoming Movies',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 250,
                child: FutureBuilder(
                  future: upcoming,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final movies = snapshot.data!;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Stack(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen(
                                    movie: snapshot.data![index], idMovie: movie.idMovie);
                              }));
                            },
                            child: Container(
                              width: 180,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/original${movie.backdropPath}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 0,
                            right: 0,
                            child: Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ]);
                      },
                      itemCount: movies.length,
                      scrollDirection: Axis.horizontal,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '   Popular Movies',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 250,
                child: FutureBuilder(
                  future: popular,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final movies = snapshot.data!;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Stack(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen(
                                    movie: snapshot.data![index], idMovie: movie.idMovie);
                              }));
                            },
                            child: Container(
                              width: 180,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/original${movie.backdropPath}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 0,
                            right: 0,
                            child: Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ]);
                      },
                      itemCount: movies.length,
                      scrollDirection: Axis.horizontal,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
