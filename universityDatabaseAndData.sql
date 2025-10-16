CREATE DATABASE  IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `university`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `building` (
  `BuildingName` varchar(25) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Floors` int(11) NOT NULL,
  `Notes` mediumtext,
  `universityName` varchar(30) DEFAULT NULL,
  `BuildingTypeID` int(11) NOT NULL,
  PRIMARY KEY (`BuildingName`),
  KEY `fk_Building_university1_idx` (`universityName`),
  KEY `fk_Building_BuildingType1_idx` (`BuildingTypeID`),
  CONSTRAINT `fk_Building_BuildingType1` FOREIGN KEY (`BuildingTypeID`) REFERENCES `buildingtype` (`BuildingTypeID`),
  CONSTRAINT `fk_Building_university1` FOREIGN KEY (`universityName`) REFERENCES `university` (`universityName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('Admin','Administration Building',1,'','Roger Williams university',1),('Admissions','Alumni and Admissions',1,'','Roger Williams university',1),('Almeida','Almeida Apartments',3,'','Roger Williams university',2),('Arts and Sciences','Feinstein College of Arts and Sciences',2,'','Roger Williams university',3),('Baypoint','Baypoint Residence and Conference Center',4,'','Roger Williams university',2),('Bayside','Bayside Courts',5,'','Roger Williams university',2),('Bready','Richard Bready Mount Home Bay Sailing',2,'','Roger Williams university',3),('Cedar Hall','Cedar Hall',6,'','Roger Williams university',2),('ELS','ELS Language Center',1,'','Roger Williams university',4),('Engineering','School of Engineering',1,'','Roger Williams university',3),('Facilities','Facilities',1,'','Roger Williams university',4),('Fine Arts','Fine Arts Center',1,'','Roger Williams university',3),('Gabelli','Gabelli School of Business',3,'','Roger Williams university',3),('Global','Global and Community Engagement',2,'','Roger Williams university',4),('Heritage','Global Heritage Hall',3,'','Roger Williams university',3),('Library','university Library',3,'','Roger Williams university',4),('Mail','Mail Room',1,'','Roger Williams university',4),('Maple Hall','Maple Hall',6,'','Roger Williams university',2),('Marine','Marine and Natural Sciences',2,'','Roger Williams university',3),('North Campus','North Campus Residence Hall',5,'','Roger Williams university',2),('Performing Arts','Performing Arts Center',1,'','Roger Williams university',3),('Purchasing','Purchasing',1,'','Roger Williams university',4),('Recreation','Campus Recreation Center',1,'','Roger Williams university',4),('Safety','Public Safety',1,'','Roger Williams university',4),('Sailing','US Sailing Association Headquarters',1,'','Roger Williams university',4),('School of Architecture','',1,'','Roger Williams university',3),('School of Law','School of Law, School of Education and Law Library',2,'','Roger Williams university',3),('SECCM','SECCM Labs',3,'','Roger Williams university',3),('Stonewall','Stonewall Terrace',4,'','Roger Williams university',2),('Student Development','Center for Student Development',1,'','Roger Williams university',4),('The Commons','The Commons',3,'','Roger Williams university',4),('Willow Hall','Willow Hall',5,'','Roger Williams university',2);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingtype`
--

DROP TABLE IF EXISTS `buildingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buildingtype` (
  `BuildingTypeID` int(11) NOT NULL,
  `TypeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BuildingTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingtype`
--

LOCK TABLES `buildingtype` WRITE;
/*!40000 ALTER TABLE `buildingtype` DISABLE KEYS */;
INSERT INTO `buildingtype` VALUES (1,'Administrative'),(2,'Residential'),(3,'Academic'),(4,'Other');
/*!40000 ALTER TABLE `buildingtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classroom` (
  `ClassNumber` varchar(6) NOT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `BuildingName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ClassNumber`),
  KEY `fk_Classroom_Building1_idx` (`BuildingName`),
  CONSTRAINT `fk_Classroom_Building1` FOREIGN KEY (`BuildingName`) REFERENCES `building` (`BuildingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('AS101',1,30,'Arts and Sciences'),('AS102',1,30,'Arts and Sciences'),('AS103',1,30,'Arts and Sciences'),('AS104',1,30,'Arts and Sciences'),('AS105',1,25,'Arts and Sciences'),('AS106',1,25,'Arts and Sciences'),('AS107',1,25,'Arts and Sciences'),('AS108',1,25,'Arts and Sciences'),('AS109',1,25,'Arts and Sciences'),('AS201',2,30,'Arts and Sciences'),('AS202',2,30,'Arts and Sciences'),('AS203',2,30,'Arts and Sciences'),('AS204',2,30,'Arts and Sciences'),('AS205',2,30,'Arts and Sciences'),('AS206',2,30,'Arts and Sciences'),('AS207',2,30,'Arts and Sciences'),('AS208',2,30,'Arts and Sciences'),('AS209',2,30,'Arts and Sciences'),('ENG101',1,30,'Engineering'),('ENG102',1,30,'Engineering'),('ENG103',1,30,'Engineering'),('ENG104',1,30,'Engineering'),('ENG105',1,30,'Engineering'),('ENG106',1,30,'Engineering'),('ENG107',1,30,'Engineering'),('ENG108',1,30,'Engineering'),('SB100',1,40,'Gabelli'),('SB101',1,25,'Gabelli'),('SB102',1,25,'Gabelli'),('SB103',1,30,'Gabelli'),('SB122',2,30,'Gabelli'),('SB222',2,30,'Gabelli'),('SB223',2,30,'Gabelli'),('SB225',2,30,'Gabelli'),('SB301',3,30,'Gabelli'),('SB302',3,30,'Gabelli'),('SOA100',1,30,'School of Architecture'),('SOA101',1,30,'School of Architecture'),('SOA102',1,30,'School of Architecture'),('SOA103',1,30,'School of Architecture'),('SOA104',1,30,'School of Architecture'),('SOA105',1,30,'School of Architecture'),('SOL100',1,50,'School of Law'),('SOL101',1,30,'School of Law'),('SOL102',1,30,'School of Law'),('SOL103',1,30,'School of Law'),('SOL104',1,30,'School of Law'),('SOL105',1,30,'School of Law'),('SOL201',2,30,'School of Law'),('SOL202',2,30,'School of Law'),('SOL203',2,30,'School of Law'),('SOL204',2,30,'School of Law'),('SOL205',2,30,'School of Law');
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `CourseID` varchar(10) NOT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('AAH121','History of Art and Architecture I','Introduction to visual cultures of ancient and medieval worlds',3),('AAH122','History of Art and Architecture II','Continuation of History of Art I',3),('AAH305','Theory and Methods of Art and Arch History','Deepen understanding of modes of art history analysis',3),('AAH311','History of American Art','Survey of the history of painting, sculpture and Minor arts',3),('ACCTG201','Accounting I: Financial','A study of the fundamentals of Accounting',3),('ACCTG202','Accounting II: Managerial','Continuation of ACCTG 201',3),('ACCTG209','Financial Management for the Arts','Intended for non-business students minoring in Arts Management',3),('ACCTG304','Intermediate Accounting I','Deeper study of financial accounting principles',3),('ACCTG305','Intermediate Accounting II','Topics include long-term investments',3),('ACCTG307','Accounting Information Systems','Study and use of computerized general ledger',3),('AMST100','Approaches to the Study of Society','Introduction to American Studies',3),('AMST201','AS Research Methods','Theory and practice of AS research methods',3),('AMST301','Junior Community Colloquium','Community based service projects',3),('AMST318','Movies in American Culture','Examination of movies and moviegoing',3),('ANTH100','Intro to Cultural Anthropology','Introduction to Anthropology',3),('ANTH200','Native North Americans','Survey of native North American peoples',3),('ANTH205','Religious Diversity in Global Perspectives','Cross-cultural exploration of religious belief',3),('ANTH212','Studies in Anthropology','Field Methods',3),('AQS262','Aquarium Design and Life Support','System Design and Life Support and Lab',4),('AQS264','Aquatic Animal Husbandry and Lab','Survey of Captive fish and invertebrates',4),('AQS306','Principls of Museum Exhibit Development','Basic aspects of successful exhibit design',3),('AQS352','Public Aquarium Management','Management of a large public aquarium facility',3),('ARCH100','Exploring Architecture','Introduction to architectural issues',3),('ARCH101','Foundations of Architecture','Introduction to the nature of the architectural endeavor',3),('ARCH113','Architectural Design Core Studio I','Introduction to fundamentals of arch. design',5),('ARCH114','Architectural Design Core Studio II','Continues from ARCH113',5),('BIO103','Biology I and Lab','Foundation for science-based disciplines',4),('BIO104','Biology II and Lab','Highlights the mechanisms of evolution',4),('BIO105','Life Science for Elem Educ. and Lab','Foundation in biological sciences for elementary teachers',4),('BIO200','Genetics','Fundamental concepts of inheritance, variation, mutation and evolution',4),('BIO204','Introduction to Marine Biology','Introduction to marine ecosystems',3),('BIO210','Botany and Lab','Survey course investigatingsystematic, development of plants',4),('BUSN100','Enterprise','Enterprise planning',3),('BUSN305','Legal Environment of Business I','Examines major areas of law concerning contemporary business',3),('BUSN306','Legal Environment of Business II','Focus on selected topics in business law',3),('BUSN401','Arts Management Capstone','Concluding course in Arts Management',3),('BUSN408','Business Ethics','Ethical and social issues in organizations',3),('CD101','Strategies in Community Revitalization','Introduction to field of community development',3),('CD220','Elements of Community Development','Overview of concepts in the field of community development',3),('CD252','Roles Systems in Commun. Organiz.','Organizational concepts typically used in org. settings',3),('CD350','Housing and Development Skills','Analysis and theory of housing policy',3),('CHEM190','Introduction to Chemical Principles','Introduction to Chemistry',3),('CHEM191','Principles of Chemistry I and Lab','Examines development of structure of matter',4),('CHEM192','Principles of Chemistry II and Lab','Continuation of Chemistry 191',4),('CHEM201','Environmental Chemistry and Lab','Examines human impact of global environ. chemical products and processes',4),('CHN101','Elementary Chinese I','First course in modern Standard Chinese (Mandarin)',3),('CHN102','Elementary Chinese II','Second course in Standard Chinese (Mandarin)',3),('CHN201','Intermediate Chinese I','First course in second year modern Chinese',3),('CHN202','Intermediate Chinese II','Second course in second year modern Chinese',3),('CIS100','Intro to Personal Computer HW','Introduction to fundamentals of PC hardware',3),('CIS102','Computer Applications in Business','Introduces elements of business conducted via the Web',3),('CIS105','Data Analysis with Excel','Fundamental skills of analysis of data and large datasets',3),('CIS200','Intro to Programming: Animation and Games','Introduces the basic concepts of computer programs',3),('CIS202','Technology for the Arts','Introduction to common computing tech in arts organization',3),('CIS335','Intro to Database Design','Introduction to Database Design',3),('CIS350','Geographic Information Sysems','Geographic Information Systems',3),('CJS105','Introduction to Criminal Justice','Overview of American criminal justice system',3),('CJS106','Applied Concepts in Justice Studies','Provide better understanding of relationship btwn. criminal justice and legal studies',3),('CJS150','Policing in America','Review of history of policing and police functioning',3),('CJS200','Introduction to Criminalistics','Instruction in collection and preservation of evidence',3),('CJS201','Substantive Criminal Law','Introductory analysis of substantive criminal law',3),('CJS203','Criminal Procedure','Analyzes US Supreme Court decisions in Fourth, Fifth, and Sixth Amendment cases',3),('CJS210','Law of Evidence','Analysis of common law and rules of evidence',3),('CJS216','Organized Crime','In-depth study of organized crime in the United States',3),('CNST100','Introduction to Construction Management','Introduction to college and the construction industry',3),('CNST116','Computer Applications for Construction','Uses the computer for analysis of construction problems',3),('CNST200','Construction Methods and Materials and Lab','Behavior and properties of materials commonly used in construction',4),('CNST201','Advanced Construction Materials and Lab','Advanced studies in construction buiding materials',4),('CNST250','Construction Equipment','Emphasis on engineering construction equipment',3),('CNST260','Construction Estimating and Scheduling','Introduction to fundamentals of construction estimating',3),('COMM100','Introduction to Communication','Introduction to communication studies',3),('COMM101','Introduction to Mass Media','Introduces students to the information age',3),('COMM165','Introduction to Visual Communication','Elementary introduction to principles of visual communication',3),('COMM210','Introduction to Public Speaking','Emphasizes effective speaking techniques',3),('CW210','Form in Poetry','Foundation course in essential poetic forms',3),('CW220','Narrative in Writing the Short Story','Foundation course in the elements of narrative structure',3),('CW241','Introduction to Playwriting','Critical study of major contemporary playwrights',3),('CW242','Screenwriting','Elements of conceptualization, shooting, editing and finishing of a short film',3),('DANCE101','The Creative Athlete','Examines creative process in relation to the athleticism of movement',3),('DANCE131','Mime Workshop','Fundamental techniques of mime',3),('DANCE150','Introduction to Dance Technique','Explores dance as an art form with various dance techniques',3),('DANCE161','Tap and Theature Dance Styles I','Explores dance idioms as used in performance',3),('DANCE162','Tap and Theature Dance Styles II','Explores dance idioms as used in performance',3),('DANCE200','Elementary Contemp Technique','Introduction to physical and expressive rigor of modern dance',3),('DSGN100','Introduction to Design Communication','Introduces fundamental design process using graphic design',3),('DSGN110','Introduction to Typography','Study of typographic form building on DSGN 100',3),('DSGN200','History of Design Communication','Examine the development of graphic design communication',3),('DSGN210','Advanced Design Communication','Building on fundamental skills acquired in foundation',3),('DSGN220','Advanced Typography','Building on design and type foundation from basic course',3),('ECON111','Principles of Microeconomics','Introduction to modern market economy',3),('ECON112','Principles of Macroeconomics','Introduction to national economy',3),('ECON211','Intermediate Microeconomics','Introduces a deeper analysis of individual markets',3),('ECON212','Intermediate Macroeconomics','Provides deeper analysis of basic market economies',3),('ECON303','Introduction to Econometrics','Introduction to use of statistical methods to estimage economic models',3),('ECON310','Monetary Economics','Overview of the financial system',3),('EDU200','Foundations of Education','Examines historical, philosophical and social issues of teaching',3),('EDU202','Psychology of Learning and Development','Explores how learning is influenced by development, exper. and maturation',3),('EDU302','Literacy in the Elementary School I','Examines emergence of young childrens knowledge of English Language',3),('EDU303','Literacy in the Elementary School II','Builds on EDU 302',3),('EMS101','Introduction to Health Professions','Covers aspects of government structure, risk and HR and financial management',3),('EMS121','EMT Basic','Learn skills in basic life support',6),('EMS211','EMT Paramedic I','Over 172 hours of classroom lecture and training/demonstration',6),('EMS212','EMT Paramedic II','Continuation of EMS 211. Helps prepare for certification',6),('EMS301','Health Informaton Systems and Technology','Cover aspects of gov. structure, leadership, marketing',3),('ENG100','Introduction to Literature','Introductory course in active, responsive reading',3),('ENG110','Serpents, Swords and Symbols','Learn the universal language of symbols from ancient cultures to present',3),('ENG210','Myth, Fantasy and the Imagination','Identify archetypes found in folk tales and fairy tales',3),('ENG220','Literary Analysis','Practice close reading across a range of critical theories',3),('ENG240','Early American Literature','Exploration of 15th and 16th centuries in writing and literature',3),('ENGR110','Engineering Graphics and Design','Introduction to engineering design process and SolidWorks',3),('ENGR115','Compuer Applications for Engineering','Analysis of typical engineering problems using computers',3),('ENGR210','Engineering Statics','Study static equilibrium of forces',3),('ENGR220','Engineering Dynamics','Kinematics and dynamics of particles and rigid bodies',3),('ENGR240','Circuit Theory and Lab','Analysis of DC and AC electric circuits',4),('FILM101','Introduction to Film Studies','Introduction to development of film forms, styles and theories',3),('FILM200','Global History of Film','Survey in developments in global film history',3),('FILM270','Documentary Film','Examine critical approaches to the documentary genre',3),('FILM299','Special Topics in Film Studies','Examines topics in Film Studies',3),('FILM300','Film Theory and Criticism','Analysis of how filmmakers use sound and image to tell stories',3),('FILM350','Directors and Style','Vision, the style and the body of work of cinema directors',3),('FNCE301','Financial Management','Application of financial theory, tools and methods',3),('FNCE305','Risk Management and Insurance','Appreciation of fundamental insurance principles',3),('FNCE325','Principles of Investments','Survey of investment risks and rewards',3),('FNCE326','Options, Futures and Other Derivatives','Focus on use of options, futures and other derivatives',3),('FNCE327','Personal Financial Planning','Focus on concepts, tools and applications of retirement and estate planning',3),('FREN101','Elementary French I','First course in elements of a language and its culture',3),('FREN102','Elementary French II','Continuation of elementary Language I',3),('FREN201','Intermediate French I','First of two-course sequence extending fundamental skills',3),('FREN202','Intermediate French II','Continuation of Intermediate Language I',3),('GER101','Elementary German I','First course in elements of language and its culture',3),('GER102','Elementary German II','Continuation of Elementary Language I',3),('GER201','Intermediate German I','First course extending fundamental skills',3),('GER202','Intermediate German II','Continuation of Intermediate Language I',3),('GRK101','Elementary Ancient Greek I','Essentials of grammar and syntax of ancient Greek',3),('GRK102','Elementary Ancient Greek II','Second cours for essentials of grammar and syntax of ancient Greek',3),('GRK201','Intermediate Ancient Greek I','Readings in the original language and literature',3),('GRK202','Intermediate Ancient Greek II','Second cours  introducing Plato and Xenophon',3),('HCA105','Introduction to Public Health','Introduction to health care fields on state and national level',3),('HCA320','Human Resource Development','Understanding, assessing and designing learning experiences',3),('HCA350','Financial Mgt of a Long Term Care Facility','Study of techniques for gathering financial information',3),('HCA413','Moral and Ethical Issues in Health Care','Introduction to moral and ethical issues',3),('HIST101','History of Western Civilization I','Examines Western civilization from Greece and Near East',3),('HIST102','History of Western Civilization II','Examines European politics from 17th century',3),('HIST151','US History I','Political, economic, social and cultural development',3),('HIST152','US History II: Reconstruction to Present','Development of the US from Reconstruction to Present',3),('HP150','Introduction to Historic Preservation','Introduction to study, interpretation of resources',3),('HP160','American Buildings and Western Tradition','Survey of architecture in America',3),('HP175','Historic Building Documentation','Addresses documentation programs, tools and techniques',3),('HP301','Principles of Architectural Conservation','Overview of the role of architectural conservator',3),('IB250','International Business: Eur. Union','Concentration on EU integration, history goals and objectives',3),('IB303','EU and the US, Emerg. Mkts','Topics related to the nature of emerging markets',3),('IB306','International Business and Trade Disputes','Develop understanding of internation business issues',3),('IB320','Business and Mgt of Art and Culture','Study of the past and current structure of mkt for visual art',3),('IT110','Technology and Society','Review of literature dealing with futuristic trends',3),('IT119','Manufacturing Processes','Study of materials, processes and equip. used in industry today',3),('IT215','Hazardous Materials Safety Mgt','Acquaints student with hazardous materials technology',3),('IT219','Manufacturing and Environmental Issue','Continuation of Manuf. Processes I',3),('ITAL101','Elementary Italian I','First course in elements of a language',3),('ITAL102','Elementary Italian II','Continuation of Elementary Language I',3),('ITAL201','Intermediate Italian I','Extends fundamental skills from Elementary',3),('ITAL202','Intermediate Italian II','Continuation of Intermediate Language I',3),('JOUR170','News I: Basic Journalism','Introduction to fundamentals of journalism',3),('JOUR270','Journalism and Society','Introduction to history of journalism',3),('JOUR280','Feature Writing','Techniques for writing feature stories',3),('JOUR299','Special Topics in Journalism','Topics from various content areas of journalism',3),('JOUR315','Introduction to Photo-Journalism','Introduction to photo-journalism',3),('LALS100','Introduction to Latin American Studies','Introuction to LA culture, sociaety economics and politics',3),('LALS299','Topics in Latin American Studies','Topics from interdisciplinary perspective of LA Studies',3),('LEAD501','Leaders and the Leadership Process','Principles of leadership, traits and behaviors',3),('LEAD502','Communication Skills for Leadership','DEvelopment of communication skills required',3),('LEAD503','Data Mgt and Analysis for Leaders','The use of quantitative analysis and techniques for leaders',3),('LEAD504','Inclusive Excellence and Leadership','Theory and practice of diversity leadership',3),('LEAD509','Negotiation Strategies','Negotiation as a process',3),('LS101','The American Legal System','Introduction to the US legal system',3),('LS150','Law and Society','Examines role of law and our legal system',3),('LS207','Law and Family','The nature of the relationship between law and families',3),('LS315','Concepts in Legal Advocacy','Introduction to trial advocacy, practice and procedure',3),('LS330','Comparative Legal Systems','Survey of the legal system of selected foreign countries',3),('MATH110','Mathematics in the Modern World','Survey of mathematics for non-technical students',3),('MATH115','Mathematics for Elem Education I','Mathematical topics for elementary school teachers',3),('MATH116','Mathematics for Elem Education II','Mathematical topics for elementary school teachers',3),('MATH117','College Algebra','Covers linear and quadratic equations and inequalities',3),('MATH136','Precalculus','Focus on functions, definitions, properties and applications',3),('MATH141','Finite Mathematics','For business majors and builds algebraic skills',3),('MATH213','Calculus I and Lab','Differencital calculus single variable',4),('MGMT200','Management Principles','Analysis of general management, org and org behavior',3),('MGMT302','Organizational Behavior','Develop better understanding of human behavior',3),('MGMT303','EU and the US in Emerging Mkts','Strategic topics related tothe nature of emerging markets',3),('MGMT310','Human Resource Management','Introduction to theories and practices of copr. personnel mgt',3),('MRKT200','Marketing Principles','Emphasizes marketing problems and practices',3),('MRKT301','Advertising Principles','Survey of the role of advertising',3),('MRKT302','Advertising Campaigns','Builds knowledge of creative advertising',3),('MRKT305','Marketing Research','Examines nature and scope of fundamental marketing research',3),('MUSIC131','Piano Lessons','Weekly Private piano lesson instruction',1),('MUSIC132','Guitar Lessons','Weekly private guitar lesson instruction',1),('MUSIC133','Voice Lessons','Weekly private voice lesson instruction',1),('MUSIC134','Music Composition','Weekly private composition instruction',1),('NATSC103','Earth Systems Science and Lab','Foundation course in Environ. Science',4),('NATSC105','Earth and Physical Science for Elem. Educ.','Foundation in Earch sciences for elem. school teachers',4),('NATSC203','Humans, Environ. Change','Effects of human populations on environmenal changes',3),('NATSC204','Principles of Oceanography','Introduction to four interrelated disciplines',3),('NATSC301','Marine Resource Management','Biological, chemical, and geological coastal resources',3),('PA201','Public Administration','Introduction to theory, forms and practice of public admin',3),('PA202','Studies in Public Administration','Examines relationship between theory and practice',3),('PA305','State and Local Government','Analysis of state and local governments',3),('PA306','City Management','Study of municipal administration',3),('PHIL100','Introduction to Philosophy','Introduction to philosophy shaping human experience',3),('PHIL181','Philosophy in Film','Introduction to selected areas in philosophy through film',3),('PHIL200','Ethics','Introduction to moral philosophy',3),('PHIL205','Logic','Introduction to sound reasoning through discussion',3),('PHYS109','Algebra based and Lab','Introduction to physics without calculus',4),('PHYS110','Physics II - Algebra based','Simple harmonic motion, vibrations and waves',4),('PHYS201','Physics I with Calculus','Introduction to physics using calculus',4),('PHYS202','Physics II with Calculus','Covers vibration and waves, magnetism, optics',4),('PLS100','Introduction to Law, Legal Studies','Introduction to the law and the American legal system',3),('PLS101','Criminal Law for the Paralegal','Analysis of substantive criminal law, federal and state',3),('PLS110','Emerging Technologies in Legal','Using computer SW packages for legal documents',3),('PLS120','Law in Contemporary Society','Overview of Americal legal institutions, fed, state, local',3),('PLS200','Environmental Law','Analysis and overview of major federal laws for environmental protection',3),('POLSC100','American Government and Politics','Examiniaton of how things get done politically in the US',3),('POLSC110','The United States in World Affairs','Explores US involvement in the world since WWII',3),('POLSC120','Comparative Politics','Introduction to comparative method of studying politics',3),('POLSC200','The Constitution and American Politics','Analysis of nature of civil liberties and civil rights',3),('POLSC202','Congress and the Legislative Process','Study of devel, organ. structure dynamics of US Congress',3),('PR111','Writing for the Mass Media','Sill-based course introducing writing news for mass media',3),('PR200','Principles and Practices of Public Relations','Introduction to field of public relations',3),('PR340','Public Relations Research Methods','Introduction to philosophy and process of research',3),('PR350','Public Relations Techniques','Introduction to various skills used by publ relations professionals',3),('PSYCH100','Introduction to Psychology','Introduction to basic conceptural approaches',3),('PSYCH201','Psychology of Learning','Basic principles of learning and analysis of behavior',3),('PSYCH205','Psychology and Work','How psychology is applied in industry and business settings',3),('PSYCH206','Psychology of Loss','Focus on death, dying, grieving process and social support',3),('SEC100','Introduction to Personal Computer Hardware','Introduction to fundamentals of personal computer hardware',3),('SEC101','Introduction to Computer Software','Installation, configuration and troubleshooting of SW/OS components',3),('SEC200','Introduction to Computer Security Techniques','Introduction to techniques for managing security in IT',3),('SEC201','Introduction to Networking','Develop basic networking skills in TCP/IP',3),('SEC205','C++ Programming','Basic programming course to introduce tech professionals to C++ language',3),('SEC210','Linux Shell Scripting','Introduction to scripting as a programming tool',3),('SEC330','Penetration Teting I','Focused on hacking and counter-hacking methods',3),('SHS100','Foundations of Social and Health Svcs','Emphasis on theoretical bases of developmental psychology',3),('SHS110','Health and Nutrition','Introduces orthobiotic living',3),('SHS120','Introduction to Gerontology','Introduction to the study of aging',3),('SHS238','Introduction to Biostatistics','Principles of biostatistics, including research process',3),('SHS250','Introduction to Epidemiology','Basic principles of epidemiology',3),('SHS310','Social Gerontology','Broad base of knowledge about the process of aging',3),('SOC100','Introduction to Sociology','Study of individuals in society',3),('SOC201','Social Stratification','Foundation in classic and contemporary approaches to stratification',3),('SOC220','Sociological Perspectives on Race','Focus on progress and challenges of post-civil rights era in the US',3),('SOC230','Population and Society','Analyzes global population characteristics and trends',3),('SOCSC240','Quantitative Analysis in Social Science','Study of statistical conceps used in social science',3),('SOCSC340','Social Science Research Methods','Introduction to process of obtaining facts regarding social problems',3),('SOCSC436','Social Science Seminar','Capstone course for social science undergraduate students',3),('SPN101','Elementary Spanish I','First course in the elemtns of a language and culture',3),('SPN102','Elemenary Spanish II','Continuation of Elementary Language I',3),('SPN201','Intermediate Spanish I','First course in intermediate language',3),('SPN202','Intermediate Spanish II','Continuation of Intermediate Language I',3),('THEAT110','Acting I','Focus on elements which form the basis for the art and craft of acting',3),('THEAT122','Stagecraft','Lab to familiarize student with practical areas of technical theatre',1),('THEAT123','Design for the Theatre','Study of scenery, costume, lighting and sound design for the theatre',3),('THEAT130','The Art of the Theatre','A broad examination into the whole theatre craft',3),('TLM110','Technology and Society','Review of the lierature dealing with futuristic trends',3),('TLM119','Manufacturing Processes','Study of materials, processes and equipment used in industry',3),('TLM215','Hazardous Materials Safety Management','Acquaints student with hazardous materials technology regulations',3),('TLM219','Manufacturing and Environmental Issue','Continuation of Manufacturing Processes I',3),('TLM241','Introduction to Environmental Studies','Foundation in environmental management practices',3),('URBN100','Introduction to Urban Studies','Introduction to various ways of looking about the city',3),('URBN299','Special Topics in Urban Studies','Special topics dealing with significant issues and themes',3),('URBN400','Urban Studies Colloquium','Investigate how to integrate various perspectives using diverse methods',3),('URBN430','Advanced Special Topics in Urban Studies','Variable content course dealing with significant issues in Urban Studies',3),('VARTS101','Foundations of Drawing','Introduction to various drawing materials and methods',3),('VARTS131','Foundations of Sculpture','Introduction to 3 dimensional work',3),('VARTS161','Foundations of Photography','Fundamentals of film, darkroom, digital based photography',3),('VARTS181','Foundations of Painting','Explore color mising and color theory using water-based materials',3),('WTNG100','Introduction to Academic Writing','Cultivate rhetorical and writing process knowledge and understanding',3),('WTNG102','Expository Writing','Develop an conceptural map of how writing works',3),('WTNG200','Critical Writing for Social Sciences','Learn to develop a research problem, investigate and address the problem',3),('WTNG220','Critical Writing for the Professions','Guidelines for persuasive writing used in business',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dayofweek`
--

DROP TABLE IF EXISTS `dayofweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dayofweek` (
  `DayWeekID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DayWeekID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dayofweek`
--

LOCK TABLES `dayofweek` WRITE;
/*!40000 ALTER TABLE `dayofweek` DISABLE KEYS */;
INSERT INTO `dayofweek` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `dayofweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `SSN` char(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `universityName` varchar(30) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `fk_Employee_university1_idx` (`universityName`),
  CONSTRAINT `fk_Employee_university1` FOREIGN KEY (`universityName`) REFERENCES `university` (`universityName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Santhosh','Abraham','2007-12-31 00:00:00',NULL,NULL,'Santhosh.Abraham@rwu.edu',NULL,'Roger Williams university'),(2,'Brandon','Abrahams','2015-01-20 00:00:00',NULL,NULL,'Brandon A.Abrahams@rwu.edu',NULL,'Roger Williams university'),(3,'Maxine','Abrams','2002-08-26 00:00:00',NULL,NULL,'Maxine.Abrams@rwu.edu',NULL,'Roger Williams university'),(4,'Terry','Abrams','2014-06-19 00:00:00',NULL,NULL,'Terry.Abrams@rwu.edu',NULL,'Roger Williams university'),(5,'Maria','Allison','1987-07-27 00:00:00',NULL,NULL,'Maria.Allison@rwu.edu',NULL,'Roger Williams university'),(6,'Brian','Allman','2005-01-11 00:00:00',NULL,NULL,'Brian K.Allman@rwu.edu',NULL,'Roger Williams university'),(7,'Michael','Alloy','2017-12-04 00:00:00',NULL,NULL,'Michael J.Alloy@rwu.edu',NULL,'Roger Williams university'),(8,'Charmaine','Callahan','2013-01-24 00:00:00',NULL,NULL,'Charmaine.Callahan@rwu.edu',NULL,'Roger Williams university'),(9,'Kurt','Callahan','2006-06-28 00:00:00',NULL,NULL,'Kurt E.Callahan@rwu.edu',NULL,'Roger Williams university'),(10,'Christopher','Crosby','2014-05-12 00:00:00',NULL,NULL,'Christopher F.Crosby@rwu.edu',NULL,'Roger Williams university'),(11,'Juliece','Crosby','2018-10-20 00:00:00',NULL,NULL,'Juliece.Crosby@rwu.edu',NULL,'Roger Williams university'),(12,'Victoria','Crosby','2019-01-03 00:00:00',NULL,NULL,'Victoria L.Crosby@rwu.edu',NULL,'Roger Williams university'),(13,'Bennie','Crosson','1984-01-03 00:00:00',NULL,NULL,'Bennie.Crosson@rwu.edu',NULL,'Roger Williams university'),(14,'Matthew','Crouch','1976-05-03 00:00:00',NULL,NULL,'Matthew D.Crouch@rwu.edu',NULL,'Roger Williams university'),(15,'Andre','Crowder Jr','2007-07-11 00:00:00',NULL,NULL,'Andre.Crowder Jr@rwu.edu',NULL,'Roger Williams university'),(16,'Gregory','Crowder','2004-06-07 00:00:00',NULL,NULL,'Gregory B.Crowder@rwu.edu',NULL,'Roger Williams university'),(17,'Carlos','Espinosa','2017-07-10 00:00:00',NULL,NULL,'Carlos A.Espinosa@rwu.edu',NULL,'Roger Williams university'),(18,'Melvin','Estep','2010-04-12 00:00:00',NULL,NULL,'Melvin.Estep@rwu.edu',NULL,'Roger Williams university'),(19,'Mark','Gibbs Jr.','2019-04-08 00:00:00',NULL,NULL,'Mark E.Gibbs Jr.@rwu.edu',NULL,'Roger Williams university'),(20,'Michael','Hallmen','2015-11-23 00:00:00',NULL,NULL,'Michael A.Hallmen@rwu.edu',NULL,'Roger Williams university'),(21,'Stephen','Halstead','1998-08-14 00:00:00',NULL,NULL,'Stephen A.Halstead@rwu.edu',NULL,'Roger Williams university'),(22,'William','Halterman','1970-10-14 00:00:00',NULL,NULL,'William A.Halterman@rwu.edu',NULL,'Roger Williams university'),(23,'John','Hammock','1995-01-30 00:00:00',NULL,NULL,'John.Hammock@rwu.edu',NULL,'Roger Williams university'),(24,'Alisa','Hammond','2003-09-09 00:00:00',NULL,NULL,'Alisa V.Hammond@rwu.edu',NULL,'Roger Williams university'),(25,'Fard','Hammond','2016-11-21 00:00:00',NULL,NULL,'Fard A.Hammond@rwu.edu',NULL,'Roger Williams university'),(26,'Keith','Kienle','2005-03-15 00:00:00',NULL,NULL,'Keith T.Kienle@rwu.edu',NULL,'Roger Williams university'),(27,'Gregory','Marshall','2005-09-06 00:00:00',NULL,NULL,'Gregory K.Marshall@rwu.edu',NULL,'Roger Williams university'),(28,'Matthew','Verga','2007-03-20 00:00:00',NULL,NULL,'Matthew A.Verga@rwu.edu',NULL,'Roger Williams university'),(29,'Barry','Verger','1989-08-28 00:00:00',NULL,NULL,'Barry S.Verger@rwu.edu',NULL,'Roger Williams university'),(30,'Daniel','Vernes','2014-01-15 00:00:00',NULL,NULL,'Daniel J.Vernes@rwu.edu',NULL,'Roger Williams university'),(31,'Andrew','Vernon','2007-10-23 00:00:00',NULL,NULL,'Andrew M.Vernon@rwu.edu',NULL,'Roger Williams university'),(32,'Albert','Vessells','2008-05-29 00:00:00',NULL,NULL,'Albert S.Vessells@rwu.edu',NULL,'Roger Williams university'),(33,'Eric','Vetters','2015-08-06 00:00:00',NULL,NULL,'Eric A.Vetters@rwu.edu',NULL,'Roger Williams university'),(34,'Douglas','Vey','2002-08-26 00:00:00',NULL,NULL,'Douglas W.Vey@rwu.edu',NULL,'Roger Williams university'),(35,'Vanessa','Vick','1995-05-08 00:00:00',NULL,NULL,'Vanessa L.Vick@rwu.edu',NULL,'Roger Williams university'),(36,'Michele','Varin','2006-01-01 00:00:00',NULL,NULL,'mvarin@rwu.edu',NULL,'Roger Williams university');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `enrollment` (
  `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(15) DEFAULT NULL,
  `SectionID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EnrollmentID`),
  KEY `fk_Enrollment_Sections1_idx` (`SectionID`),
  KEY `fk_Enrollment_Student1` (`StudentID`),
  CONSTRAINT `fk_Enrollment_Sections1` FOREIGN KEY (`SectionID`) REFERENCES `section` (`SectionID`),
  CONSTRAINT `fk_Enrollment_Student1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faculty` (
  `EmployeeID` int(11) NOT NULL,
  `HighestDegree` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `fk_Faculty_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'PhD'),(2,'PhD'),(3,'PhD'),(4,'PhD'),(5,'PhD'),(6,'PhD'),(7,'PhD'),(8,'PhD'),(9,'PhD'),(10,'PhD'),(11,'PhD'),(12,'PhD'),(13,'PhD'),(14,'PhD'),(15,'PhD'),(16,'PhD'),(17,'PhD'),(18,'PhD'),(19,'PhD'),(20,'PhD'),(21,'PhD'),(22,'PhD'),(23,'PhD'),(24,'PhD'),(25,'PhD'),(26,'PhD'),(27,'PhD'),(28,'PhD'),(29,'PhD'),(30,'PhD'),(31,'PhD'),(32,'PhD'),(33,'PhD'),(34,'PhD'),(35,'PhD'),(36,'Masters');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `major` (
  `MajorID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MajorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Accounting',''),(2,'American Studies',''),(3,'Anthropology',''),(4,'Applied Mathematics',''),(5,'Aquaculture','Aquaculture and Aquarium Science'),(6,'Architecture',''),(7,'Art','Art and Architectural History'),(8,'Arts Management',''),(9,'Biochemistry',''),(10,'Biology',''),(11,'Business',''),(12,'Business Administration',''),(13,'Business Analytics',''),(14,'Business Law',''),(15,'Chemistry',''),(16,'Chinese',''),(17,'Communication','Communication and Media Studies'),(18,'Computational Mathematics',''),(19,'Computer Science',''),(20,'Construction Management',''),(21,'Creative Writing',''),(22,'Criminal Justice',''),(23,'Cybersecurity',''),(24,'Cybersecurity and Networking',''),(25,'Dance','Dance Performance'),(26,'Digital Forensics',''),(27,'East Asian Studies',''),(28,'eBusiness',''),(29,'Economics',''),(30,'Educational Studies',''),(31,'Elementary Education',''),(32,'Engineering',''),(33,'English Literature',''),(34,'Environmental Chemistry',''),(35,'Environmental Science',''),(36,'Film Studies',''),(37,'Film, Animation and Video',''),(38,'Finance',''),(39,'Forensic Science',''),(40,'Gender and Sexuality Studies',''),(41,'Graphic Design Communication',''),(42,'History',''),(43,'International Business',''),(44,'International Relations',''),(45,'Journalism',''),(46,'Latin American Studies',''),(47,'Legal Studies',''),(48,'Management',''),(49,'Marine Biology',''),(50,'Marketing',''),(51,'Mathematics',''),(52,'Middle School Certification',''),(53,'Military Science',''),(54,'Modern Languages',''),(55,'Music',''),(56,'Painting','Painting, Drawing and Printmaking'),(57,'Performing Arts',''),(58,'Philosophy',''),(59,'Photography','Photography and Digital Media'),(60,'Physics',''),(61,'Political Science',''),(62,'Preservation Studies',''),(63,'Writing','Professional and Public Writing'),(64,'Psychology',''),(65,'Public Health',''),(66,'Public Relations',''),(67,'Secondary Education',''),(68,'Security Assurance Studies',''),(69,'Special Education',''),(70,'Theatre',''),(71,'Visual Arts',''),(72,'Web Development','');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisite`
--

DROP TABLE IF EXISTS `prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prerequisite` (
  `CourseID` varchar(10) NOT NULL,
  `PrerequisiteID` varchar(10) NOT NULL,
  PRIMARY KEY (`CourseID`,`PrerequisiteID`),
  KEY `PrerequisiteID` (`PrerequisiteID`),
  CONSTRAINT `prerequisite_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `prerequisite_ibfk_2` FOREIGN KEY (`PrerequisiteID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisite`
--

LOCK TABLES `prerequisite` WRITE;
/*!40000 ALTER TABLE `prerequisite` DISABLE KEYS */;
INSERT INTO `prerequisite` VALUES ('AAH305','AAH121'),('AAH311','AAH121'),('AAH305','AAH122'),('AAH311','AAH122'),('ACCTG202','ACCTG201'),('ACCTG304','ACCTG201'),('ACCTG307','ACCTG202'),('ACCTG305','ACCTG304'),('AMST201','AMST100'),('AMST301','AMST100'),('AMST301','AMST201'),('ANTH200','ANTH100'),('ANTH212','ANTH100'),('ARCH114','ARCH113'),('BIO200','BIO103'),('BIO210','BIO103'),('BIO200','BIO104'),('BIO210','BIO104'),('NATSC203','BIO104'),('BUSN306','BUSN305'),('BIO200','CHEM191'),('CHEM192','CHEM191'),('CHEM201','CHEM191'),('CHEM201','CHEM192'),('ACCTG307','CIS100'),('ACCTG307','CIS102'),('CJS201','CJS105'),('CJS203','CJS105'),('CJS210','CJS105'),('CJS216','CJS105'),('CJS210','CJS201'),('CNST250','CNST116'),('CNST260','CNST116'),('CNST201','CNST200'),('CNST260','CNST201'),('JOUR170','COMM101'),('JOUR270','COMM101'),('JOUR299','COMM101'),('PR200','COMM101'),('PR340','COMM210'),('PR350','COMM210'),('DSGN110','DSGN100'),('DSGN200','DSGN100'),('DSGN210','DSGN100'),('DSGN220','DSGN100'),('DSGN210','DSGN110'),('DSGN220','DSGN110'),('DSGN220','DSGN210'),('ECON211','ECON111'),('ECON303','ECON111'),('ECON212','ECON112'),('ECON303','ECON112'),('ECON310','ECON112'),('EDU302','EDU200'),('EDU303','EDU200'),('EDU302','EDU202'),('EDU303','EDU202'),('EDU303','EDU302'),('EMS211','EMS121'),('ENG220','ENG100'),('ENGR115','ENGR110'),('ENGR220','ENGR110'),('CNST250','ENGR115'),('ENGR240','ENGR115'),('ENGR220','ENGR210'),('FILM200','FILM101'),('FILM270','FILM101'),('FILM299','FILM101'),('FILM300','FILM101'),('FILM350','FILM101'),('FNCE325','FNCE301'),('FNCE326','FNCE301'),('FNCE327','FNCE301'),('HP175','HP150'),('IT219','IT119'),('TLM219','IT119'),('JOUR280','JOUR270'),('LALS299','LALS100'),('LS315','LS101'),('PHYS109','MATH117'),('PHYS201','MATH117'),('MGMT302','MGMT200'),('MGMT310','MGMT200'),('MRKT301','MRKT200'),('MRKT305','MRKT200'),('MRKT302','MRKT301'),('NATSC301','NATSC103'),('PHYS110','PHYS109'),('PHYS202','PHYS201'),('PA306','POLSC100'),('POLSC200','POLSC100'),('POLSC202','POLSC100'),('PSYCH201','PSYCH100'),('PSYCH205','PSYCH100'),('PSYCH206','PSYCH100'),('SEC200','SEC100'),('SEC201','SEC100'),('SEC330','SEC200'),('SOC201','SOC100'),('SOC220','SOC100'),('SOC230','SOC100'),('URBN299','URBN100'),('URBN400','URBN100'),('JOUR315','VARTS161'),('WTNG102','WTNG100'),('WTNG200','WTNG102'),('WTNG220','WTNG102');
/*!40000 ALTER TABLE `prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `section` (
  `SectionID` varchar(20) NOT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `ClassNumber` varchar(6) NOT NULL,
  `CourseID` varchar(10) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `fk_Sections_Classroom1_idx` (`ClassNumber`),
  KEY `fk_Sections_Course1_idx` (`CourseID`),
  KEY `fk_Sections_Faculty1_idx` (`EmployeeID`),
  CONSTRAINT `fk_Sections_Classroom1` FOREIGN KEY (`ClassNumber`) REFERENCES `classroom` (`ClassNumber`),
  CONSTRAINT `fk_Sections_Course1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `fk_Sections_Faculty1` FOREIGN KEY (`EmployeeID`) REFERENCES `faculty` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('ACCTG202-01-SP20','08:00:00','09:00:00','SB101','ACCTG202',10),('ACCTG202-02-SP20','08:00:00','09:00:00','SB102','ACCTG202',11),('ACCTG202-03-SP20','10:00:00','11:00:00','SB222','ACCTG202',10),('ACCTG202-04-SP20','11:00:00','12:00:00','SB222','ACCTG202',10),('ACCTG305-01-SP20','09:00:00','10:30:00','SB223','ACCTG305',1),('ACCTG305-02-SP20','13:00:00','14:30:00','SB101','ACCTG305',1),('AMST201-01-SP20','09:00:00','10:00:00','AS201','AMST201',24),('AMST201-02-SP20','11:00:00','12:00:00','AS201','AMST201',24),('CIS102-01-SP20','08:00:00','09:00:00','SB301','CIS102',25),('CIS102-02-SP20','09:00:00','10:00:00','SB301','CIS102',25),('CIS335-01-SP20','18:30:00','21:10:00','SB223','CIS350',36),('CIS350-01-SP20','08:00:00','09:30:00','SB222','CIS335',36),('POLSC200-01-SP20','09:00:00','10:00:00','AS101','POLSC200',5),('POLSC200-02-SP20','11:00:00','12:00:00','AS101','POLSC200',5),('POLSC200-03-SP20','13:00:00','14:30:00','AS102','POLSC200',5);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectionday`
--

DROP TABLE IF EXISTS `sectionday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sectionday` (
  `SectionDayID` int(11) NOT NULL AUTO_INCREMENT,
  `DayWeekID` int(11) DEFAULT NULL,
  `SectionID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SectionDayID`),
  KEY `fk_SectionDay_Section1_idx` (`SectionID`),
  KEY `fk_SectionDay_DayOfWeek1` (`DayWeekID`),
  CONSTRAINT `fk_SectionDay_DayOfWeek1` FOREIGN KEY (`DayWeekID`) REFERENCES `dayofweek` (`DayWeekID`),
  CONSTRAINT `fk_SectionDay_Section1` FOREIGN KEY (`SectionID`) REFERENCES `section` (`SectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectionday`
--

LOCK TABLES `sectionday` WRITE;
/*!40000 ALTER TABLE `sectionday` DISABLE KEYS */;
INSERT INTO `sectionday` VALUES (1,1,'ACCTG202-01-SP20'),(2,3,'ACCTG202-01-SP20'),(3,5,'ACCTG202-01-SP20'),(4,1,'ACCTG202-02-SP20'),(5,3,'ACCTG202-02-SP20'),(6,5,'ACCTG202-02-SP20'),(7,1,'ACCTG202-03-SP20'),(8,3,'ACCTG202-03-SP20'),(9,5,'ACCTG202-03-SP20'),(10,1,'ACCTG202-04-SP20'),(11,3,'ACCTG202-04-SP20'),(12,5,'ACCTG202-04-SP20'),(13,2,'ACCTG305-01-SP20'),(14,4,'ACCTG305-01-SP20'),(15,2,'ACCTG305-02-SP20'),(16,4,'ACCTG305-02-SP20'),(17,5,'AMST201-02-SP20'),(18,1,'CIS102-01-SP20'),(19,3,'CIS102-01-SP20'),(20,5,'CIS102-01-SP20'),(21,1,'CIS102-02-SP20'),(22,3,'CIS102-02-SP20'),(23,5,'CIS102-02-SP20'),(24,4,'CIS335-01-SP20'),(25,4,'CIS350-01-SP20'),(26,4,'POLSC200-03-SP20');
/*!40000 ALTER TABLE `sectionday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_major`
--

DROP TABLE IF EXISTS `stud_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stud_major` (
  `Stud_MajorID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(15) DEFAULT NULL,
  `MajorID` int(11) DEFAULT NULL,
  `Declared` date DEFAULT NULL,
  PRIMARY KEY (`Stud_MajorID`),
  KEY `fk_Stud_Major_Major1_idx` (`MajorID`),
  KEY `fk_Stud_Major_Student` (`StudentID`),
  CONSTRAINT `fk_Stud_Major_Major1` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`),
  CONSTRAINT `fk_Stud_Major_Student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_major`
--

LOCK TABLES `stud_major` WRITE;
/*!40000 ALTER TABLE `stud_major` DISABLE KEYS */;
INSERT INTO `stud_major` VALUES (1,'student1031',19,'2019-01-01'),(2,'student1030',19,'2019-01-01'),(3,'student1029',1,'2019-01-01'),(4,'student1028',2,'2019-01-01'),(5,'student1027',3,'2019-01-01'),(6,'student1027',4,'2019-01-01'),(7,'student1026',4,'2019-01-01'),(8,'student1025',15,NULL),(9,'student1024',10,NULL),(10,'student1023',10,NULL),(11,'student1022',11,NULL),(12,'student1021',11,NULL),(13,'student1020',20,NULL),(14,'student1019',20,NULL),(15,'student1018',20,NULL),(16,'student1017',25,NULL),(17,'student1017',1,NULL),(18,'student1016',1,NULL),(19,'student1015',30,NULL),(20,'student1014',31,NULL),(21,'student1013',3,NULL),(22,'student1012',8,NULL),(23,'student1011',8,NULL),(24,'student1010',22,NULL),(25,'student1009',22,NULL),(26,'student1008',35,NULL),(27,'student1007',17,NULL),(28,'student1006',17,NULL),(29,'student1005',16,NULL),(30,'student1004',15,NULL),(31,'student1003',11,NULL),(32,'student1002',4,NULL),(33,'student1001',19,NULL);
/*!40000 ALTER TABLE `stud_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `StudentID` varchar(15) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` varchar(10) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `Year` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('student1001','James','Butt','6649 N Blue Gum St','New Orleans','LA','70116','504-621-8927','jbutt@gmail.com',NULL,NULL,NULL),('student1002','Josephine','Darakjy','4 B Blue Ridge Blvd','Brighton','MI','48116','810-292-9388','josephine_darakjy@darakjy.org',NULL,NULL,NULL),('student1003','Art','Venere','8 W Cerritos Ave #54','Bridgeport','NJ','08014','856-636-8749','art@venere.org',NULL,NULL,NULL),('student1004','Lenna','Paprocki','639 Main St','Anchorage','AK','99501','907-385-4412','lpaprocki@hotmail.com',NULL,NULL,NULL),('student1005','Donette','Foller','34 Center St','Hamilton','OH','45011','513-570-1893','donette.foller@cox.net',NULL,NULL,NULL),('student1006','Simona','Morasca','3 Mcauley Dr','Ashland','OH','44805','419-503-2484','simona@morasca.com',NULL,NULL,NULL),('student1007','Mitsue','Tollner','7 Eads St','Chicago','IL','60632','773-573-6914','mitsue_tollner@yahoo.com',NULL,NULL,NULL),('student1008','Leota','Dilliard','7 W Jackson Blvd','San Jose','CA','95111','408-752-3500','leota@hotmail.com',NULL,NULL,NULL),('student1009','Sage','Wieser','5 Boston Ave #88','Sioux Falls','SD','57105','605-414-2147','sage_wieser@cox.net',NULL,NULL,NULL),('student1010','Kris','Marrier','228 Runamuck Pl #2808','Baltimore','MD','21224','410-655-8723','kris@gmail.com',NULL,NULL,NULL),('student1011','Minna','Amigon','2371 Jerrold Ave','Kulpsville','PA','19443','215-874-1229','minna_amigon@yahoo.com',NULL,NULL,NULL),('student1012','Abel','Maclead','37275 St  Rt 17m M','Middle Island','NY','11953','631-335-3414','amaclead@gmail.com',NULL,NULL,NULL),('student1013','Kiley','Caldarera','25 E 75th St #69','Los Angeles','CA','90034','310-498-5651','kiley.caldarera@aol.com',NULL,NULL,NULL),('student1014','Graciela','Ruta','98 Connecticut Ave Nw','Chagrin Falls','OH','44023','440-780-8425','gruta@cox.net',NULL,NULL,NULL),('student1015','Cammy','Albares','56 E Morehead St','Laredo','TX','78045','956-537-6195','calbares@gmail.com',NULL,NULL,NULL),('student1016','Mattie','Poquette','73 State Road 434 E','Phoenix','AZ','85013','602-277-4385','mattie@aol.com',NULL,NULL,NULL),('student1017','Meaghan','Garufi','69734 E Carrillo St','Mc Minnville','TN','37110','931-313-9635','meaghan@hotmail.com',NULL,NULL,NULL),('student1018','Gladys','Rim','322 New Horizon Blvd','Milwaukee','WI','53207','414-661-9598','gladys.rim@rim.org',NULL,NULL,NULL),('student1019','Yuki','Whobrey','1 State Route 27','Taylor','MI','48180','313-288-7937','yuki_whobrey@aol.com',NULL,NULL,NULL),('student1020','Fletcher','Flosi','394 Manchester Blvd','Rockford','IL','61109','815-828-2147','fletcher.flosi@yahoo.com',NULL,NULL,NULL),('student1021','Bette','Nicka','6 S 33rd St','Aston','PA','19014','610-545-3615','bette_nicka@cox.net',NULL,NULL,NULL),('student1022','Veronika','Inouye','6 Greenleaf Ave','San Jose','CA','95111','408-540-1785','vinouye@aol.com',NULL,NULL,NULL),('student1023','Willard','Kolmetz','618 W Yakima Ave','Irving','TX','75062','972-303-9197','willard@hotmail.com',NULL,NULL,NULL),('student1024','Maryann','Royster','74 S Westgate St','Albany','NY','12204','518-966-7987','mroyster@royster.com',NULL,NULL,NULL),('student1025','Alisha','Slusarski','3273 State St','Middlesex','NJ','08846','732-658-3154','alisha@slusarski.com',NULL,NULL,NULL),('student1026','Allene','Iturbide','1 Central Ave','Stevens Point','WI','54481','715-662-6764','allene_iturbide@cox.net',NULL,NULL,NULL),('student1027','Chanel','Caudy','86 Nw 66th St #8673','Shawnee','KS','66218','913-388-2079','chanel.caudy@caudy.org',NULL,NULL,NULL),('student1028','Ezekiel','Chui','2 Cedar Ave #84','Easton','MD','21601','410-669-1642','ezekiel@chui.com',NULL,NULL,NULL),('student1029','Willow','Kusko','90991 Thorburn Ave','New York','NY','10011','212-582-4976','wkusko@yahoo.com',NULL,NULL,NULL),('student1030','Bernardo','Figeroa','386 9th Ave N','Conroe','TX','77301','936-336-3951','bfigeroa@aol.com',NULL,NULL,NULL),('student1031','Michele','Varin','4 Varin Drive','Smithfield','RI','02917',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `university` (
  `universityName` varchar(30) NOT NULL DEFAULT 'Primary Key',
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` char(2) NOT NULL,
  `Zip` varchar(10) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`universityName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES ('Roger Williams university','1 Old Ferry Road','Bristol','RI','02809','(401) 254-1040');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-21 18:45:32
