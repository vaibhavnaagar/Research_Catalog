-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 15, 2017 at 02:49 AM
-- Server version: 5.7.17-0ubuntu0.16.04.2
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `research_catalogue`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(100) NOT NULL,
  `a_institute` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`a_id`, `a_name`, `a_institute`) VALUES
(1, 'Nicolas Vuillerme', 'TIMC'),
(2, 'Cyril Burdet', 'LMAS'),
(3, 'Brice Isableu', 'EA 4042'),
(4, 'Sylvain Demetz', 'LMAS'),
(5, 'Sonja Kleinlogel', ''),
(6, 'Andrew G. White', ''),
(7, 'Alejandro Betancourt', ''),
(8, 'Pietro Morerio', ''),
(9, 'Carlo S. Regazzoni', ''),
(10, 'Matthias Rauterberg', ''),
(11, 'Adriana Kovashka', ''),
(12, 'Olga Russakovsky', ''),
(13, 'Li Fei-Fei', ''),
(14, 'Kristen Grauman', ''),
(15, 'Varun Jampani', ''),
(16, 'Sebastian Nowozin', ''),
(17, 'Matthew Loper', ''),
(18, 'Peter V. Gehler', ''),
(19, 'G. Chen', ''),
(20, 'G. Lerman', ''),
(21, 'G. Lerman', ''),
(22, 'G. Lerman', ''),
(23, 'Suraj Srinivas', ''),
(24, 'Ravi Kiran Sarvadevabhatla', ''),
(25, 'Konda Reddy Mopuri', ''),
(26, 'Nikita Prabhu', ''),
(27, 'Srinivas S S Kruthiventi', ''),
(28, 'R. Venkatesh Babu', ''),
(29, 'Dmitrii Marin', ''),
(30, 'Yuri Boykov', ''),
(31, 'Yuchen Zhong', ''),
(32, 'Nicolas Vuillerme', 'TIMC'),
(33, 'Nicolas Pinsault', 'TIMC'),
(34, 'Jacques Vaillant', 'TIMC'),
(35, 'Leonid Yaroslavsky', ''),
(36, 'Chad Goerzen', ''),
(37, 'Stanislav Umansky', ''),
(38, 'H. John Caulfield', ''),
(39, 'H. John Caulfield', ''),
(40, 'H. John Caulfield', ''),
(41, 'H. John Caulfield', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`c_id`, `c_name`) VALUES
(1, 'vision');

-- --------------------------------------------------------

--
-- Table structure for table `correspond_to`
--

CREATE TABLE `correspond_to` (
  `r_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `correspond_to`
--

INSERT INTO `correspond_to` (`r_id`, `c_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `key_map`
--

CREATE TABLE `key_map` (
  `r_id` int(11) NOT NULL,
  `w_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `key_map`
--

INSERT INTO `key_map` (`r_id`, `w_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `research_paper`
--

CREATE TABLE `research_paper` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(255) NOT NULL,
  `r_doi` varchar(255) NOT NULL,
  `r_year` year(4) NOT NULL,
  `r_pdf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `research_paper`
--

INSERT INTO `research_paper` (`r_id`, `r_name`, `r_doi`, `r_year`, `r_pdf`) VALUES
(1, 'The magnitude of the effect of calf muscles fatigue on postural control  during bipedal quiet standing with vision depends on the eye-visual target  distance', '10.1016/j.gaitpost.2005.07.011', 2008, 'http://arxiv.org/pdf/0802.1904v1'),
(2, 'The secret world of shrimps: polarisation vision at its best', '10.1371/journal.pone.0002190', 2008, 'http://arxiv.org/pdf/0804.2162v1'),
(3, 'The Evolution of First Person Vision Methods: A Survey', '10.1109/TCSVT.2015.2409731', 2014, 'http://arxiv.org/pdf/1409.1484v3'),
(4, 'Crowdsourcing in Computer Vision', '10.1561/0600000073', 2016, 'http://arxiv.org/pdf/1611.02145v1'),
(5, 'The Informed Sampler: A Discriminative Approach to Bayesian Inference in  Generative Computer Vision Models', '10.1016/j.cviu.2015.03.002', 2014, 'http://arxiv.org/pdf/1402.0859v3'),
(6, 'Motion Segmentation by SCC on the Hopkins 155 Database', '10.1109/ICCVW.2009.5457626', 2009, 'http://arxiv.org/pdf/0909.1608v1'),
(7, 'A real time vehicles detection algorithm for vision based sensors', '10.1007/978-3-642-15907-7_26', 2011, 'http://arxiv.org/pdf/1112.4060v1'),
(8, 'Sparse models for Computer Vision', '10.1002/9783527680863.ch14', 2017, 'http://arxiv.org/pdf/1701.06859v1'),
(9, 'A Taxonomy of Deep Convolutional Neural Nets for Computer Vision', '10.3389/frobt.2015.00036', 2016, 'http://arxiv.org/pdf/1601.06615v1'),
(10, 'Thin Structure Estimation with Curvature Regularization', '10.1109/ICCV.2015.53', 2015, 'http://arxiv.org/pdf/1506.04654v2'),
(11, 'Postural control during quiet standing following cervical muscular  fatigue: effects of changes in sensory inputs', '10.1016/j.neulet.2004.12.024', 2008, 'http://arxiv.org/pdf/0802.1902v1'),
(12, 'Optics-less smart sensors and a possible mechanism of cutaneous vision  in nature', '10.2478/s11534-009-0132-7', 2008, 'http://arxiv.org/pdf/0808.1225v1'),
(13, 'Use of Computer Vision to Detect Tangles in Tangled Objects', '10.1109/ICIIP.2013.6707551', 2014, 'http://arxiv.org/pdf/1405.4802v2'),
(14, 'Application of the SP theory of intelligence to the understanding of  natural vision and the development of computer vision', '10.1186/2193-1801-3-552', 2013, 'http://arxiv.org/pdf/1303.2071v2'),
(15, 'A Stochastic Grammar for Natural Shapes', '10.1007/978-1-4471-5195-1_21', 2013, 'http://arxiv.org/pdf/1303.2844v1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE `words` (
  `w_id` int(11) NOT NULL,
  `word` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`w_id`, `word`) VALUES
(1, 'The purpose of the present experiment was to investigate whether, withvision, the magnitude of the effect of calf muscles fatigue on postural controlduring bipedal quiet standing depends on the eye-visual target distance. Twelveyoung university students were asked to stand upright as immobile as possiblein three visual conditions (No vision, Vision 1m and Vision 4m) executed in twoconditions of No fatigue and Fatigue of the calf muscles. Centre of footpressure displacements were recorded using a force platform. Similar increasedvariances of the centre of foot pressure displacements were observed in thefatigue relative to the No fatigue condition for both the No vision and Vision4m conditions. Interestingly, in the vision 1m condition, fatigue yielded: (1)a similar increased variance of the centre of foot pressure displacements tothose observed in the No vision and Vision 4m conditions along themedio-lateral axis and (2) a weaker destabilising effect relative to the Novision and Vision 4m conditions along the antero-posterior axis. These resultsevidence that the ability to use visual information for postural control duringbipedal quiet standing following calf muscles fatigue is dependent on theeye-visual target distance. More largely, in the context of the multisensorycontrol of balance, the present findings suggest that the efficiency of thesensory reweighting of visual sensory cues as the neuro-muscular constraintsacting on the subject change is critically linked with the quality of theinformation the visual system obtains.'),
(2, 'Animal vision spans a great range of complexity, with systems evolving todetect variations in optical intensity, distribution, colour, and polarisation.Polarisation vision systems studied to date detect one to four channels oflinear polarisation, combining them in opponent pairs to provideintensity-independent operation. Circular polarisation vision has never beenseen, and is widely believed to play no part in animal vision. Polarisation isfully measured via Stokes parameters--obtained by combined linear and circularpolarisation measurements. Optimal polarisation vision is the ability to seeStokes parameters: here we show that the crustacean emph{Gonodactylussmithii} measures the exact components required. This vision provides optimalcontrast-enhancement, and precise determination of polarisation with noconfusion-states or neutral-points--significant advantages. We emphasise thatlinear and circular polarisation vision are not different modalities--both arenecessary for optimal polarisation vision, regardless of the presence ofstrongly linear or circularly polarised features in the animals environment.'),
(3, 'The emergence of new wearable technologies such as action cameras andsmart-glasses has increased the interest of computer vision scientists in theFirst Person perspective. Nowadays, this field is attracting attention andinvestments of companies aiming to develop commercial devices with First PersonVision recording capabilities. Due to this interest, an increasing demand ofmethods to process these videos, possibly in real-time, is expected. Currentapproaches present a particular combinations of different image features andquantitative methods to accomplish specific objectives like object detection,activity recognition, user machine interaction and so on. This paper summarizesthe evolution of the state of the art in First Person Vision video analysisbetween 1997 and 2014, highlighting, among others, most commonly used features,methods, challenges and opportunities within the field.'),
(4, 'Computer vision systems require large amounts of manually annotated data toproperly learn challenging visual concepts. Crowdsourcing platforms offer aninexpensive method to capture human knowledge and understanding, for a vastnumber of visual perception tasks. In this survey, we describe the types ofannotations computer vision researchers have collected using crowdsourcing, andhow they have ensured that this data is of high quality while annotation effortis minimized. We begin by discussing data collection on both classic (e.g.,object recognition) and recent (e.g., visual story-telling) vision tasks. Wethen summarize key design decisions for creating effective data collectioninterfaces and workflows, and present strategies for intelligently selectingthe most important data instances to annotate. Finally, we conclude with somethoughts on the future of crowdsourcing in computer vision.'),
(5, 'Computer vision is hard because of a large variability in lighting, shape,and texture; in addition the image signal is non-additive due to occlusion.Generative models promised to account for this variability by accuratelymodelling the image formation process as a function of latent variables withprior beliefs. Bayesian posterior inference could then, in principle, explainthe observation. While intuitively appealing, generative models for computervision have largely failed to deliver on that promise due to the difficulty ofposterior inference. As a result the community has favoured efficientdiscriminative approaches. We still believe in the usefulness of generativemodels in computer vision, but argue that we need to leverage existingdiscriminative or even heuristic computer vision methods. We implement thisidea in a principled way with an informed sampler and in careful experimentsdemonstrate it on challenging generative models which contain renderer programsas their components. We concentrate on the problem of inverting an existinggraphics rendering engine, an approach that can be understood as InverseGraphics. The informed sampler, using simple discriminative proposals based onexisting computer vision technology, achieves significant improvements ofinference.'),
(6, 'We apply the Spectral Curvature Clustering (SCC) algorithm to a benchmarkdatabase of 155 motion sequences, and show that it outperforms all otherstate-of-the-art methods. The average misclassification rate by SCC is 1.41%for sequences having two motions and 4.85% for three motions.'),
(7, 'A vehicle detection plays an important role in the traffic control atsignalised intersections. This paper introduces a vision-based algorithm forvehicles presence recognition in detection zones. The algorithm uses linguisticvariables to evaluate local attributes of an input image. The image attributesare categorised as vehicle, background or unknown features. Experimentalresults on complex traffic scenes show that the proposed algorithm is effectivefor a real-time vehicles detection.'),
(8, 'The representation of images in the brain is known to be sparse. That is, asneural activity is recorded in a visual area ---for instance the primary visualcortex of primates--- only a few neurons are active at a given time withrespect to the whole population. It is believed that such a property reflectsthe efficient match of the representation with the statistics of naturalscenes. Applying such a paradigm to computer vision therefore seems a promisingapproach towards more biomimetic algorithms. Herein, we will describe abiologically-inspired approach to this problem. First, we will describe anunsupervised learning paradigm which is particularly adapted to the efficientcoding of image patches. Then, we will outline a complete multi-scale framework---SparseLets--- implementing a biologically inspired sparse representation ofnatural images. Finally, we will propose novel methods for integrating priorinformation into these algorithms and provide some preliminary experimentalresults. We will conclude by giving some perspective on applying suchalgorithms to computer vision. More specifically, we will propose thatbio-inspired approaches may be applied to computer vision using predictivecoding schemes, sparse models being one simple and efficient instance of suchschemes.'),
(9, 'Traditional architectures for solving computer vision problems and the degreeof success they enjoyed have been heavily reliant on hand-crafted features.However, of late, deep learning techniques have offered a compellingalternative -- that of automatically learning problem-specific features. Withthis new paradigm, every problem in computer vision is now being re-examinedfrom a deep learning perspective. Therefore, it has become important tounderstand what kind of deep networks are suitable for a given problem.Although general surveys of this fast-moving paradigm (i.e. deep-networks)exist, a survey specific to computer vision is missing. We specificallyconsider one form of deep networks widely used in computer vision -convolutional neural networks (CNNs). We start with AlexNet as our base CNNand then examine the broad variations proposed over time to suit differentapplications. We hope that our recipe-style survey will serve as a guide,particularly for novice practitioners intending to use deep-learning techniquesfor computer vision.'),
(10, 'Many applications in vision require estimation of thin structures such asboundary edges, surfaces, roads, blood vessels, neurons, etc. Unlike mostprevious approaches, we simultaneously detect and delineate thin structureswith sub-pixel localization and real-valued orientation estimation. This is anill-posed problem that requires regularization. We propose an objectivefunction combining detection likelihoods with a prior minimizing curvature ofthe center-lines or surfaces. Unlike simple block-coordinate descent, wedevelop a novel algorithm that is able to perform joint optimization oflocation and detection variables more effectively. Our lower bound optimizationalgorithm applies to quadratic or absolute curvature. The proposed early visionframework is sufficiently general and it can be used in many higher-levelapplications. We illustrate the advantage of our approach on a range of 2D and3D examples.'),
(11, 'The purpose of the present experiment was to investigate the effects ofcervical muscular fatigue on postural control during quiet standing underdifferent conditions of reliability and/or availability of somatosensory inputsfrom the plantar soles and the ankles and visual information. To this aim, 14young healthy adults were asked to sway as little as possible in three sensoryconditions (No vision, No vision-Foam support and Vision) executed in twoconditions of No fatigue and Fatigue of the scapula elevator muscles. Centre offoot pressure (CoP) displacements were recorded using a force platform. Resultsshowed that (1) the cervical muscular fatigue yielded increased CoPdisplacements in the absence of vision, (2) this effect was more accentuatedwhen somatosensation was degraded by standing on a foam surface and (3) theavailability of vision allowed the individuals to suppress this destabilisingeffect. On the whole, these findings not only stress the importance of intactcervical neuromuscular function on postural control during quiet standing, butalso suggest a reweigthing of sensory cues in balance control followingcervical muscular fatigue by increasing the reliance on the somatosensoryinputs from the plantar soles and the ankles and visual information.'),
(12, 'Optics-less cutaneous (skin) vision is not rare among living organisms,though its mechanisms and capabilities have not been thoroughly investigated.This paper demonstrates, using methods from statistical parameter estimationtheory and numerical simulations, that an array of bare sensors with a naturalcosine-law angular sensitivity arranged on a flat or curved surface has theability to perform imaging tasks without any optics at all. The workingprinciple of this type of optics-less sensor and the model developed here fordetermining sensor performance may be used to shed light upon possiblemechanisms and capabilities of cutaneous vision in nature.'),
(13, 'Untangling of structures like ropes and wires by autonomous robots can beuseful in areas such as personal robotics, industries and electrical wiring &repairing by robots. This problem can be tackled by using computer visionsystem in robot. This paper proposes a computer vision based method foranalyzing visual data acquired from camera for perceiving the overlap of wires,ropes, hoses i.e. detecting tangles. Information obtained after processingimage according to the proposed method comprises of position of tangles intangled object and which wire passes over which wire. This information can thenbe used to guide robot to untangle wire/s. Given an image, preprocessing isdone to remove noise. Then edges of wire are detected. After that, the image isdivided into smaller blocks and each block is checked for wire overlap/s andfinding other relevant information. TANGLED-100 dataset was introduced, whichconsists of images of tangled linear deformable objects. Method discussed inhere was tested on the TANGLED-100 dataset. Accuracy achieved duringexperiments was found to be 74.9%. Robotic simulations were carried out todemonstrate the use of the proposed method in applications of robot. Proposedmethod is a general method that can be used by robots working in differentsituations.'),
(14, 'The SP theory of intelligence aims to simplify and integrate concepts incomputing and cognition, with information compression as a unifying theme. Thisarticle discusses how it may be applied to the understanding of natural visionand the development of computer vision. The theory, which is described quitefully elsewhere, is described here in outline but with enough detail to ensurethat the rest of the article makes sense.  Low level perceptual features such as edges or corners may be identified bythe extraction of redundancy in uniform areas in a manner that is comparablewith the run-length encoding technique for information compression.  The concept of multiple alignment in the SP theory may be applied to therecognition of objects, and to scene analysis, with a hierarchy of parts andsub-parts, and at multiple levels of abstraction.  The theory has potential for the unsupervised learning of visual objects andclasses of objects, and suggests how coherent concepts may be derived fromfragments.  As in natural vision, both recognition and learning in the SP system isrobust in the face of errors of omission, commission and substitution.  The theory suggests how, via vision, we may piece together a knowledge of thethree-dimensional structure of objects and of our environment, it provides anaccount of how we may see things that are not objectively present in an image,and how we recognise something despite variations in the size of its retinalimage. And it has things to say about the phenomena of lightness constancy andcolour constancy, the role of context in recognition, and ambiguities in visualperception.  A strength of the SP theory is that it provides for the integration of visionwith other sensory modalities and with other aspects of intelligence.'),
(15, 'We consider object detection using a generic model for natural shapes. Acommon approach for object recognition involves matching object models directlyto images. Another approach involves building intermediate representations viaa generic grouping processes. We argue that these two processes (model-basedrecognition and grouping) may use similar computational mechanisms. By defininga generic model for shapes we can use model-based techniques to implement amid-level vision grouping process.');

-- --------------------------------------------------------

--
-- Table structure for table `written_by`
--

CREATE TABLE `written_by` (
  `r_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `written_by`
--

INSERT INTO `written_by` (`r_id`, `a_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(6, 19),
(6, 20),
(7, 21),
(8, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(10, 29),
(10, 30),
(10, 31),
(11, 32),
(11, 33),
(11, 34),
(12, 35),
(12, 36),
(12, 37),
(12, 38),
(13, 39),
(14, 40),
(15, 41);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `a_name` (`a_name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `c_name` (`c_name`);

--
-- Indexes for table `correspond_to`
--
ALTER TABLE `correspond_to`
  ADD KEY `r_id` (`r_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `key_map`
--
ALTER TABLE `key_map`
  ADD KEY `r_id` (`r_id`),
  ADD KEY `w_id` (`w_id`);

--
-- Indexes for table `research_paper`
--
ALTER TABLE `research_paper`
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `r_doi` (`r_doi`),
  ADD KEY `r_name` (`r_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`w_id`);

--
-- Indexes for table `written_by`
--
ALTER TABLE `written_by`
  ADD PRIMARY KEY (`r_id`,`a_id`),
  ADD KEY `W_F2` (`a_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `research_paper`
--
ALTER TABLE `research_paper`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `correspond_to`
--
ALTER TABLE `correspond_to`
  ADD CONSTRAINT `C_F1` FOREIGN KEY (`r_id`) REFERENCES `research_paper` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `C_F2` FOREIGN KEY (`c_id`) REFERENCES `category` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `key_map`
--
ALTER TABLE `key_map`
  ADD CONSTRAINT `K_F1` FOREIGN KEY (`r_id`) REFERENCES `research_paper` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `K_F2` FOREIGN KEY (`w_id`) REFERENCES `words` (`w_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `written_by`
--
ALTER TABLE `written_by`
  ADD CONSTRAINT `W_F1` FOREIGN KEY (`r_id`) REFERENCES `research_paper` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `W_F2` FOREIGN KEY (`a_id`) REFERENCES `author` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
