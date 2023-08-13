part of "data.dart";

class Data {
  static List<Map<String, dynamic>> sectionTitles = [
    {"Title": "Projects", "Icon": FontAwesomeIcons.boxOpen},
    {"Title": "Packages", "Icon": FontAwesomeIcons.lightbulb},
    {"Title": "Skills", "Icon": FontAwesomeIcons.laptopCode},
    {"Title": "About", "Icon": FontAwesomeIcons.info},
    {"Title": "Contact", "Icon": FontAwesomeIcons.message}
  ];

  static final List<SocialMedia> socialMediaLinks = [
    const SocialMedia(
        toolTip: "Check out my repositories on GitHub",
        name: FontAwesomeIcons.github,
        color: Colors.yellow,
        link: 'https://github.com/oyen-bright'),
    const SocialMedia(
        toolTip: "Check out my repositories on GitHub",
        name: FontAwesomeIcons.linkedin,
        color: Colors.blue,
        link: 'http://linkedin.com/in/kelvinatemiehart'),
    const SocialMedia(
        toolTip: "Check out my Instagram page",
        name: FontAwesomeIcons.instagram,
        color: Colors.purple,
        link: 'http://linkedin.com/in/kelvinatemiehart'),
    const SocialMedia(
        toolTip: "Check out my Twitter Feed",
        name: FontAwesomeIcons.twitter,
        color: Colors.blue,
        link: 'https://www.twitter.com/kelvin5hart'),
    const SocialMedia(
        toolTip: "Check out my Twitter Feed",
        name: FontAwesomeIcons.spotify,
        color: Colors.green,
        link:
            "https://open.spotify.com/playlist/7mlItAlgzjdXZty0KlNlr8?si=27f9f96ec6484415"),
    const SocialMedia(
        toolTip: "Check out my Twitter Feed",
        name: FontAwesomeIcons.soundcloud,
        color: Colors.green,
        link:
            "https://open.spotify.com/playlist/7mlItAlgzjdXZty0KlNlr8?si=27f9f96ec6484415"),
    const SocialMedia(
        toolTip: "Check out my Twitter Feed",
        name: FontAwesomeIcons.youtube,
        color: Colors.green,
        link:
            "https://open.spotify.com/playlist/7mlItAlgzjdXZty0KlNlr8?si=27f9f96ec6484415"),
  ];

  static Map headerData = {
    'title': '"I Am:',
    'background_image':
        "assets/background/PikPng.com_png-images-for-website_5782721.png",
    'subtitle': [
      'Oyeniyi Bright"',
      'A Mobile Developer"',
      'A Back-End Developer"',
    ],
    'background_animation_colors': {
      'primaryColors': const [
        Colors.pink,
        Colors.pinkAccent,
        Colors.white,
      ],
      'secondaryColors': const [
        Colors.white,
        Colors.blueAccent,
        Colors.blue,
      ],
    }
  };

  static Map footerData = {
    'title': "Lets Work together.",
    'socialMediaData': socialMediaLinks,
    'subtitle':
        "Whether you have an idea for a project or just want to chat, feel free to shoot me an email!",
    'copyWriteText': "© Brinnixs 2020"
  };

  static Map personalLink = {
    'email': 'oyeniyibright@gmail.com',
    'image': "assets/ppp2.png",
    'sportify_link':
        "https://drive.google.com/file/d/1fwOnI41i5c0fkR1xVUog-1Je8xp6kQ-Z/view?usp=drive_link"
  };

  static List<Projects> projects = [
    Projects(
        imageString: "assets/projects/Project2.png",
        projectName: "CinemaNinja",
        gitLink: "https://linktr.ee/cinemaninja",
        typeOfProject: "Open Source",
        projectDescription:
            "An app created with me, An app created with me An app created with me An app created with me"),
    Projects(
        imageString: "assets/projects/Project3.png",
        projectName: "Social Media App",
        gitLink: "https://github.com/kelvin5hart/day_5_in_100_days_of_flutter",
        typeOfProject: "Practice/Open Source",
        projectDescription: "An app created with me"),
    Projects(
        imageString: "assets/projects/Project4.png",
        projectName: "Workout App",
        gitLink: "https://github.com/kelvin5hart/day_6_in_100_days_of_flutter",
        typeOfProject: "Practice/Open Source",
        projectDescription: "An app created with me"),
    Projects(
        imageString: "assets/projects/Project5.png",
        projectName: "Travel Guide App",
        gitLink: "https://github.com/kelvin5hart/day_4_in_100_days_of_flutter",
        typeOfProject: "Practice/Open Source",
        projectDescription: "An app created with me"),
    Projects(
        imageString: "assets/projects/Project6.png",
        projectName: "Todo App",
        gitLink: "https://github.com/kelvin5hart/day_2_in_100_days_of_flutter",
        typeOfProject: "Practice/Open Source",
        projectDescription: "An app created with me"),
    Projects(
        imageString: "assets/projects/Project7.png",
        projectName: "NFT Collection App",
        gitLink: "https://github.com/kelvin5hart/day_1_in_100_days_of_flutter",
        typeOfProject: "Open Source",
        projectDescription: "An app created with me"),
    Projects(
        imageString: "assets/projects/Project8.png",
        projectName: "Health Care App",
        gitLink: "https://github.com/kelvin5hart/MedApp",
        typeOfProject: "Open Source",
        projectDescription: "An app created with me"),
    Projects(
        imageString: "assets/projects/Project9.png",
        projectName: "Workout App",
        gitLink: "https://github.com/kelvin5hart/my_workout",
        typeOfProject: "Open Source",
        projectDescription: "An app created with me"),
    // Projects(
    //     imageString: "assets/projects/Project10.png",
    //     projectName: "Smart Home App",
    //     typeOfProject: "Open Source",
    //     projectDescription: "An app created with me"),
  ];
  static List<String> helloLanguages = [
    "Bonjour",
    "გამარჯობა",
    "Hallo",
    "Γεια σας",
    "Sannu",
    "Aloha",
    "שלום",
    "Nyob zoo",
    "Szia",
    "Halló",
    "Ndewo",
    "Halo",
    "Ciao",
    "こんにちは",
    "ಹಲೋ",
    "Сәлеметсіз бе",
    "ສະບາຍດີ",
    "Muraho",
    "Moa oti",
    "안녕하세요",
    "Салам",
    "ສະບາຍດີ",
    "Sveiki",
    "Sveiki",
    "Wabula",
    "Здраво",
    "Manao ahoana",
    "Hai",
    "നമസ്കാരം",
    "你好",
    "Kia ora",
    "Yokwe",
    "Сайн байна уу",
    "Sawubona",
    "नमस्ते",
    "Hei",
    "Moni",
    "Akkam",
    "Cześć",
    "Olá",
    "ਸਤ ਸ੍ਰੀ ਅਕਾਲ",
    "Salut",
    "Здравствуйте",
    "Talofa",
    "Здраво",
    "Lumela",
    "Dumela",
    "Mhoro",
    "හෙලෝ",
    "Ahoj",
    "Živijo",
    "Salaam alaykum",
    "Hola",
    "Odi",
    "Habari",
    "Sawubona",
    "Hej",
    "Kamusta",
    "Ia ora na",
    "Салом",
    "வணக்கம்",
    "నమస్తే",
    "สวัสดี",
    "ሰላም",
    "Mālō e lelei",
    "Merhaba",
    "Salam",
    "Вітаю",
    "سلام",
    "Salom",
    "Xin chào",
    "Salam",
    "Molo",
    "Avuxeni",
    "Bawo ni",
    "Sawubona",
  ];

  static List<Packages> packages = [
    Packages(
        title: "sizedbox_extention",
        version: "0.0.2",
        body:
            "A Flutter package allows you to put empty space between widgets without using a Container or SizedBox widget.",
        url: "https://pub.dev/packages/sizedbox_extention"),
    Packages(
        title: "flutter_loading_appbar",
        version: "0.0.1",
        body:
            "A Flutter package for showing a linear progress indicator under the Appbar.",
        url: "https://pub.dev/packages/flutter_loading_appbar"),
    Packages(
        title: "flutter_numpad",
        version: "0.0.1",
        body: "A flutter Package for Numpad layout on screen.",
        url: "https://pub.dev/packages/flutter_numpad"),
  ];

  static List<Skills> skills = [
    Skills(
        imageString: "assets/logos/FlutterLogo.png",
        skillName: "Flutter",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/DartLogo.png",
        skillName: "Dart",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/FirebaseLogo.png",
        skillName: "Firebase",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/python-original.png",
        skillName: "python",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/django.png",
        skillName: "django",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/android-original-wordmark.png",
        skillName: "Android",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/swift-original.png",
        skillName: "Swift",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/java-original.png",
        skillName: "Java",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/javascript-original.png",
        skillName: "JavaScript",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/html5-original-wordmark.png",
        skillName: "HTML",
        yearsOfExperience: "2"),
    Skills(
        imageString: "assets/logos/css3-original-wordmark.png",
        skillName: "CSS",
        yearsOfExperience: "2"),
  ];
}
