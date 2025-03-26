import 'package:flutter/material.dart';

class NewsMarquee extends StatefulWidget {
  final List<String> newsList;

  const NewsMarquee({super.key, required this.newsList});

  @override
  State<NewsMarquee> createState() => _NewsMarqueeState();
}

class _NewsMarqueeState extends State<NewsMarquee>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late double _position;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _position = 0;
    _startScrolling();
  }

  void _startScrolling() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 30));
      if (_scrollController.hasClients) {
        _position += 1;
        if (_position >= _scrollController.position.maxScrollExtent) {
          _position = 0;
        }
        _scrollController.jumpTo(_position);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.blue.shade900,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.newsList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const Icon(Icons.campaign, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                widget.newsList[index],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 50),
            ],
          );
        },
      ),
    );
  }
}
