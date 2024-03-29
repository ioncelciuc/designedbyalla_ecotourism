/*

\n => enter
\' => '
\" => "

*/


class Strings {
  static bool en;
  static bool firstTimeClaimingEcopoints;
  static bool showTutorial;

  static const String enSignIn = 'SIGN IN';
  static const String cnSignIn = '登入';

  static const String enSignUp = 'SIGN UP';
  static const String cnSignUp = '';

  static const String enForgotPassword = 'Forgot password?';
  static const String cnForgotPassword = '';

  static const String enRecoverPassword = 'RECOVER PASSWORD';
  static const String cnRecoverPassword = '';

  static const String enEmail = 'email';
  static const String cnEmail = '';

  static const String enUsername = 'username';
  static const String cnUsername = '';

  static const String enHowShouldWeCallYou = 'how should we call you?';
  static const String cnHowShouldWeCallYou = '';

  static const String enPassword = 'password';
  static const String cnPassword = '';

  static const String enRepeatPassword = 'repeat password';
  static const String cnRepeatPassword = '';

  static const String enCompleteAllFields = 'Please complete all fields';
  static const String cnCompleteAllFields = '';

  static const String enPasswordTooShort =
      'Password must be at least 6 characters';
  static const String cnPasswordTooShort = '';

  static const String enPasswordNotMatching =
      'Password must be at least 6 characters';
  static const String cnPasswordNotMatching = '';

  static const String enChooseLanguage = 'Choose your preffered language';
  static const String cnChooseLanguage = '';

  static const String enStepPage1Text =
      'You have arrived and this is the place to be!';
  static const String cnStepPage1Text = '';

  static const String enStepPage2Text =
      'This is a journey to begin working on your best behaviour on your ecotourism visit';
  static const String cnStepPage2Text = '';

  static const String enStepPage3Text =
      'Go on a digital adventure to further understand the impact of your behaviour towards nature';
  static const String cnStepPage3Text = '';

  static const String enStepPage4Text =
      'mGEECO will guide you to progress in adventure as you improve your real-life eco-behaviour';
  static const String cnStepPage4Text = '';

  static const String enStepPage1Title = 'Choose your preffered language';
  static const String cnStepPage1Title = 'Choose your preffered language';

  static const String enStepPage2Title = 'We see potential in YOU';
  static const String cnStepPage2Title = '';

  static const String enStepPage3Title = 'YOU have the power!';
  static const String cnStepPage3Title = '';

  static const String enStepPage4Title =
      'Will YOU bring positive change nature needs?';
  static const String cnStepPage4Title = '';

  static const String enSkip = 'Skip';
  static const String cnSkip = '';

  static const String enNext = 'Next';
  static const String cnNext = '';

  static const String enBegin = 'Begin!';
  static const String cnBegin = '';

  static const String enAvatarChoice =
      'They want to accompany you in the journey before they go extinct. But maybe YOU can help!';
  static const String cnAvatarChoice = '';

  static const List<String> enSurveyQuestions = [
    'Hmm, before we begin, how familiar are you about ecotourism?',
    'Is it important to practise eco-behaviour during your travel?',
  ];
  static const List<String> cnSurveyQuestions = [
    '嗯，在我们开始之前，您对生态旅游有多熟悉？',
    '在旅途中练习生态行为是否重要？',
  ];

  static const List<List<String>> enSurveyAnswers = [
    [
      'Very familiar',
      'I heared of it',
      'I can guess about it',
      'Not sure',
    ],
    [
      'I even practice it daily',
      'Yes, working on it!',
      'It\'s hard to do!',
      'I can\'t make any change',
    ],
  ];
  static const List<List<String>> cnSurveyAnswears = [
    [
      '很熟',
      '',
      '',
      '',
    ],
    [
      '',
      '',
      '',
      '',
    ],
  ];

  static const String enOnGoodPath = 'You\'re on a good path!';
  static const String cnOnGoodPath = '';

  static const String enGoodToSeeYouBack = 'Good to see you back!';
  static const String cnGoodToSeeYouBack = '';

  static const String enEcopoints = 'Ecopoints';
  static const String cnEcopoints = '';

  static const String enReturnPageCongrats1 =
      'Congratulations on your first step of becoming a responsible ecotourist';
  static const String cnReturnPageCongrats1 = '';

  static const String enReturnPageCongrats2 =
      'Congratulations on your ongoing efforts of becoming a responsible ecotourist';
  static const String cnReturnPageCongrats2 = '';

  static const String enClaim = 'CLAIM';
  static const String cnClaim = '';

  static const String enImReady = 'I\'M READY!';
  static const String cnImReady = '';

  static const String enAbout = 'About';
  static const String cnAbout = '';

  static const String enSignOut = 'Sign Out';
  static const String cnSignOut = '';

  static const String enGuideTitle = 'mGEECO Guide';
  static const String cnGuideTitle = '';

  static const String enGuideSubtitle =
      'Select any of the components in this app to learn more about it by swiping left or right!';
  static const String cnGuideSubtitle = '';

  static const List<String> enGuideDescription = [
    'Ecopoints\n\nEcopoints is the points you can earn by regularly using mGEECO, finishing adventure and fixing ecosite with the right ecosupply item that you\'ve earned.\n\nEcopoints symbolise the small reward for the effort you make in the app.\n\nYou can use the ecopoints you\'ve earned by donating them in the real-life ecotourism related mission. Check mission page to learn more about it.',
    'Ecosupply\n\nEcosupply is the item you have earned by finishing an adventure and contributing to mission. This symbolises your power to contribute by applying your knowledge and effort into making your travel to an ecotourism site more environmentally friendly.',
    'Eco Impact\n\nEco Impact represents the impact you may have made to environment during your travel. In mGEECO, this is represented in the form of scale that show the increase in the Earth’s average temperature.\n\nWHY IS 1.5 DEGREES THE DANGER LINE FOR GLOBAL WARMING?\n\n“Coral reefs would decline by 70-90 percent with global warming of 1.5°C, whereas virtually all would be lost with 2°C”\n\nAdapting to a 1.5°C global temperature rise would be less difficult, costly, and lead to less human harm. But letting the warming rise just a half-degree, to 2°C, would add an average of 4 inches of global sea level rise. Going above 1.5 degrees of warming puts millions more at risk of potentially life-threatening heatwaves and poverty. It all but wipes out coral reefs that entire ecosystems rely on worldwide. Seas swallow even more of our cities. And that’s just for starters.',
    'Ecosite and Problems\n\nThe ecosite is Tianchi (天池), which is an alpine lake in Xinjiang, Urumqi. The name (天池) literally means Heavenly Lake. It lies on the north side of the Bogda Shan (Mountain of God). It is an alpine drift lake shaped in the Quaternary Glacier period. In 2006, it went under 4 years restoration work due to the damages done by the tourist. The lake is classified as a highest-level scenic area by the China National Tourism Administration and was listed by UNESCO as a world heritage site in 1990.\n\nIn mGEECO, the problem at ecosite represent how tourist have impacted wilderness at ecotourism destination. By going on adventure in mGEECO, you will understand how our choices have its impact.',
    'Mission\n\nIn mission, you can contribute in real-life eco-mission by donating ecopoints you\'ve earned in app. By using mGEECO, you can help contributing to the real-world problems relating to ecotourism and the wilderness.',
    'Adventure\n\nIn adventure, you will learn eco-behaviour in ecotourism related knowledge as you progress. The contents in the task were created by extracting information from research on ecotourism and problems by tourist.\n\nThe tasks chosen were based from the real issues happening at the chosen ecotourism destination.',
    'Progress\n\nThis displays your progress and the impact you have made by progressing in the app. This mirrors the impact you can make in real-world setting.',
  ];
  static const List<String> cnGuideDescription = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  static const List<String> enTutorial = [
    'Welcome to the home of your new journey!\nTake the time to explore the app and get a feel of the place. First, follow the screen for a quick tutorial.',
    'Anytime you feel lost, do click me for a guide and how-to.',
    'This display the ecopoints you\'ve earned in the app. You can earn ecopoints in Adventure, and donate them in mission',
    'This display the ecosupply you\'ve earned. You can earn ecosupply in Adventure, and use them to fix the problem on Ecosite.',
    'This display the climate temperature rise. You need to keep it below 1.5 degrees (blue indicator) by earning impact point by fixing Ecosite and contribute in mission. ',
    'This box display information of your journey.',
    'This display the ecosite you are visiting. However, this site has several eco problem due to human behaviour that you can help to fix.',
    'Click on (!) to access the problem this ecosite is dealing with. You can find the right supply in Adventure and help fixing them.',
    'This navigate to the Ecosite page',
    'This navigate to the Adventure page. You will learn eco-behaviour in ecotourism related knowledge as you progress.',
    'This navigate to the Mission page. You can contribute in real-life eco-mission by donating ecopoints you\'ve earned in app.',
    'This display your progress and the impact you\'ve made by progressing in the app. This mirrors the impact you can make in real-world setting',
  ];
  static const List<String> cnTutorial = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  static const List<String> enInfoBox = [
    'Welcome to Tianchi Lake Ecotourism Park. Tourist came and left impact they shouldn\'t have. The currentimpact indicator is in red meaning it surpassed the warning limit of 1.5°C in global surface temperature rise.',
    'Human-induced warming reached approximately 1°C (likely between 0.8°C and 1.2°C) above preindustrial levels in 2017, increasing at 0.2°C (likely between 0.1°C and 0.3°C) per decade. If this continue, there won\'t be nature you can visit in the future.',
    'Equip yourself with the knowledge of the direct and indirect impact tourist left after their visitation and how it effects the global temperature rise. First, let\'s check the problems and what you can do to help! Click on any (!) on ecosite to start!',
  ];
  static const List<String> cnInfoBox = [
    '',
    '',
    '',
  ];

  static const String enNoEcosupply =
      'You currently do not have any ecosupply. Go to ADVENTURE page to earn it.';
  static const String cnNoEcosupply = '';

  static const List<String> enProblem1 = [
    'Local Culture and Heritage\n\nWhen the locals entertain tourists, they adapt tourists’ needs, attitudes and values and ultimately start following them. Think what you can do to preserve and conserve local cultural heritage, gives back cultural pride, revitalise customs & traditions as well as opens door for cultural sharing and learning. Strengthening local cultural value is a vital point. Your part is to support the locals to not commodify their core value to entertain the tourist.',
    'Click FIX to display the ecosupply available. Only the right ecosupply will be able to fix the site.',
    'You have chosen wrong item for fixing the problem. Choose another ecosupply item or go on Adventure to learn more about the problem and what you could do to prevent and fix the problem.',
    'Congratulations on fixing the site!\n\nWithout the culture and heritage, we will lose the uniqueness the place has to offer. Remember that for your trip to be memorable is not limited to rare activities. Nonexploitative cultural interactions with local people are impactful experience too!',
  ];
  static const List<String> cnProblem1 = [
    '',
    '',
    '',
    '',
  ];

  static const List<String> enProblem2 = [
    'Play a part\n\nEcotourism contributes to conservation or preservation of the natural resources and promotes stewardship of natural and cultural resources. Ecotourism needs to create necessary funds to promote permanent protection of ecological and socio-cultural resources while the locals accrue economic and social benefits. It is the time to get involved in environmental protection, by volunteering and supporting the conservation efforts at the site you are visiting. Hire local guides hen you can; you’ll not only learn a out the vicinity from insiders, ut you’ll also provide incentive for communities to invest in environmental conservation.',
    'Click FIX to display the ecosupply available. Only the right ecosupply will be able to fix the site.',
    'You have chosen wrong item for fixing the problem. Choose another ecosupply item or go on Adventure to learn more about the problem and what you could do to prevent and fix the problem.',
    'Congratulations on fixing the site! \n\nEnvironment conservation and volunteering aims to protect their valuable biodiversity and ensure sustainable development.',
  ];
  static const List<String> cnProblem2 = [
    '',
    '',
    '',
    '',
  ];

  static const List<String> enProblem3 = [
    'The Weightiness of Wilderness',
    'Click FIX to display the ecosupply available. Only the right ecosupply will be able to fix the site.',
    'You have chosen wrong item for fixing the problem. Choose another ecosupply item or go on Adventure to learn more about the problem and what you could do to prevent and fix the problem.',
    'Congratulations on fixing the site! \n\nBe knowledgeable about the endangered and threatened species that live in and near the places you’re visitin ill make your trip more orthy.'
  ];
  static const List<String> cnProblem3 = [
    '',
    '',
    '',
    '',
  ];

  static const List<String> enProblem4 = [
    'The Silent Predator\n\nNon-biodegradable waste is choking our planet and polluting the air, water, and soil both people and wildlife need to survive. Every day a third of the total plastic waste are flowing into our natural environment at an unprecedented rate. Increasing plastic use and limited recycling results in towering plastic production. Substituting every items we carry into nature with products that are more sustainable for the good of the planet.',
    'Click FIX to display the ecosupply available. Only the right ecosupply will be able to fix the site.',
    'You have chosen wrong item for fixing the problem. Choose another ecosupply item or go on Adventure to learn more about the problem and what you could do to prevent and fix the problem.',
    'Congratulations on fixing the site!\n\nAnything you carry in, you should carry out. That means taking extra packaging with you when you leave! Many ecotourism destinations are in rural area where there is no proper waste management.',
  ];
  static const List<String> cnProblem4 = [
    '',
    '',
    '',
    '',
  ];

  static const List<String> enProblem5 = [
    'Forget your bucket list!\n\nTourist can bring the curse of noisy crowds and even dangerous conditions to places once known for idyllic quiet, remoteness and charming accessibility. Engaging in activities that damages nature indirectly and directly should be avoided. Kayaking near corals, stepping on wildflower for photos you want to post can cause a long-term harm. Before you leave home, research the environmental issues that affect the places you’ll e visitin . e a are of hat you do.',
    'Click FIX to display the ecosupply available. Only the right ecosupply will be able to fix the site.',
    'You have chosen wrong item for fixing the problem. Choose another ecosupply item or go on Adventure to learn more about the problem and what you could do to prevent and fix the problem.',
    'Congratulations on fixing the site! Many tourists feel if they paid for it, they are allowed to do anything. But the cost of losing what in front of their eyes now are bigger than the cost of their \'bucketlist\' and insta-worthy photos. Be responsible!',
  ];
  static const List<String> cnProblem5 = [
    '',
    '',
    '',
    '',
  ];

  static const String enEcosupplyEarned = 'Ecosupply Earned';
  static const String cnEcosupplyEarned = '';

  static const String enTemperatureReduced = 'Temperature Reduced';
  static const String cnTemperatureReduced = '';

  static const List<String> enEcosupplyName = [
    'Cultural Heritage Conservation',
    'Respect Local',
    'Helping Hand',
    'Knowledge Power',
    'Wilderness Welfare',
    'Wilderness Care',
    'Leave No Trace',
    'Only Eco',
    'Safe Activities',
    'Action Matters',
  ];
  static const List<String> cnEcosupplyName = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  // do not change this
  static const List<String> ecosupplyImage = [
    'images/ecosupply_cultural_heritage_conservation.png',
    'images/ecosupply_respect_local.png',
    'images/ecosupply_helping_hand.png',
    'images/ecosupply_knowledge_power.png',
    'images/ecosupply_wilderness_welfare.png',
    'images/ecosupply_wilderness_care.png',
    'images/ecosupply_leave_no_trace.png',
    'images/ecosupply_only_eco.png',
    'images/ecosupply_safe_activities.png',
    'images/ecosupply_action_matters.png',
  ];

  static const List<String> enEcosupplyText = [
    //0 - cultural_heritage_conservation
    'This item is for tourist awareness on respecting the local heritage and culture. The place you visit is already someone’s home, full of someone’s culture. It is important to appreciate and respect local traditions, cultural norms, legacy, and heritage.',
    //1 - respect_local
    'This item is for tourist awareness on respecting the local heritage and culture. The place you visit is already someone’s home, full of someone’s culture. It is important to appreciate and respect local traditions, cultural norms, legacy, and heritage.',
    //2 - helping_hand
    'This item is to encourage tourist to volunteer and support the conservation effort to protect wilderness specifically at ecotourism destination.',
    //3 - knowledge_power
    'This item is to encourage user to do research before going to an ecotourism destination to understand the site needs.',
    //4 - wilderness_welfare
    'This item is to educate tourist not to keep wilderness welfare as priority during their ecotourism visit. By not disturbing the natural process of the ecosystem, environment will continue to sustain.',
    //5 - wilderness_care
    'This item is to educate tourist not to keep wilderness welfare as priority during their ecotourism visit. By not disturbing the natural process of the ecosystem, environment will continue to sustain.',
    //6 - leave_no_trace
    'This item is to educate tourist to minimise their nonbiodegradable waste by recycling and reusing items. Tourist will be reminded to not leave any form of trash at the destination they are visiting.',
    //7 - only_eco
    'This item is to educate tourist to minimise their nonbiodegradable waste by carry their own reusable bags, straws, takeaway containers, and ustensils. Tourist will be reminded to carry only items that will not cost the harm to the wilderness.',
    //8 - safe_activities
    'This item is to remind tourist not to engage in activities that might cause ripple effect to the surrounding nature. Being aware of the surrounding and own action plays an impactful role for nature sustainability.',
    //9 - action_matters
    'This item is to remind tourist not to engage in activities that might cause ripple effect to the surrounding nature. Being aware of the surrounding and own action plays an impactful role for nature sustainability.',
  ];

  static const List<String> cnEcosupplyText = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  static const String enChooseEcosupply =
      'Choose an ecosupply to fix. Swipe to navigate.';
  static const String cnChooseEcosupply = '';

  static const String enWrongItem = 'Sorry. You have chosen a wrong item.';
  static const String cnWrongItem = '';

  static const String enItemNotApplicable =
      'This item is not applicable to fix the problem.\n\nChoose another ecosupply item or go on Adventure to equip yourself with the right knowledge to fix the problem.';
  static const String cnItemNotApplicable = '';

  static const String enContributeInRealWorldMission =
      'Contribute in real world mission';
  static const String cnContributeInRealWorldMission = '';

  static const String enProject = 'The project';
  static const String cnProject = '';

  static const String enDonate = 'Donate';
  static const String cnDonate = '';

  static const String enRequirement = 'Requirement';
  static const String cnRequirement = '';

  // do not change the line below
  static const List<int> missionEcopoints = [50, 60, 70, 80];

  static const List<String> enMissionTitle = [
    'Support Giant Panda Conservation Effort',
    'Pledge for water pollution awareness',
    'Support the Mangrove Forest Protection',
    'Aid local Tibetan against ‘white pollution’',
  ];
  static const List<String> cnMissionTitle = [
    '',
    '',
    '',
    '',
  ];

  static const List<String> enMissionSubtitle = [
    'Mission: Donate ecopoints in exchange for donation funds for the Giant Panda Conservation',
    'Funds: Donate ecopoints in exchange for voice in backing up the project',
    'Support: Exchange ecopoints with funds to support volunteering program of mangrove conservation and ecological restoration',
    'Support: Exchange ecopoints with funds for volunteers to control the abandoned plastic trash',
  ];
  static const List<String> cnMissionSubtitle = [
    '',
    '',
    '',
    '',
  ];

  static const List<String> enMissionText = [
    'For over 20 years, this organization has worked for the preservation of the panda population and has now resolved three key problems of breeding, which restricted reproduction of the panda for a long time. The current panda birth and survival rates are some of the best in the world. The panda population of the program has risen from an initial 6 animals to over 70 pandas. In 2003 the first stage of a state-of-the-art panda base was completed: a veritable panda paradise. It is divided into 6 sections: panda raising and breeding area, scientific study area, food preparing and animal hospital area, staff living area, bamboo base area and tourist accommodation area. Thanks to rigorous conservation efforts, the giant panda is no longer on the World Wildlife Federation\'s endangered species list; however, they are still considered a \"vulnerable\" species. Your ecopoints will be converted into funds donation to the Panda Reserve, allowing them to continue this important work. 50 ecopoints for 5¥ in funds donation.',
    'China will endeavour to remediate damaged ecological systems in major river basins and restore aquatic animals and plants there during the 14th Five-Year Plan (2021-25). The country will also set up buffer zones to facilitate the protection of rivers and lakes while making efforts to transform life and production styles that invade the ecological systems of water bodies, and gradually restore aquatic animals and plants in rivers and lakes with damaged water ecological systems. The plan will be drafted in a people-cantered manner. The environment of water bodies that are near the public will be further improved to increasingly meet people\'s scenic, entertainment and sports demands. The country will increase the number of national monitoring stations for surface water from the current 1,940 to 3,646 in its efforts to enhance water pollution management.\n\n You can now support this project by donating your ecopoints in exchange of pledge for voices that will be collected for awareness materials of water pollution and surface water quality to the public.',
    'Remote sensing results showed that China\'s mangrove forests are mainly distributed in areas including Guangdong province, Guangxi Zhuang autonomous region and Hainan province. Guangdong province has the largest mangrove area, accounting for 41 percent of the total stretch. A total of 487 hectares of mangrove forests were added in 2020 from 2018, of which 59 percent were artificially planted and 41 percent restored naturally. Around 150 hectares of mangrove forests have depleted, some of which are caused by human activities such as pond reclamation and port construction. According to sources at the center, they will make full use of satellite remote sensing and other technologies to continuously monitor mangrove forest growth and the impact of human activities, to support mangrove conservation and ecological restoration. You can now support this project by donating your ecopoints in exchange funds to support the volunteering program of mangrove conservation and ecological restoration.',
    'The economic boom that enriched China has fed urbanization along with the consumption of commodities and other waste-generating activities. The worst pollution in Tibetan area results from rural farmers\' markets and the common use of plastic bags, which are super-thin and relatively expensive to recycle. The association taps the volunteer spirit on the plateau to control abandoned plastic trash, aka "white pollution". The volunteers are of all ages and come from different walks of life, but many of the most active are members of the Tibetan ethnic group who were born in the region\'s preindustrial era, when plastic was rarely used. Whit pollution was "haunting" China\'s vast rural areas. Even though almost a decade had passed since Tibet adopted the plastics ban, some small businesses were still trying to evade inspections, which exacerbated pollution. To improve recycling rates, they are calling for greater efforts to raise awareness of plastic pollution and about the harm plastics do to farmland and livestock.\n\nYou can now support this project by exchanging ecopoints for volunteer funds to control the abandoned plastic trash. 80 ecopoints for ¥10 in volunteering funds to tackle the issue.',
  ];
  static const List<String> cnMissionText = [
    '',
    '',
    '',
    '',
  ];

  static const List<String> enMissionNotEnoughEcopoints = [
    'Sorry, you do not have enough ecopoints to contribute.',
    'Check other missions or earn more ecopoints in Adventure.',
    'We\'ll be waiting!',
  ];
  static const List<String> cnMissionNotEnoughEcopoints = [
    '',
    '',
    '',
  ];

  static const List<String> enMissionAlreadyDonated = [
    'Good Intention!',
    'You have done your part for this mission. We encourage you to check other missions with your kind donations.',
    'We\'ll be waiting!',
  ];
  static const List<String> cnMissionAlreadyDonated = [
    '',
    '',
    '',
  ];

  static const String enGreatNews = 'Great News!';
  static const String cnGreatNews = '';

  static const String enEcopointsDonated = 'Ecopoints Donated';
  static const String cnEcopointsDonated = '';

  static const List<String> enMissionDonated = [
    'Your donation to the Panda Reserve allowing them to continue the important work for the preservation of the panda population. The panda population of the program has risen from an initial 6 animals to over 70 pandas and counting.\n\nThanks to rigorous conservation efforts, the giant panda is no longer on the World Wildlife Federation\'s endangered species list',
    'Your collective voices are impactful! With your strong pledge, the environment of water bodies that are near the public will be further improved to increasingly meet people\'s scenic, entertainment and sports demands. The country will increase the number of national monitoring stations for surface water from the current 1,940 to 3,646 in its efforts to enhance water pollution management.',
    'Your donation will support the volunteering program of mangrove conservation and ecological restoration. They will make full use of satellite remote sensing and other technologies to continuously monitor mangrove forest growth and the impact of human activities, to support mangrove conservation and ecological restoration. The mangroves in China will be kept safe in the future to come.',
    'Your donation helps in providing funds for the volunteers to control the abandoned plastic trash. It has become the worst pollution in the Tibetan area, but many earth-loving souls are doing their best to help keeping the area plastic-free. The association plans to introduce incentives for rural buyers to employ reusable cloth bags rather than plastics. The program will be roll out in Lhasa\'s markets that will allow shoppers to trade 20 plastic bags for a cloth bag, and there will be a series of lecture about the harm plastics do to farmland and livestock.',
  ];
  static const List<String> cnMissionDonated = [
    '',
    '',
    '',
    '',
  ];

  static const String enAchievement = 'ACHIEVEMENT';
  static const String cnAchievement = '';

  static const String enCheckIns = 'CHECK IN’S';
  static const String cnCheckIns = '';

  static const String enGreatWork = 'Great work on your achievement!';
  static const String cnGreatWork = '';

  static const List<String> enProgressCardText = [
    ' ecosite problem fixed',
    ' completed adventure',
    ' mission contributed',
    'Reduced ',
    ' °C of temperature rise',
  ];
  static const List<String> cnProgressCardText = [
    '',
    '',
    '',
    '',
    '',
  ];

  static const String enChinaEcotourism = 'China Ecotourism Destination';
  static const String cnChinaEcotourism = '';

  static const List<String> enAdventureInfoBox = [
    'As more and more Chinese people are choosing to visit places that have fresh air, thick forests and are rich in negative ions, ecotourism becomes a fresh favoured choice across the country. Ecotourism is thought to be an inevitable way for Chinese nature reserves to achieve sustainable development. Ecotourism in China is divided into six fundamental types, namely Forest Recreation Ecotourism, Prairie Coquette Ecotourism, Wetlands Bird-watching Ecotourism, Desert Exploration Ecotourism, Countryside Experience Ecotourism and Ocean Vacation Ecotourism. Choose any of the ecotourism site above to begin your adventure!',
    'Mt. Qoolongma, Tibet\n\nMount Everest, also called Mt. Qomolangma, is the highest peak in the world. Its Tibetan meaning of \'Goddess the Third\' adds more mysterious color and magic power to the subject. The area has 4 peaks above 8,000 m. (26,247 ft.) and 38 peaks above 7,000 m. (22,965 ft.), hence the laudatory title \'the Third Pole of the Earth\'\n\nAs the supreme point of the world, Mt. Qomolangma is also blessed with many extreme wonders. The top part of the mountain is covered with snow all the year round. When the glaring sun shines on the mountain, the peak is just like a white pyramid miraculously transformed by the Goddess, leading us to imagine her semblance further. Often, the thick freely moving clouds and fogs, seeming as if a flag with the mast of the peak was swinging, will shroud the peak. This peculiar phenomenon is known as \'Flag Cloud\'. An additional wonder generated here are the bright glaciers, where ices are formed into various shapes like bridges, pagodas and others. You can also find miles of efflorescent rock physiognomy there, such as stalagmites, stelae, stone sword, and stone pagodas. The area of Mountain Everest has been built as one of the national natural reserves, wherein live thousands of kinds of plants, hundreds of varieties of wild animals and dense virgin forests. Many of these are precious and rare, like the first-class protected animal ounces and the valuable timber sandals, etc\n\nBy going on this adventure, you will learn knowledge on protecting biodiversity during the trip while earning one ecosupply item and ecopoints.',
    'Tiger Leaping Gorge, Shangri La\n\nTiger Leaping Gorge is one of the deepest gorges in the world, making it one of the top 10 world famous hiking trails. It is located at the border of Lijiang and Shangri-La, is a scenic canyon on the Jinsha River, a primary tributary of the upper Yangtze River. Jade Dragon Snow Mountain and Haba Snow Mountain stand on each side, offering beautiful and diverse landscapes. It is divided into three parts: Upper Gorge, Middle Gorge and Lower Gorge. Tiger Leaping Gorge is a part of the Three Parallel of Yunnan Protected Areas UNESCO World Heritage Site which was inscribed in 2003. Being one of the deepest gorges in the world, Tiger Leaping Gorge is with a drop of 3,900m from the mountain peak to the river bed. A visit to Tiger Leaping Gorge, you can enjoy deepincised river gorges, luxuriant forests, towering snow-clad mountains, glaciers of the UNESCO site.\n\nBy going on this adventure, you will learn knowledge on eco-behaviour practise bduring the trip while earning one ecosupply item and ecopoints.',
    'Gaoyao Terrace, Guizhou\n\nWithout doubt the most iconic natural feature of Danzhai are its rice terraces. These giant steps are sculpted out of the hillsides over centuries by the industrious Miao, who, according to their own origin story, migrated here from the north around the time of China’s legendary Yellow Emperor some 5,000 years ago.\n\nThe first area cultivated by the Miao in Danzhai is known as the Gaoyao rice terraces, at its most resplendent around October when all turns to gold. Although not as steep or remote as other photogenic rice terraces in the county, Gaoyao is remarkable for its sheer size and breadth. A perch just off a highway offers the most allencompassing view for shutterbugs, but it’s more fun to wander through Gaoyao village itself – a sleepy little hamlet with clopping horses and a general store that doubles as an inn – and access the terraces via an ancient spring that gushes forth ice-cold water. Take some time to appreciate the vignettes of local life that will reveal themselves. Drive over precarious raised roads that slalom between rice terraces as Miao women pass, dressed in vivid indigo and blue, some with water buffalo in tow. Watch white butterflies dance over the fields like confetti in a breeze. Admire the mist that clings to the mountains like wool after it rains. Danzhai presents an endlessly photogenetic landscape, some 350undulating square miles of hills, valleys, rivers and sculpted rice terraces. You just need toget off the main roads and start exploring.\n\nBy going on this adventure, you will learn knowledge on heritage and culture conservation during the trip while earning one ecosupply item and ecopoints.',
    'Hulunbuir, Inner Mongolia\n\nLocated in the north-east of Inner Mongolia and named after Hulun Lake and Buir Lake, Hulunbuir Grassland is one of the three famous grasslands in the world with an elevation of between 650 and 700 meters, an area of about 100,000 square kilometres and natural grassland coverage of 80%. It also holds the name "The Purest Prairie" since there is hardly any pollution there. Produce like meat, milk, leather, wool and other animal products are favoured by people from both domestic and foreign countries.\n\nBy going on this adventure, you will learn knowledge on how to manage our waste during the trip while earning one ecosupply item and ecopoints.',
    'Yancheng Wetlands, Jiangsu\n\nThe Yancheng Coastal Wetlands is the largest coastal wetlands nature reserve in China. t has more than 600 kinds of natural vegetation, 379 kinds of birds, 281 kinds of shellfish, 590 kinds of insects, 47 kinds of mammal and another 490 kinds of plants. In 1992, The Nation Rare Birds Nature Reserve was built in Yancheng Wetlands. The Yancheng Nature Reserve is especially known for the red-crowned cranes. Every winter, hundreds of redcrowned crane migrate to wintering sites in the Yancheng Nature Reserve. There are about 3,000,000 birds fly through Yancheng. Among these birds, more than 500,000 birds overwinter in Yancheng Nature Reserve.\n\nBy going on this adventure, you will learn knowledge on ecotourism protection during the trip while earning one ecosupply item and ecopoints.',
  ];
  static const List<String> cnAdventureInfoBox = [
    '',
    '',
    '',
    '',
    '',
  ];
}
