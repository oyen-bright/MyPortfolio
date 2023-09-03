import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.theme.textTheme.bodyLarge,
        children: const [
          TextSpan(
            text: "Welcome to my portfolio website!\n\n",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "I'm ",
          ),
          TextSpan(
            text: "Your Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Customize the color
            ),
          ),
          TextSpan(
            text:
                ", a passionate Flutter Developer with a keen interest in front-end technologies, mobile app development, and continuous learning. With a strong foundation in Flutter and an ongoing journey into Vue.js and Python, I'm dedicated to crafting user-centric experiences that seamlessly blend functionality with aesthetics.\n\n",
          ),
          TextSpan(
            text:
                "My journey in software development began with a fascination for creating elegant and responsive user interfaces. As a result, I ventured into Flutter, a framework that empowers me to transform design ideas into interactive and cross-platform applications. Through hands-on projects and a commitment to staying updated with the latest industry trends, I've honed my skills in creating delightful mobile experiences.\n\n",
          ),
          TextSpan(
            text:
                "In addition to my technical skills, I believe in the power of collaboration and effective communication. Working in diverse teams has not only broadened my perspective but also enhanced my ability to translate complex ideas into accessible concepts. I thrive on challenges, and I'm excited to tackle new problems and contribute innovative solutions.\n\n",
          ),
          TextSpan(
            text:
                "This portfolio showcases a collection of projects that highlight my expertise in Flutter, along with my ongoing exploration of Vue.js and Python. Each project reflects my dedication to clean code, attention to detail, and a passion for pushing the boundaries of what's possible in mobile development.\n\n",
          ),
          TextSpan(
            text:
                "Thank you for visiting my portfolio, and I invite you to explore my work. Feel free to connect with me to discuss potential collaborations, exchange ideas, or simply share your thoughts. Let's create something remarkable together!\n\n",
          ),
          TextSpan(
            text: "Warm regards,\n",
          ),
          TextSpan(
            text: "Your Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
