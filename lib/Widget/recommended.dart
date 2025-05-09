import 'package:flutter/material.dart';
import 'package:movie/Model/movie_detail.dart';
import 'package:movie/Services/services.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key, required this.idMovie});
  final int idMovie;

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  late Future<List<MovieDetail>> recommended;

  @override
  void initState() {
    super.initState();
    recommended = APIServices().getRecommended(widget.idMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        FutureBuilder<List<MovieDetail>>(
          future: recommended,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading recommendations'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No recommendations available'));
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var movie in snapshot.data!)
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                            height: 100,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
