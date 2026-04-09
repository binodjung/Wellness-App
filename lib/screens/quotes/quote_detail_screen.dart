import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class QuoteDetailScreen extends StatefulWidget {
  const QuoteDetailScreen({super.key});

  @override
  State<QuoteDetailScreen> createState() => _QuoteDetailScreenState();
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
        if (mounted) {
          setState(() {});
          _controller.setLooping(true);
          _controller.play();
        }
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
                : const Center(child: CircularProgressIndicator(color: Colors.white)),

            // Header row
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text("Motivation",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Row(
                      children: [
                        Text(
                          '${_currentIndex + 1}/${quotes.length}',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
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
              left: 24,
              right: 24,
              child: Column(
                children: [
                  Text(
                    quotes[_currentIndex]['quote']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 10, color: Colors.black)]),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '- ${quotes[_currentIndex]['author']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        shadows: [Shadow(blurRadius: 5, color: Colors.black)]),
                  ),
                ],
              ),
            ),

            // Bottom actions
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Icon(Icons.keyboard_arrow_up, size: 30, color: Colors.white),
                  const Text("Swipe up",
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildBottomAction(Icons.favorite_border, "Favorite"),
                      const SizedBox(width: 40),
                      _buildBottomAction(Icons.tag, "Topic"),
                      const SizedBox(width: 40),
                      _buildBottomAction(Icons.share_outlined, "Share"),
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

  Widget _buildBottomAction(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
