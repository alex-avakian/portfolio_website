import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import font_awesome_flutter package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // Changed to StatelessWidget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Website',
      theme: ThemeData( 
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 24.0, fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontSize: 18.0, fontFamily: 'Roboto'),
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 24.0, fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontSize: 18.0, fontFamily: 'Roboto'),
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark, // Set dark mode as default
      home: const HomePage(), // Removed onToggleTheme 
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Removed onToggleTheme

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _hoveredIndex = -1;
  int _selectedIndex = -1; // Add for selected index
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _getInTouchKey = GlobalKey(); // Add a key for Contact Information

  // Define icon colors
  final Color mainSectionIconColor = Colors.white;
  final Color contactInfoIconColor = Colors.white;

  // Define the off-white color for the boxes
  final Color boxBackgroundColor = const Color.fromARGB(255, 224, 224, 224)!; // Dark white

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 56,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavItem('', 0, _scrollToTop, Icons.home),
            const SizedBox(width: 30),
            _buildNavItem('About', 1, _scrollToAboutMe),
            const SizedBox(width: 30),
            _buildNavItem('Education', 2, _scrollToEducation),
            const SizedBox(width: 30),
            _buildNavItem('Projects', 3, _scrollToProjects),
            const SizedBox(width: 30),
            _buildNavItem('Skills', 4, _scrollToSkills),
            const SizedBox(width: 30),
            _buildNavItem('Contact Information', 5, _scrollToGetInTouch), // Add navigation to Contact Information
          ],
        ),
        centerTitle: true,
        actions: [
          // Removed Dark/Light Mode button
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double availableHeight = constraints.maxHeight - kToolbarHeight;

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  height: availableHeight,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('assets/background_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Alex Sasoon Avakian',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Graduate Student',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 130),
                            Text(
                              'Aerospace/System Engineering Portfolio',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Aerospace Engineering | Systems Engineering | Program Management',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            // Copied Contact Icons to Main Section (using mainSectionIconColor)
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialIcon(Icons.description, 'https://drive.google.com/file/d/1lVtsfuYTCQGX7-xdgjADoHJ0LP2TZ-q1/view?usp=drive_link', mainSectionIconColor), // Document Icon
                                const SizedBox(width: 20),
                                _buildSocialIcon(Icons.email, 'mailto:alexavakian01@gmail.com', mainSectionIconColor),
                                const SizedBox(width: 20),
                                _buildSocialIcon(Icons.message, 'sms:+18182399033', mainSectionIconColor), // Text Message Icon
                                const SizedBox(width: 20),
                                _buildSocialIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/alex-avakian', mainSectionIconColor), // LinkedIn with FontAwesome
                              ],
                            ), 
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Text(
                          'Taken from the NASA Images and Video Library',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white70, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  key: _aboutMeKey,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: boxBackgroundColor, // Use the off-white color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'About Me',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Colors.amber[800], fontSize: 28),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.1,
                            backgroundImage: const AssetImage(
                                'assets/profile_picture.jpg'),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Column( // Aligned texts under title
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'I am Alex Avakian, an aerospace engineer with a passion for designing, analyzing, and optimizing aircraft and spacecraft systems. My academic journey includes a BTech and MEng in Aerospace Engineering, where I gained a solid foundation in aerodynamics, propulsion, avionics, and structural mechanics.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey[700]),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Throughout my career, I have worked on several key projects that demonstrate my expertise and dedication to the field. My goal is to contribute to advancements in aerospace technology, pushing the boundaries of what is possible in aviation and space exploration.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey[700]),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Current Goals',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.amber[800],
                                    ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '- Complete Masters Degree in Systems Engineering',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey[700]),
                                  ),
                                  Text(
                                    '- Earn PMP license',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey[700]),
                                  ),
                                  Text(
                                    '- Earn Agile certification',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  key: _educationKey,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: boxBackgroundColor, // Use the off-white color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Education',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Colors.amber[800], fontSize: 28),
                      ),
                      const SizedBox(height: 20),
                      _buildEducationItem(
                        'assets/school_logo1.jpg',
                        'California State Polytechnic University, Pomona',
                        'Bachelors of Science - Aerospace Engineering \n2017 - 2023\nGPA: 3.2',
                        [
                          'Technical Courses:', 
                          'Advanced Aerodynamics',
                          'Flight Mechanics',
                          'Propulsion Systems',
                          'Aircraft Structures',
                          '\nSystems Related Courses:',
                          'Fundamentals of System Engineering',
                          'Program Management', 
                          'Model Based System Architecture'
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildEducationItem(
                        'assets/school_logo2.jpg',
                        'California State Polytechnic University, Pomona',
                        'Masters of Science - Systems Engineering\n2023 - 2025\nGPA: 4.0',
                        [
                          'Spacecraft Design',
                          'Orbital Mechanics',
                          'Avionics',
                          'Computational Fluid Dynamics'
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  key: _projectsKey,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: boxBackgroundColor, // Use the off-white color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Projects',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Colors.amber[800], fontSize: 28),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildProjectBox('assets/project1.jpg', 'SciNAP: Science and Network Access Platform', 'https://drive.google.com/drive/folders/1KEWp_wwPiVi3esawHfHRjir7Vwp1mYWH?usp=drive_link', textAlign: TextAlign.center), // Added textAlign
                          _buildProjectBox('assets/project2.jpg', 'SysML - Falcon 9 Case Study', 'https://drive.google.com/drive/folders/1_o3YHjSwLn1hPQx8gG2c6jCgMSCcxz7a?usp=drive_link', textAlign: TextAlign.center), // Added textAlign
                          _buildProjectBox('assets/project3.jpg', 'Singularity 2021 - 2022', 'https://drive.google.com/drive/folders/1BhO1MYspJKonmiuvp6OFggDxQ7QH2Qaz?usp=drive_link'), 
                          _buildProjectBox('assets/project4.jpg', 'Singularity 2020 - 2021', 'https://drive.google.com/drive/folders/1n8cKeEhJ0Ghrlh7cmq2rCHlnoSiy-R9H?usp=drive_link'), 
                        ],
                      ),
                    ],
                  ),
                ),
                // Skills Section
                Container(
                  key: _skillsKey,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: boxBackgroundColor, // Use the off-white color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Center( // Center "Skills" title
                        child: Text(
                          'Skills',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: Colors.amber[800], fontSize: 28),
                        ),
                      ),
                      const SizedBox(height: 10), 
                      const Text('Software Proficiencies',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• MAGIC SYSTEMS OF SYSTEMS ARCHITECTURE',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• GENESYS', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• ARENA SIMULATION SOFTWARE',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• VENSIM', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• GEPHI', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• LOGIX PRO 500 PLC SIMULATOR',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('Programming Languages',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• JAVA', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• MATLAB', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('• C++', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                // Contact Information Section
                Container(
                  key: _getInTouchKey,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300, width: 2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: [
                      Text(
                        'Contact Information',
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Feel free to contact me, I\'d love to hear from you.', 
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 20),
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Removed Resume Icon
                          const SizedBox(width: 20),
                          _buildSocialIcon(Icons.email, 'mailto:alexavakian01@gmail.com', contactInfoIconColor),
                          const SizedBox(width: 20),
                          _buildSocialIcon(Icons.message, 'sms:+18182399033', contactInfoIconColor), // Text Message Icon
                          const SizedBox(width: 20),
                          _buildSocialIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/alex-avakian', contactInfoIconColor), // LinkedIn with FontAwesome
                          // Removed Indeed
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(String text, int index, VoidCallback? onTap,
      [IconData? icon]) {
    return MouseRegion( // Wrap with MouseRegion for hover effects
      onEnter: (_) {
        setState(() {
          _hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredIndex = -1;
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index; // Update selected index on tap
          });
          onTap?.call();

          // Reset the selected index after a short delay
          Future.delayed(const Duration(milliseconds: 160), () {
            setState(() {
              _selectedIndex = -1; 
            });
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: _hoveredIndex == index || _selectedIndex == index // Highlight if hovered or selected
                  ? Colors.white
                  : Colors.transparent, 
              width: 2,
            ),
            color: _selectedIndex == index ? Colors.white : Colors.transparent, // Fill color when selected
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: _selectedIndex == index ? Colors.black : Colors.white), // Icon color based on selection
                if (text.isNotEmpty) const SizedBox(width: 5),
              ],
              if (text.isNotEmpty)
                Text(
                  text,
                  style: TextStyle(
                    color: _selectedIndex == index ? Colors.black : Colors.white, // Text color based on selection
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build social icons
  Widget _buildSocialIcon(IconData icon, String link, [Color iconColor = Colors.amber]) { 
    return IconButton(
      iconSize: 48,
      onPressed: () async {
        if (link.startsWith('www.')) { 
          link = 'https://$link'; 
        }
        final Uri url = Uri.parse(link);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          print('Could not launch $link'); 
        }
      },
      icon: FaIcon(icon, color: iconColor), 
    );
  }

  void _onHover(int index) {
    setState(() {
      _hoveredIndex = index;
    });
  }

  void _scrollToAboutMe() {
    _scrollToWidget(_aboutMeKey);
  }

  void _scrollToEducation() {
    _scrollToWidget(_educationKey);
  }

  void _scrollToProjects() {
    _scrollToWidget(_projectsKey);
  }

  void _scrollToSkills() {
    _scrollToWidget(_skillsKey);
  }

  void _scrollToGetInTouch() { 
    _scrollToWidget(_getInTouchKey);
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToWidget(GlobalKey key) {
    final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero, ancestor: context.findRenderObject());

      // Calculate the maximum scroll extent
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      // Calculate the target scroll position
      double targetPosition = offset.dy + _scrollController.offset - kToolbarHeight;

      // Adjust the target position if it exceeds the maximum scroll extent
      if (targetPosition > maxScrollExtent) {
        targetPosition = maxScrollExtent;
      }

      _scrollController.animateTo(
        targetPosition,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildEducationItem(String logoAsset, String schoolName,
      String details, List<String> coursework) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            logoAsset,
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schoolName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.amber[800]),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey[700]),
                ),
                const SizedBox(height: 10),
                // Create two columns for coursework
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Technical Courses column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: coursework
                                .sublist(0, 4) // Take the first 4 items (Corrected the range)
                                .map((course) => Text(
                                      '• $course',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.grey[700]),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Systems Related Courses column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: coursework
                                .sublist(4) // Take items from index 4 onwards
                                .map((course) => Text(
                                      '• $course',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.grey[700]),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectBox(String imageAsset, String title, String link, {TextAlign textAlign = TextAlign.left}) { // Added textAlign parameter
    return MouseRegion(
      onEnter: (_) => setState(() {
        _hoveredIndex = title.hashCode; // Use title for hover index
      }),
      onExit: (_) => setState(() {
        _hoveredIndex = -1;
      }),
      child: GestureDetector( 
        onTap: () async {
          if (link.isNotEmpty) {
            final Uri url = Uri.parse(link);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              print('Could not launch $url'); 
            }
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: _hoveredIndex == title.hashCode
                    ? Colors.white.withOpacity(0.8) // Changed highlight color to white
                    : Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center( 
            child: AnimatedOpacity(
              opacity: _hoveredIndex == title.hashCode ? 1.0 : 0.0, 
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7), 
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: Text(
                  title,
                  textAlign: textAlign, // Use the textAlign parameter
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Removed the _buildSkillItem widget
}