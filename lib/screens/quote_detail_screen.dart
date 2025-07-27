import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class QuoteDetailScreen extends StatefulWidget {
  @override
  _QuoteDetailScreenState createState() => _QuoteDetailScreenState();
}

class _QuoteDetailScreenState extends State<QuoteDetailScreen> {
  final List<Map<String, String>> quotes = [
    {
      'videoUrl': 'https://www.example.com/video1.mp4',
      'quote': 'Success is not final, failure is not fatal: It is the courage to continue that counts.',
      'author': 'Winston Churchill',
    },
    {
      'videoUrl': 'https://www.example.com/video2.mp4',
      'quote': 'Push yourself, because no one else is going to do it for you.',
      'author': 'Unknown',
    },
  ];

  late VideoPlayerController _controller;
  bool _isMuted = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideo(_currentIndex);
  }

  void _initializeVideo(int index) {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(quotes[index]['videoUrl']!),
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  void _toggleVolume() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  void _onSwipeUp() {
    if (_currentIndex < quotes.length - 1) {
      _controller.pause();
      _controller.dispose();
      setState(() {
        _currentIndex++;
      });
      _initializeVideo(_currentIndex);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          _onSwipeUp();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Video background
            _controller.value.isInitialized
                ? SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
                : Center(child: CircularProgressIndicator()),

            // Header row
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    Text("Motivation",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Row(
                      children: [
                        Text(
                          '${_currentIndex + 1}/${quotes.length}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(
                            _isMuted ? Icons.volume_off : Icons.volume_up,
                            color: Colors.white,
                          ),
                          onPressed: _toggleVolume,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Quote + author (centered)
            Positioned(
              bottom: 160,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Text(
                    quotes[_currentIndex]['quote']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 8, color: Colors.black)]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- ${quotes[_currentIndex]['author']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        shadows: [Shadow(blurRadius: 5, color: Colors.black)]),
                  ),
                ],
              ),
            ),

            // Bottom actions
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Icon(Icons.keyboard_arrow_up, size: 30, color: Colors.white),
                  Text("Swipe up",
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {
                          // TODO: Handle favorite
                        },
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(Icons.tag, color: Colors.white),
                        onPressed: () {
                          // TODO: Handle tag
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
