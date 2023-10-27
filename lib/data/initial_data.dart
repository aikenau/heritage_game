import 'package:heritage_game/models/site.dart';
import 'package:heritage_game/models/game_card.dart';
import 'package:heritage_game/models/paragraph.dart';
import 'package:heritage_game/models/viewpoint.dart';
import 'package:heritage_game/models/mc_questions.dart';

////////////////////////
///
/// SITE
/// -----
/// No suppose to edit
///
////////////////////////

final sites = [
  Site(
    name: 'Mill',
    bubbleImage: 'assets/images/menu/the_mill.jpg',
    viewpoints: [
      Viewpoint(
          identifier: '4/F Exhibition Space',
          description: mill4FExhibitionSpaceParagraph),
      Viewpoint(
          identifier: '3/F Cotton Processing Room',
          description: mill3FCottonProcessingRoomParagraph),
      Viewpoint(
          identifier: '2/F Weaving Shed',
          description: mill2FWeavingShedParagraph),
      Viewpoint(
          identifier: '1/F Mule Room', description: mill1FMuleRoomParagraph),
      Viewpoint(
          identifier: 'Chamber & Power',
          description: millUGChamberPowerParagraph),
    ],
    location: {'latitude': 53.34384, 'longitude': -2.25007},
  ),
  Site(
    name: 'Quarry Bank House',
    bubbleImage: 'assets/images/menu/greg_house.jpg',
    viewpoints: [
      Viewpoint(identifier: 'Samuel Greg', description: qbhSamuelParagraph),
      Viewpoint(identifier: 'Hannah Greg', description: qbhHannahParagraph),
      Viewpoint(identifier: 'The Garden', description: qbhGardenParagraph),
    ],
    location: {'latitude': 53.344208, 'longitude': -2.249886},
  ),
  Site(
    name: 'Apprentice House',
    bubbleImage: 'assets/images/menu/apprentice_house.jpg',
    viewpoints: [
      Viewpoint(identifier: 'Garden', description: ahGardenParagraph),
      Viewpoint(identifier: 'Dining', description: ahDinningParagraph),
      Viewpoint(identifier: 'Room', description: ahSleepingParagraph),
      Viewpoint(identifier: 'Classroom', description: ahClassroomParagraph),
    ],
    location: {'latitude': 53.345489, 'longitude': -2.246736},
  ),
  Site(
    name: 'Village and Church',
    bubbleImage: 'assets/images/menu/styal_village.jpg',
    viewpoints: [
      Viewpoint(identifier: 'Village Shop', description: vcShopParagraph),
      Viewpoint(identifier: 'Styal Village', description: vcVillageParagraph),
      Viewpoint(identifier: 'Church', description: vcChurchParagraph),
    ],
    location: {'latitude': 53.3483248, 'longitude': -2.249166},
  ),
];

////////////////////////
///
/// PARAGRAPH
/// ---------
///
////////////////////////

//////// MILL

final mill4FExhibitionSpaceParagraph = [
  Paragraph(
    content:
        'During the Industrial Revolution, working conditions in mills were notoriously poor, with child labor and long hours being common practices. At Quarry Bank, however, Samuel Greg understood the importance of his workers\' health, recognizing that his machinery operations relied on their manual labor. ',
    gameCard: cardCollection[0],
  ),
  const Paragraph(
    content:
        'To emphasize his concern and ensure a healthy workforce, he hired Peter Holland as the factory\'s official physician - an unprecedented move for the time. This proactive approach not only set Quarry Bank apart from other mills but also maintained smooth operations and demonstrated Samuel\'s dedication to his workers\' well-being.',
    imagePath: 'assets/images/detail/exhibition_space.jpeg',
  ),
];

final mill3FCottonProcessingRoomParagraph = [
  const Paragraph(
    content:
        'Step into the Cotton Processing Room to witness the awe-inspiring transformation of raw cotton into refined fabric. As workers carefully clean and refine the cotton using a variety of machinery, you\'ll hear the relentless cacophony of the machines, see the impressive multitasking of workers on six ring spinning frames, and witness the beamer machine coil up to 3000 yards of polished thread. ',
  ),
  const Paragraph(
    content:
        'However, it\'s important to note that the process also results in thick dust clouds, which can pose inhalation hazards. Despite this, the processed cotton from this room remains essential in forming the fabric\'s widthways threads. Don\'t miss the chance to observe the intricacies of this fascinating process, but remember to take precautions to protect your health.',
    imagePath: 'assets/images/detail/cotton_processing.jpeg',
  ),
];

final mill2FWeavingShedParagraph = [
  Paragraph(
    content:
        'The Weaving Shed at Quarry Bank is a must-see destination for anyone interested in the history of cotton fabric production. Dominated by power looms, these machines have been crucial to the manufacturing process since 1834, weaving the lengthways (warp) and widthways (weft) threads. Following the passing of Samuel Greg, his son Robert introduced advanced machinery that required each worker to manage four looms. ',
    gameCard: cardCollection[4],
  ),
  const Paragraph(
    content:
        'You are immediately immersed in the sound of the looms, creating a chance to reflect on the harsh working conditions and imagine the young children who once worked there. Additionally, you can appreciate the skill of the professionals who operated the looms, handling up to a thousand threads per hour. The looms’ power source, a vertical shaft driven by a waterwheel, is an engineering marvel that adds to the experience.',
    imagePath: 'assets/images/detail/weaving_shed.gif',
  ),
];

final mill1FMuleRoomParagraph = [
  const Paragraph(
    content:
        'Samuel Greg launched Quarry Bank in 1784, introducing innovative machines to spin cotton, including the mule. On this floor, workers manually processed hefty bales of raw cotton with a range of devices to purify and align the fibers, converting them into yarn. ',
  ),
  const Paragraph(
    content:
        'Today, you can experience different stations that depict the roles of scutchers, carders, and can tenters, engage with operators to learn about the machinery functions and the mill\'s hazards, witness areas where young scavengers risked their safety to remove cotton debris, and be awed by the mule machine\'s ability to produce vast lengths of yarn quickly.',
    imagePath: 'assets/images/detail/machine.jpeg',
  ),
];

final millUGChamberPowerParagraph = [
  const Paragraph(
    content:
        'The essence of the Industrial Revolution is exemplified at Quarry Bank Mill, where natural energy and pioneering engineering converged. Though water wheels provided the primary force initially, the introduction of steam engines, especially James Watt’s innovative models, added reliability and efficiency to the mill’s operations.',
  ),
  const Paragraph(
    content:
        'These machines played a pivotal role in bolstering productivity but required human expertise for optimal function. That’s where the Steam Team came in—a dedicated group of mechanics, engineers, and apprentices who ensured the smooth operation of the mill. Together, the harmony of man, machine, and nature exemplified the power and progress of Quarry Bank Mill.',
    imagePath: 'assets/images/detail/power_engine.gif',
  ),
];

//////// QUARRY BANK HOUSE

final qbhSamuelParagraph = [
  const Paragraph(
    content:
        'Samuel Greg was born in Belfast in 1758 and raised by his successful merchant uncle, Robert Hyde, in Manchester. Under the Hydes, Greg gained valuable insights into the textile trade and became an expert in importing linen yarn and converting it into high-quality cloth. After receiving a comprehensive education and traveling extensively throughout Europe, Greg quickly rose through the business ranks. ',
  ),
  const Paragraph(
    content:
        'At the age of 26, he inherited a substantial fortune and acquired the family business, making him one of Manchester\’s leading merchant-manufacturers. Recognizing the potential of Richard Arkwright’s waterframe, Greg established the Mill at Styal in 1784, ushering in a new era of water-powered cotton spinning.',
    imagePath: 'assets/images/detail/greg_floor_plan.jpeg',
  ),
];

final qbhHannahParagraph = [
  Paragraph(
    content:
        'Hannah Lightbody, daughter of a prosperous Liverpool merchant, married Samuel Greg in 1789, uniting intellect and influence. Not only did this alliance bring a significant dowry, but also pivotal business networks via Hannah’s connections with eminent Unitarian trading and banking families. With her liberal Unitarian upbringing emphasizing humanitarianism and progressive thought, Hannah played a crucial role in shaping the character of the Styal community. ',
    gameCard: cardCollection[5],
  ),
  const Paragraph(
    content:
        'Under her guidance, Quarry Bank Mill emerged as a compassionate iteration of the factory system. Throughout their 39 years of matrimony, Hannah stood as a pivotal force, bearing thirteen children and fortifying the Greg legacy in the industrial realm.',
    imagePath: 'assets/images/detail/greg_drawing.jpeg',
  ),
];

final qbhGardenParagraph = [
  Paragraph(
    content:
        'The Greg family\’s generations of cultivation have masterfully integrated the natural contours of the river valley in the Quarry Bank House garden. Samuel and Hannah Greg sourced plants from local nurseries in the 19th century to initiate its creation. The house\’s clever design offers serene views that cleverly conceal the adjacent Mill, but from the garden\’s pathways, the Mill becomes a picturesque backdrop. Robert Hyde Greg\’s enhancements in the 1860s introduced rhododendrons and ornamental accents, enriching the garden\’s beauty.',
    imagePath: 'assets/images/detail/greg_house.jpeg',
    gameCard: cardCollection[1],
  ),
];

//////// APPRENTICE HOUSE

final ahGardenParagraph = [
  Paragraph(
    content:
        'The garden at the Apprentice House in Styal served as a vital source of fresh food for its residents. Today, this garden has been meticulously restored and serves as a tribute to the agricultural practices of the past. It features an apple orchard and a vegetable patch where traditional varieties of fruits and vegetables are cultivated, highlighting the self-sustaining methods that were once commonplace.',
    imagePath: 'assets/images/detail/app_house.jpeg',
    gameCard: cardCollection[2],
  ),
];

final ahDinningParagraph = [
  const Paragraph(
      content:
          'The Gregs understood that nourished and healthy children would be more efficient. Therefore, their approach prioritized the welfare of the apprentices while also guaranteeing that they received nutritious meals from the garden.',
      imagePath: 'assets/images/detail/dinning.jpeg'),
];

final ahSleepingParagraph = [
  const Paragraph(
    content:
        'The Apprentice House was built to house the apprentices who mainly arrived from far-off workhouses. Gender-specific sleeping arrangements were made due to the majority of the occupants being girls, who were considered more manageable, and thus were provided with a large dormitory. On the other hand, the boys were assigned three smaller rooms. ',
  ),
  const Paragraph(
    content:
        'The supervision of these arrangements was entrusted to superintendents like George and Elizabeth Shawcross. The sleeping arrangements were a reflection of the gender norms and management strategies of that era.',
    imagePath: 'assets/images/detail/sleeping_room.jpeg',
  ),
];

final ahClassroomParagraph = [
  Paragraph(
    content:
        'Hannah Greg played a crucial role in making education an integral part of life in the Apprentice House. Despite limited literacy levels among many apprentices, evidence suggests that they received some form of education. Records from the 1820s reveal payments made to teachers and even \‘singing masters\’ in the wage books.',
    gameCard: cardCollection[6],
  ),
  const Paragraph(
    content:
        'Moreover, the Greg family took a hands-on approach to education, with the daughters teaching the girls and the sons instructing the boys. Overall, education was a significant priority for the Gregs, and they ensured that the apprentices received a well-rounded education during their time in the Apprentice House.',
    imagePath: 'assets/images/detail/classroom.jpeg',
  ),
];

//////// VILLAGE & CHURCH

final vcShopParagraph = [
  Paragraph(
    content:
        'Dating back to the 1820s, the village shop played a critical role in the socioeconomic fabric of Styal by providing essential groceries and household items. Its diverse inventory included everything from fresh butter churned in the Apprentice House to offal sourced from Oak Farm. Unlike many other mill shops of the era, the Styal shop did not engage in food adulteration. ',
    gameCard: cardCollection[3],
  ),
  const Paragraph(
    content:
        'Records of the shop reveal valuable insights into the economic ups and downs experienced by villagers, as evidenced by fluctuations in purchasing patterns in response to changes in wages. Thanks to its cooperative model, the shop’s profits were shared among the community, bringing tangible benefits until its eventual closure in the 1960s.',
    imagePath: 'assets/images/detail/shop.jpg',
  ),
];

final vcVillageParagraph = [
  Paragraph(
    content:
        'Once an ancient woodland and a part of the Earl of Stamford and Warrington\’s estate, Styal transformed into a thriving agricultural community that integrated textiles into its local economy. Samuel Greg, the founder of the Mill, recognised the need for accommodating workers from further distances, leading to the village\’s significant expansion. ',
    gameCard: cardCollection[7],
  ),
  const Paragraph(
    content:
        'Greg’s provision of housing, such as the Oak Cottages, complete with private facilities and allotments, substantially improved the quality of life compared to the crowded towns.',
    imagePath: 'assets/images/detail/styal_village.jpeg',
  ),
];

final vcChurchParagraph = [
  const Paragraph(
    content:
        'The residents of Styal were deeply influenced by religion, with a particular emphasis on the importance of adherence to the 1802 Health and Morals of Apprentices Act. Samuel Greg was committed to providing child workers with religious education, even sending them on ten-mile walks to attend services at the Anglican parish church in Wilmslow. ',
    imagePath: 'assets/images/detail/church.jpeg',
  ),
  const Paragraph(
    content:
        'In addition to Anglicanism, Nonconformism played a significant role in the community, reflecting the beliefs of Hannah Greg, who came from a prominent Unitarian family. As evidence of this influence, by 1822, the village had constructed its Unitarian chapel.',
  ),
];

////////////////////////
///
/// Game Card Organization
/// -----------------------
///
/// ////////////////////

final idenitifer = [
  'Mill',
  'Quarry Bank House',
  'Apprentice House',
  'Village and Church',
  'quiz_mill',
  'quiz_qbHouse',
  'quiz_appHouse',
  'quiz_villageChurch',
];

final cardCollection = [
  GameCard(
      identifier: idenitifer[0], method: Activation.checkin, siteName: "Mill"),
  GameCard(
      identifier: idenitifer[1],
      method: Activation.checkin,
      siteName: "Quarry Bank House"),
  GameCard(
      identifier: idenitifer[2],
      method: Activation.checkin,
      siteName: "Apprentice House"),
  GameCard(
      identifier: idenitifer[3],
      method: Activation.checkin,
      siteName: "Village and Church"),
  GameCard(identifier: idenitifer[4], method: Activation.quiz),
  GameCard(identifier: idenitifer[5], method: Activation.quiz),
  GameCard(identifier: idenitifer[6], method: Activation.quiz),
  GameCard(identifier: idenitifer[7], method: Activation.quiz),
];

final questionMapping = {
  idenitifer[0]: defaultQuestionsBank,
  idenitifer[1]: defaultQuestionsBank,
  idenitifer[2]: defaultQuestionsBank,
  idenitifer[3]: defaultQuestionsBank,
  idenitifer[4]: millQuestionsBank,
  idenitifer[5]: qbQuestionsBank,
  idenitifer[6]: appHouseQuestionsBank,
  idenitifer[7]: vcQuestionsBank,
};

////////////////////////
///
/// Question Bank
///
/// ////////////////////

final defaultQuestionsBank = [
  MCQuestion(
      question: 'You are not suppose to see this default?',
      choices: ['A', 'B', 'C', 'D']),
  MCQuestion(
      question: 'You are not suppose to see this default?',
      choices: ['A', 'B', 'C', 'D']),
  MCQuestion(
      question: 'You are not suppose to see this default?',
      choices: ['A', 'B', 'C', 'D']),
  MCQuestion(
      question: 'You are not suppose to see this default?',
      choices: ['A', 'B', 'C', 'D']),
  MCQuestion(
      question: 'You are not suppose to see this default?',
      choices: ['A', 'B', 'C', 'D']),
];

final millQuestionsBank = [
  MCQuestion(
      question: 'What was the primary purpose of the Mill at Quarry Bank?',
      choices: [
        'Textile Production',
        'Religious Worship',
        'Summer Retreat',
        'Children\'s Education'
      ]),
  MCQuestion(
      question: 'In what era was the Mill at Quarry Bank built?',
      choices: ['1700s', '1800s', '1900s', '2000s']),
  MCQuestion(
      question: 'What separated Quarry Bank House from the Mill?',
      choices: ['A bridleway', 'A vast lake', 'A forest', 'A high wall']),
  MCQuestion(
      question:
          'Which entrepreneur was primarily associated with the creation of the Mill at Quarry Bank?',
      choices: [
        'Samuel Greg',
        'Robert Hyde Greg',
        'Thomas Priestly',
        'John Docherty'
      ]),
  MCQuestion(
      question:
          'Which reason influenced Greg\'s decision to build his summer retreat close to the Mill?',
      choices: [
        'He could supervise the Mill\'s development',
        'He loved the constant noise of machinery.',
        'He wanted a long commute to work',
        'He wanted to avoid the Mill.'
      ]),
];

final qbQuestionsBank = [
  MCQuestion(
      question:
          'Why did Hannah Greg anticipate the construction of Quarry Bank House?',
      choices: [
        'To escape the confinement of Manchester',
        'To be closer to the Mill',
        'To host grand parties',
        'To establish a religious center'
      ]),
  MCQuestion(
      question: 'What did all the main rooms in Quarry Bank House overlook?',
      choices: [
        'The river valley',
        'The Mill',
        'The town square',
        'The churchyard'
      ]),
  MCQuestion(
      question:
          'What did Samuel Greg aim to achieve by building his summer retreat near the Mill?',
      choices: [
        'Oversight of Mill development',
        'Escape from factory noise',
        'Better connectivity to the city',
        'Religious practices'
      ]),
  MCQuestion(
      question: 'What primarily defines the rooms in Quarry Bank House?',
      choices: [
        'Their modest scale',
        'Their grandeur',
        'Their ornate decorations',
        'Their industrial design'
      ]),
  MCQuestion(
      question:
          'Around which year was Hannah\'s rural idyll, the Quarry Bank House, completed?',
      choices: ['1800', '1750', '1850', '1900']),
];

final appHouseQuestionsBank = [
  MCQuestion(question: 'Why was the Apprentice House constructed?', choices: [
    'To accommodate child workers from workhouses',
    'To serve as a marketplace',
    'To house Samuel Greg\'s family',
    'To act as a religious institution'
  ]),
  MCQuestion(
      question:
          'At its peak, approximately how many children lived in the Apprentice House?',
      choices: ['90', '50', '70', '110']),
  MCQuestion(
      question:
          'What characterized the dormitory arrangements in the Apprentice House?',
      choices: [
        'Separate floors for boys and girls',
        'Equal space for boys and girls',
        'Larger space for boys than for girls',
        'One large dormitory for girls and smaller rooms for boys'
      ]),
  MCQuestion(
      question:
          'Who were the known superintendents responsible for the House from 1814 to 1835?',
      choices: [
        'George and Elizabeth Shawcross',
        'Dr. Holland',
        'The Rathbones',
        'The Greg family'
      ]),
  MCQuestion(
      question:
          'Which Greg family member showed particular interest in the running of the Apprentice House?',
      choices: [
        'Hannah Greg',
        'Samuel Greg',
        'Robert Hyde Greg',
        'John Docherty'
      ]),
];

final vcQuestionsBank = [
  MCQuestion(
      question: 'Why was Styal Village significant in relation to the Mill?',
      choices: [
        'It was a place where workers initially resided.',
        'It was the primary religious center.',
        'It was where the Gregs originally lived.',
        'It was the main marketplace for the Mill\'s products.'
      ]),
  MCQuestion(
      question: 'Which church did Samuel Greg ensure the apprentices attended?',
      choices: [
        'The Anglican parish church in Wilmslow',
        'The Unitarian chapel in Oldham',
        'The Baptist church in Bolton',
        'The Methodist church in Salford'
      ]),
  MCQuestion(
      question: 'How did the apprentices get to the church in Wilmslow?',
      choices: [
        'Walking the \'Apprentices Walk\'',
        'By boat',
        'By carriage',
        'Via train'
      ]),
  MCQuestion(
      question:
          'How long was the \'Apprentices Walk\' in total for a round trip?',
      choices: ['10 miles', '5 miles', '15 miles', '20 miles']),
  MCQuestion(
      question: 'Which of the chapels in the village was built first?',
      choices: [
        'The Unitarian chapel',
        'The Baptist chapel',
        'The Anglican chapel',
        'The Methodist chapel'
      ]),
];
