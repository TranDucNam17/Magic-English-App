import 'package:flutter/material.dart';
import '../widgets/onboarding_slide_content.dart';
import 'package:btlmagicenglish/features/auth/presentation/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  //dữ liệu cho các slide onboarding
  final List<Map<String, String>> _slideData = [
    {
      "image": "assets/images/onboarding_vocab.png",
      "title": "Build Your Vocabulary with AI",
      "description": "Easily save new words and let our AI enrich them with examples, definitions, and more."
    },
    {
      "image": "assets/images/onboarding_grammar.png",
      "title": "Perfect Your Grammar Instantly",
      "description": "Write with confidence as our AI assistant checks your text and suggets improvements in real-time."
    },
    {
      "image": "assets/images/onboarding_grammar.png",
      "title": "Practice with an AI Tutor",
      "description": "Chat, ask queston, and practice conversation anytime with your personal language assistant"
    }
  ];

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page){
    setState(() {
      _currentPage = page;
    });
  }

  //hàm điều hướng đến màn hình Login
  void _navigateToLogin(){
    //dùng pushReplacement để người dùng không thể nhấn "Back" quay lại màn Onboarding
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
  }

  void _onNextPressed(){
    if(_currentPage < _slideData.length - 1){
      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }else{
      //logic để chuyển sang màn hình Login/ Home
      _navigateToLogin();
    }
  }

  void _onSkipPressed(){
    //logic để bỏ qua và chuyển sang màn hình Login/ Home
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
              children: [
                //Skip Button
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: _onSkipPressed,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5, //chiếm nhiều không gian hơn
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: _slideData.length,
                    itemBuilder: (context, index){
                      return OnboardingSlideContent(
                        imagePath: _slideData[index]["image"]!,
                        title: _slideData[index]["title"]!,
                        description: _slideData[index]["description"]!,
                      );
                    },
                  ),
                ),
                //Indicator and Controls
                Expanded(
                    flex: 3, //chiếm ít không gian hơn
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Dot Indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                _slideData.length,
                                    (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                  height: 8,
                                  width: _currentPage == index ? 24 : 8,
                                  decoration: BoxDecoration(
                                    color: _currentPage == index ? Color(0xFF2E7D32) : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(height: 70,), //khoảng cách lớn trước nút
                          // Next/ Get Started Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _onNextPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF2E7D32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                _currentPage == _slideData.length - 1 ? "Get Started" : "Next",
                              ),
                            ),
                          ),
                          const SizedBox(height: 20), //khoảng cách giữa nút
                        ],
                      ),

                    )
                )
              ]
          )),
    );
  }
}
