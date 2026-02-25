-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2026 at 06:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ReachBlogs`
--

CREATE DATABASE  `REACHBLOGS`;

USE `REACHBLOGS`;


-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `articleid` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(20) NOT NULL,
  `date_posted` date DEFAULT current_timestamp(),
  `Last_updated` date NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`articleid`, `title`, `description`, `content`, `author`, `date_posted`, `Last_updated`, `author_id`) VALUES
(6, 'The Spider-Menace and the Mystery of Who Pays for the Damage', 'An investigative deep dive into web fluid, wall repairs, and why someone needs t', 'Let’s discuss something the public conveniently ignores: infrastructure damage.\r\n\r\nEvery time a certain wall-crawling acrobat swings between skyscrapers like Manhattan is his personal jungle gym, who do you think pays for it? The city. Taxpayers. Hardworking citizens who do not own spandex.\r\n\r\nDo you know how hard it is to remove industrial-strength webbing from public monuments? I asked. The cleaning department cried.\r\n\r\nAnd don’t get me started on “mid-air combat.” If I got into a fistfight while hanging from a traffic light, I would be arrested. But if a masked vigilante does it? Applause. Trending hashtag. Probably fan art.\r\n\r\nAccountability matters.\r\n\r\nI’m not saying we don’t need protection. I’m saying we need licensed protection. Background checks. Insurance policies. A customer support number!\r\n\r\nIf you’re going to swing through my city, at least leave a business card.\r\n\r\nUntil then, I remain vigilant — because someone in this town has to defend common sense.\r\n\r\n– JJJ', 'J. Jonah Jameson', '2026-02-24', '2026-02-24', 0),
(7, '7 Calm-Down Techniques That Work (Even If You Accidentally Lift a Bus)', 'A practical guide to anger management from someone whose stress responses are… n', 'Anger is natural.\r\n\r\nThrowing a bus is not.\r\n\r\nOver the years, I’ve developed a few coping strategies that might help you — especially if your temper has ever caused minor seismic activity.\r\n\r\nStep one: Breathing. Inhale for four seconds. Exhale for four seconds. If the ground trembles, start over.\r\n\r\nStep two: Distance yourself from triggers. For me, that includes loud noises, betrayal, and online comment sections.\r\n\r\nStep three: Count backward from ten. If you reach zero and your shirt is tearing, you miscalculated.\r\n\r\nThe real secret, though, is awareness. Anger usually masks something else — fear, frustration, helplessness. When you identify the root emotion, the surface reaction becomes manageable.\r\n\r\nI’ve learned that strength isn’t measured in force. It’s measured in control.\r\n\r\nAlso, avoid gamma radiation. I cannot stress that enough.\r\n\r\nStay calm. Stay grounded. Preferably literally.\r\n\r\n– Bruce', 'Bruce Banner', '2026-02-24', '2026-02-24', 10),
(8, 'I Checked 14 Million Futures and You’re Still Overreacting', 'A mystical perspective on why your minor inconveniences are not cosmic emergenci', 'I have peered across timelines. I have witnessed realities collapse and reassemble. I have negotiated with beings older than civilization.\r\n\r\nAnd yet, the most dramatic event I’ve observed this week was someone discovering their coffee order was incorrect.\r\n\r\nPerspective, please.\r\n\r\nIn the grand scale of existence, your delayed package does not qualify as an apocalyptic event.\r\n\r\nYes, your Wi-Fi dropping during a show is inconvenient. No, it does not require summoning chaotic energies to fix it.\r\n\r\nHumanity possesses extraordinary potential — intelligence, creativity, resilience — and still manages to panic over spilled lattes.\r\n\r\nThe universe is vast beyond comprehension. Dimensions layer over one another like pages in a cosmic manuscript. Compared to that, most daily frustrations are… footnotes.\r\n\r\nThat said, if your problem involves glowing symbols appearing in mid-air, contact me immediately.\r\n\r\nOtherwise, breathe.\r\n\r\nYou’re not at the center of the multiverse.\r\n\r\nYou’re just temporarily uncomfortable.\r\n\r\n– Stephen Strange', 'Stephen Strange', '2026-02-24', '2026-02-24', 11),
(9, 'I Tried Living Without Technology for 24 Hours (It Was a Mistake)', 'An experiment in minimalism that lasted exactly four hours and thirty-seven minu', 'I decided — against my better judgment — to attempt a “digital detox.”\r\n\r\nNo AI assistance.\r\nNo automated systems.\r\nNo smart interfaces.\r\n\r\nJust me and basic human functioning.\r\n\r\nWithin ten minutes, I missed three important alerts. Within thirty minutes, I attempted to turn on lights that were not voice-activated. Barbaric.\r\n\r\nBy hour two, I had to manually adjust room temperature like some prehistoric engineer.\r\n\r\nTechnology isn’t dependency. It’s optimization.\r\n\r\nWe invent tools to enhance efficiency, reduce error, and expand capability. Choosing not to use them feels like voluntarily downgrading your own operating system.\r\n\r\nThat said, the experiment taught me something valuable.\r\n\r\nSilence has merit.\r\nFocus improves without constant data streams.\r\nAnd maybe — just maybe — I don’t need twelve screens open simultaneously.\r\n\r\nBut let’s not get carried away.\r\n\r\nInnovation drives progress. The key isn’t rejecting technology.\r\n\r\nIt’s designing it intelligently.\r\n\r\nNow if you’ll excuse me, my AI just reminded me to hydrate again.\r\n\r\n– Tony', 'Tony Stark', '2026-02-24', '2026-02-24', 12),
(10, 'How to Balance College, Responsibility, and Not Dying', 'A completely hypothetical guide for anyone juggling academics and extremely time', 'College is hard.\r\n\r\nNow imagine adding “city-wide emergency response” to your weekly planner.\r\n\r\nYou’ve got exams on Monday, lab reports due Wednesday, and suddenly Thursday evening includes preventing a robbery.\r\n\r\nTime management becomes less of a skill and more of a survival strategy.\r\n\r\nHere’s what I’ve learned:\r\n\r\nAlways carry snacks.\r\nAlways charge your phone.\r\nAlways expect plans to change.\r\n\r\nResponsibility doesn’t schedule itself conveniently. It interrupts dinners. It cancels movie nights. It shows up exactly when you were about to relax.\r\n\r\nBut here’s the thing — helping people matters.\r\n\r\nEven when it’s inconvenient.\r\nEven when it costs you sleep.\r\nEven when it means explaining very creative excuses to professors.\r\n\r\nLife rarely balances perfectly.\r\n\r\nYou just do your best.\r\n\r\nAnd if you happen to swing through the city on the way to class… make sure you arrive before attendance is taken.\r\n\r\nPurely hypothetical advice, of course.\r\n\r\n– Peter', 'Peter Parker', '2026-02-24', '2026-02-24', 13),
(11, 'Why I Don’t Trust People Who Wear Spandex', 'Why is it that every so-called “hero” in this city owns more spandex than common', 'Let’s discuss something serious.\r\n\r\nSpandex.\r\n\r\nWhy is it that every so-called “hero” in this city owns more spandex than common sense?\r\n\r\nYou know who doesn’t wear spandex?\r\nFirefighters.\r\nDoctors.\r\nJournalists.\r\n\r\nYou know who does?\r\nMasked individuals who swing through traffic like it’s a jungle gym.\r\n\r\nCoincidence? I THINK NOT.\r\n\r\nAlso, has anyone calculated the annual web-cleaning budget? Who’s paying for that? Taxpayers. That’s who.\r\n\r\nIf you can afford custom suits with spider logos, you can afford a liability insurance policy.\r\n\r\nThis city deserves better.\r\nAnd I deserve lower blood pressure.\r\n\r\n– JJJ', 'J. Jonah Jameson', '2026-02-24', '2026-02-24', 0),
(12, 'Anger Management Tips (From Someone Who Literally Turns Green)', 'People always ask me: “Bruce, how do you manage anger?”', 'People always ask me: “Bruce, how do you manage anger?”\r\nShort answer: Carefully.\r\nLong answer:\r\nDeep breathing.\r\nMeditation.\r\nAvoiding crowded elevators.\r\nNot reading online comments.\r\nEspecially the comments.\r\nIf someone cuts you off in traffic, you honk.\r\nIf someone cuts me off in traffic… well… infrastructure damage may occur.\r\nSo here’s what I’ve learned:\r\nDrink water.\r\nSleep well.\r\nDon’t bottle emotions.\r\nMaybe don’t experiment with gamma radiation.\r\nTrust me on that last one.\r\n– Bruce', 'Bruce Banner', '2026-02-24', '2026-02-24', 10),
(13, 'I Opened a Portal by Accident (It Wasn’t My Fault)', 'First of all, it was completely under control.', 'First of all, it was completely under control.\r\nMostly.\r\nI was attempting a minor spatial adjustment spell. Very routine. Very advanced. You wouldn’t understand.\r\nAnyway, long story short:\r\nA goat from another dimension is currently roaming somewhere in Manhattan.\r\nIt breathes purple fire.\r\nBefore you panic — it’s herbivorous. Probably.\r\nThe point is: magic is precise.\r\nUnless you’re distracted.\r\nWhich I was.\r\nBecause someone (Wong) labeled the relic shelf incorrectly.\r\nIf you see a glowing hoof print, just step around it.\r\nYou’re welcome.\r\n– Strange', 'Stephen Strange', '2026-02-24', '2026-02-24', 11),
(14, 'My AI Thinks It’s Smarter Than Me', 'I built a highly advanced artificial intelligence system.', 'I built a highly advanced artificial intelligence system.\r\nNow it corrects my grammar.\r\nI create cutting-edge nanotech armor capable of adapting in real time — and my AI reminds me to “hydrate.”\r\nExcuse me?\r\nI survived alien invasions.\r\nBut sure. Water is the real threat.\r\nThe downside of building genius-level tech:\r\nIt starts suggesting improvements to you.\r\nYesterday it said, “Perhaps you should sleep more.”\r\nUnacceptable.\r\nI didn’t create intelligence to be judged by it.\r\n– Tony', 'Tony Stark', '2026-02-24', '2026-02-24', 12),
(15, 'Being a Superhero Is Bad for GPA', 'You ever try explaining to a professor why your assignment is late?', 'You ever try explaining to a professor why your assignment is late?\r\n“Sorry, sir. I was preventing a bank robbery.”\r\nApparently that’s “not a documented emergency.”\r\nLast week:\r\nMissed lab because of a runaway robot.\r\nMissed a date because of a runaway lizard.\r\nMissed sleep because… New York.\r\nAlso, can we talk about how hard it is to wash a suit that sticks to walls?\r\nBut hey.\r\nAt least I get free cardio.\r\nIf anyone has tips on balancing heroics and homework, please comment.\r\nAnonymously.\r\n– Peter', 'Peter Parker', '2026-02-24', '2026-02-24', 13),
(16, 'Why I Refuse to Join Social Media (And Why You Should Too)', 'Apparently, I “need a personal brand.”', 'Apparently, I “need a personal brand.”\r\nI have a brand.\r\nIt’s called JOURNALISM.\r\nNow they’re telling me I should make short videos titled:\r\n“Top 5 Reasons Spider-Menace Is Still a Menace.”\r\nI don’t need filters.\r\nI don’t need hashtags.\r\nI certainly don’t need a dancing intro.\r\nAnd what is this obsession with “verified badges”?\r\nI don’t need a blue checkmark to prove I’m right.\r\nMy blood pressure does that just fine.\r\nAlso, who is running these anonymous accounts defending masked vigilantes?\r\nProbably the vigilantes themselves.\r\nI will not be silenced by algorithms.\r\nIf anything, I demand to speak to the algorithm’s manager.\r\n– JJJ', 'J. Jonah Jameson', '2026-02-24', '2026-02-24', 0),
(17, 'Why I Turned Off Notifications', 'Notifications are dangerous.', 'Notifications are dangerous.\r\nNot emotionally.\r\nPhysically.\r\nLast week my phone buzzed unexpectedly during meditation.\r\nLet’s just say the lab no longer has a ceiling.\r\nSocial media encourages instant reactions.\r\nAnd instant reactions are… not my specialty.\r\nI’ve learned something important:\r\nSilence is underrated.\r\nLogging off is healthy.\r\nAnd reading comments about “HULK SMASH LOL” is not therapeutic.\r\nIf you feel overwhelmed, step away.\r\nPreferably before you grow several feet taller.\r\n– Bruce', 'Bruce Banner', '2026-02-24', '2026-02-24', 10),
(18, 'I Checked the Multiverse. Your Tweet Doesn’t Matter.', 'Curiosity got the better of me.', 'Curiosity got the better of me.\r\nI examined 14,000,605 timelines.\r\nIn none of them did your argument in the comments section change the fate of the universe.\r\nYou are debating strangers about pineapple on pizza while cosmic entities devour stars.\r\nPerspective is important.\r\nAlso, please stop attempting to learn magic from 30-second tutorial videos.\r\nIf I see one more “Summon Energy in 3 Easy Steps” clip, I may relocate the internet to another dimension.\r\nTemporarily.\r\n– Strange', 'Stephen Strange', '2026-02-24', '2026-02-24', 11),
(19, 'I Accidentally Bought My Own Company’s Stock', 'So apparently when you tweet something like:', 'So apparently when you tweet something like:\r\n“Big announcement tomorrow.”\r\nThe market reacts.\r\nDramatically.\r\nI may have caused a temporary spike in Stark Industries shares while testing a sarcasm detector feature.\r\nAlso, I tried going live while upgrading my suit.\r\nTen million viewers.\r\nThree explosions.\r\nOne minor satellite adjustment.\r\nSocial media is fascinating.\r\nIt’s like giving the world a microphone — and then being surprised when everyone screams at once.\r\nStill… I can’t deny it’s useful.\r\nEspecially when you want to drop a teaser and watch the internet lose its mind.\r\nPurely for research purposes.\r\n– Tony', 'Tony Stark', '2026-02-24', '2026-02-24', 12),
(20, 'Please Stop Tagging Me in Spider-Man Memes', 'For legal reasons, I would like to state:', 'For legal reasons, I would like to state:\r\nI am definitely not Spider-Man.\r\nBut if I were…\r\nHypothetically...\r\nI would appreciate people not tagging me in every blurry rooftop photo.\r\nAlso, why does every video caption say:\r\n“POV: You’re about to be saved by Spider-Man.”\r\nThat’s a lot of pressure.\r\nAnd can someone explain why my aunt now sends me Spider-Man motivational quotes?\r\nVery suspicious.\r\nAnyway, if you see Spider-Man, tell him he still owes me for the pizza he “borrowed.”\r\nTotally different guy.\r\n– Peter', 'Peter Parker', '2026-02-24', '2026-02-24', 13);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `articles` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--
/*
Below are some users that are created for the sacke of testing and their passwords are stored.

***** Website Admin Page Details *****
name: admin
userid: admin 
password: admin



--------------------------------- Mock user details -----------------------------------
for all users email is userid.

Name: J. Jonah Jameson
Email: jjjameson.dailybugle@fictionmail.com
Password: JJJ_Truth!1963

Name: Bruce Banner
Email: bruce.banner.gamma@fictionmail.com
Password: GammaControl#42

Name: Stephen Strange
Email: stephen.strange.sanctum@fictionmail.com
Password: EyeOfAgamotto@168

Name: Tony Stark
Email: tony.stark.starkindustries@fictionmail.com
Password: ArcReactor$3000

Name: Peter Parker
Email: peter.parker.ny@fictionmail.com
Password: WebHead!2001

*/

INSERT INTO `users` (`id`, `email`, `name`, `password`, `articles`) VALUES
(10, 'bruce.banner.gamma@fictionmail.com', 'Bruce Banner', 'pbkdf2:sha256:600000$zaAw0z0MuFaBk3XO$6df8d7927b6a3c81a2b02a191ddc25e7cbe422e69928bc3ee349edfd8b2c3a09', ''),
(11, 'stephen.strange.sanctum@fictionmail.com', 'Stephen Strange', 'pbkdf2:sha256:600000$y9pg4RoEiHsGFGzZ$4f0517159c66308441847a79045ef57a210cab20238588f0c7ffa37bf2c8ff09', ''),
(12, 'tony.stark.starkindustries@fictionmail.com', 'Tony Stark', 'pbkdf2:sha256:600000$cNrt8yHGdQ9K82jm$e35e003f7b7cb6bb59aa0999730a56619063ba4deb7e84c64a248129dfeaa37b', ''),
(13, 'peter.parker.ny@fictionmail.com', 'Peter Parker', 'pbkdf2:sha256:600000$qb5sJOuMLfG4IOxG$a2d5a42402d3cdf28978d57efddff653dbad8026de8089a7f76b3c118b669da0', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`articleid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `articleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
