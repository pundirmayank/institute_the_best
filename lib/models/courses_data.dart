import 'package:institute_the_best/models/course_model.dart';

 List<Course> courses = [
  Course(
    title: 'Core Java (J2SE): The Essential Programming Foundation',
    targetAudience: 'Absolute beginners, students starting programming, professionals needing a solid Java base.',
    courseGoal: 'Build a rock-solid understanding of fundamental Java programming concepts, enabling you to write efficient, object-oriented code.',
    description: 'Dive into the world of programming with Java SE (Standard Edition), the bedrock of millions of applications. This course is your essential first step, covering everything from basic syntax and data types to the core principles of Object-Oriented Programming (OOP). Master concepts like classes, objects, inheritance, polymorphism, exception handling, and the Collections Framework.',
    keyTopics: ['Java Basics', 'OOP Concepts', 'Data Types & Variables', 'Control Flow', 'Methods', 'Arrays', 'Collections Framework', 'Exception Handling', 'Basic I/O'],
    whyLearn: 'Essential for many tech roles, prerequisite for Android & advanced Java frameworks, develops strong programming logic.',
    duration:'3-4 Months'
  ),
  Course(
    title: 'Android App Development: Build Real-World Mobile Apps',
    targetAudience: 'Students with Core Java knowledge, aspiring mobile developers, programmers looking to enter the mobile market.',
    courseGoal: 'Equip you with the skills to design, develop, test, and deploy fully functional, native Android applications using industry-best practices.',
    description: 'Turn your app ideas into reality! Learn to build engaging and performant Android applications using Android Studio and the official SDK. This hands-on course covers UI/UX design principles with XML Layouts (or Jetpack Compose), managing app lifecycles (Activities & Fragments), handling user input, storing data locally (SQLite, Room), consuming web APIs, and preparing your app for the Google Play Store.',
    keyTopics: ['Android Studio & SDK', 'UI Design (Layouts/Compose)', 'Activities & Fragments', 'Intents & Navigation', 'Data Storage', 'Networking', 'Firebase Integration', 'Debugging & Testing'],
    whyLearn: 'High-demand skill, create apps for billions of users, build portfolio projects, freelance & job opportunities.',
    prerequisite: 'Solid understanding of Core Java (J2SE)',
      duration:'3-4 Months'
  ),
  Course(
    title: 'Python Programming: Master the Versatile Language',
    targetAudience: 'Beginners, data science aspirants, web developers, automation enthusiasts.',
    courseGoal: 'Gain proficiency in Python programming, from fundamentals to applying it in popular domains like web development or data analysis.',
    description: 'Discover the power and simplicity of Python. This comprehensive course starts from scratch, covering Python\'s clean syntax, data structures, OOP features, and extensive standard library. Get introduced to powerful third-party packages used in Data Science (NumPy/Pandas), Web Development (Flask/Django), and automation.',
    keyTopics: ['Python Syntax', 'Data Types', 'Control Flow', 'Functions & Modules', 'OOP', 'File Handling', 'Standard Library', 'Intro to Web/Data Libs'],
    whyLearn: 'Beginner-friendly, highly versatile, massive community support, essential for Data Science, AI, Web Dev, Automation.',
      duration:'3-4 Months'

  ),
  Course(
    title: 'Flutter Development: Build Beautiful Cross-Platform Apps',
    targetAudience: 'Aspiring mobile/web developers, designers interested in UI coding, cross-platform enthusiasts.',
    courseGoal: 'Learn to build high-performance, visually stunning native applications for iOS & Android from a single Dart codebase using Flutter.',
    description: 'Build beautiful, natively compiled applications faster than ever! This course teaches Dart and dives deep into Flutter. Master reactive UI, build complex layouts, manage state (Provider/Riverpod/BLoC), handle navigation, integrate with backends/Firebase, and achieve native performance.',
    keyTopics: ['Dart Language', 'Flutter Framework & Widgets', 'Layouts & UI', 'State Management', 'Navigation', 'Async Programming', 'Networking', 'Firebase', 'Building for iOS & Android'],
    whyLearn: 'Single codebase for iOS/Android, fast development, expressive UIs, excellent performance, growing job market.',
    prerequisite: 'Basic programming concepts helpful; OOP knowledge is a plus.',
      duration:'3-4 Months'

  ),
  Course(
    title: 'Graphics Designing Essentials: Create Compelling Visuals',
    targetAudience: 'Aspiring graphic designers, marketing professionals, content creators, entrepreneurs.',
    courseGoal: 'Understand core design principles and gain practical skills using industry-standard tools (e.g., Adobe Photoshop/Illustrator) to create impactful visuals.',
    description: 'Unleash your creativity! This course covers fundamental design principles: color theory, typography, layout, composition, and branding. Get hands-on experience with industry-leading software to create logos, brochures, social media posts, web graphics, and more. Develop your design eye and build a strong portfolio.',
    keyTopics: ['Design Principles', 'Color Theory', 'Typography', 'Layout & Composition', 'Logo Design', 'Raster Editing (Photoshop)', 'Vector Graphics (Illustrator)', 'Designing for Print vs. Web', 'Portfolio Development'],
    whyLearn: 'Create professional marketing materials, enhance brand identity, freelance opportunities, essential skill in marketing/content creation.',
      duration:'3-4 Months'

  ),
  Course(
    title: 'Mastering Computer Basics (Grades 5th - 10th)',
    targetAudience: 'Students (Grades 5-10) seeking essential digital literacy and foundational computer knowledge.',
    courseGoal: 'Equip students with a clear understanding of computer concepts and practical skills for academic success and digital navigation.',
    description: 'Build a solid foundation in how computers work. Learn about hardware, software, operating systems (Windows), and master practical tools like Microsoft Office (Word, PowerPoint, Excel). Focus on safe internet usage, basic troubleshooting, and organizing digital information.',
    keyTopics: ['Intro to Computers', 'OS Fundamentals (Windows)', 'MS Word', 'MS PowerPoint', 'MS Excel (Basics)', 'Internet Basics', 'Digital Safety'],
    whyLearn: 'Builds essential digital literacy, improves schoolwork efficiency, fosters safe online habits, prepares for future tech demands.',
      duration:'3-4 Months'

  ),
  Course(
    title: 'Excel in Mathematics (Grades 5th - 10th)',
    targetAudience: 'Students (Grades 5-10) aiming to strengthen mathematical understanding, improve grades, and build confidence.',
    courseGoal: 'Develop deep conceptual understanding, enhance logical reasoning and problem-solving skills, eliminate math anxiety, and ensure academic success.',
    description: 'Make math understandable and engaging! We focus on building concepts from basics, ensuring clarity. Our instructors simplify ideas, provide ample practice, and focus on *how* to approach problems. Aligned with school syllabus (CBSE/ICSE/State Board - specify), we cover key areas thoroughly.',
    keyTopics: ['Number Systems', 'Fractions/Decimals/Percentages', 'Algebra', 'Geometry', 'Mensuration', 'Data Handling', 'Trigonometry (Higher Grades)', 'Coordinate Geometry (Higher Grades)'],
    whyLearn: 'Builds strong conceptual clarity, improves school grades, develops critical thinking, reduces math phobia, aligns with curriculum.',
      duration:'10 Months'

  ),
];
