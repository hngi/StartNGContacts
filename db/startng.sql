-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2019 at 06:45 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `startngcontacts`
--

-- --------------------------------------------------------

--
-- Table structure for table `phplist_admin`
--

CREATE TABLE `phplist_admin` (
  `id` int(11) NOT NULL,
  `loginname` varchar(25) NOT NULL,
  `namelc` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modifiedby` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `passwordchanged` date DEFAULT NULL,
  `superuser` tinyint(4) DEFAULT 0,
  `disabled` tinyint(4) DEFAULT 0,
  `privileges` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_admin`
--

INSERT INTO `phplist_admin` (`id`, `loginname`, `namelc`, `email`, `created`, `modified`, `modifiedby`, `password`, `passwordchanged`, `superuser`, `disabled`, `privileges`) VALUES
(1, 'admin', 'admin', 'admin@startng.tech', '2019-10-24 09:34:21', '2019-10-24 16:34:21', NULL, 'ca4b97bd261d806ca450806a35834133a30468a1f7d8f233b79a81100da5b8d2', '2019-10-24', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phplist_adminattribute`
--

CREATE TABLE `phplist_adminattribute` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `listorder` int(11) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `tablename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_admintoken`
--

CREATE TABLE `phplist_admintoken` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `entered` int(11) NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_admintoken`
--

INSERT INTO `phplist_admintoken` (`id`, `adminid`, `value`, `entered`, `expires`) VALUES
(1, 1, '7828e9084c34f9c30b0b3595f4b2c598', 1571935205, '2019-10-24 10:40:05'),
(2, 1, '4ed41073d2834ae89f7e548373a12ed1', 1571935205, '2019-10-24 10:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `phplist_admin_attribute`
--

CREATE TABLE `phplist_admin_attribute` (
  `adminattributeid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_admin_password_request`
--

CREATE TABLE `phplist_admin_password_request` (
  `id_key` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `key_value` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_attachment`
--

CREATE TABLE `phplist_attachment` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `remotefile` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_bounce`
--

CREATE TABLE `phplist_bounce` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `header` text DEFAULT NULL,
  `data` mediumblob DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_bounceregex`
--

CREATE TABLE `phplist_bounceregex` (
  `id` int(11) NOT NULL,
  `regex` varchar(2083) DEFAULT NULL,
  `regexhash` char(32) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `listorder` int(11) DEFAULT 0,
  `admin` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_bounceregex_bounce`
--

CREATE TABLE `phplist_bounceregex_bounce` (
  `regex` int(11) NOT NULL,
  `bounce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_config`
--

CREATE TABLE `phplist_config` (
  `item` varchar(35) NOT NULL,
  `value` longtext DEFAULT NULL,
  `editable` tinyint(4) DEFAULT 1,
  `type` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_config`
--

INSERT INTO `phplist_config` (`item`, `value`, `editable`, `type`) VALUES
('campaignfrom_default', 'admin@startng.tech StartdotNG', 1, NULL),
('domain', 'localhost', 1, NULL),
('hmackey', 'edbdc465139205b7fa60a67628bfde13744f5c204691e8c495c8c3822a6cb29f8cdbb18845bf583c663b848e6407c15321d31a8ec7374dfd2568d5017664f8ce5ba6785612e420ecd8a94dc2006469611e41e9c72f50ff764f250e3c06980da169b3be7bc3f1263bb6172443a7a57ebfae65508fdab251ea880fd91ca018dd57dbc5a122df76f1e56c4989a60fd3bd76b150700f4a3bc1a346107f78542b61c652c7a57df435c0b6bbb62fea75c54b1a2eaf1d3dd902342c502e9eded16beaf3167c7f3497ba7ebb38a329e7ef15f0e767dc9de8ce65822f4ce3e12d9d04dae6488114bcc21d77cd31489057a38a88e943a2306034dc39098f8adac71db48987', 0, NULL),
('internet_tlds', 'aaa|aarp|abarth|abb|abbott|abbvie|abc|able|abogado|abudhabi|ac|academy|accenture|accountant|accountants|aco|active|actor|ad|adac|ads|adult|ae|aeg|aero|aetna|af|afamilycompany|afl|africa|ag|agakhan|agency|ai|aig|aigo|airbus|airforce|airtel|akdn|al|alfaromeo|alibaba|alipay|allfinanz|allstate|ally|alsace|alstom|am|americanexpress|americanfamily|amex|amfam|amica|amsterdam|analytics|android|anquan|anz|ao|aol|apartments|app|apple|aq|aquarelle|ar|arab|aramco|archi|army|arpa|art|arte|as|asda|asia|associates|at|athleta|attorney|au|auction|audi|audible|audio|auspost|author|auto|autos|avianca|aw|aws|ax|axa|az|azure|ba|baby|baidu|banamex|bananarepublic|band|bank|bar|barcelona|barclaycard|barclays|barefoot|bargains|baseball|basketball|bauhaus|bayern|bb|bbc|bbt|bbva|bcg|bcn|bd|be|beats|beauty|beer|bentley|berlin|best|bestbuy|bet|bf|bg|bh|bharti|bi|bible|bid|bike|bing|bingo|bio|biz|bj|black|blackfriday|blanco|blockbuster|blog|bloomberg|blue|bm|bms|bmw|bn|bnl|bnpparibas|bo|boats|boehringer|bofa|bom|bond|boo|book|booking|bosch|bostik|boston|bot|boutique|box|br|bradesco|bridgestone|broadway|broker|brother|brussels|bs|bt|budapest|bugatti|build|builders|business|buy|buzz|bv|bw|by|bz|bzh|ca|cab|cafe|cal|call|calvinklein|cam|camera|camp|cancerresearch|canon|capetown|capital|capitalone|car|caravan|cards|care|career|careers|cars|cartier|casa|case|caseih|cash|casino|cat|catering|catholic|cba|cbn|cbre|cbs|cc|cd|ceb|center|ceo|cern|cf|cfa|cfd|cg|ch|chanel|channel|charity|chase|chat|cheap|chintai|christmas|chrome|chrysler|church|ci|cipriani|circle|cisco|citadel|citi|citic|city|cityeats|ck|cl|claims|cleaning|click|clinic|clinique|clothing|cloud|club|clubmed|cm|cn|co|coach|codes|coffee|college|cologne|com|comcast|commbank|community|company|compare|computer|comsec|condos|construction|consulting|contact|contractors|cooking|cookingchannel|cool|coop|corsica|country|coupon|coupons|courses|cr|credit|creditcard|creditunion|cricket|crown|crs|cruise|cruises|csc|cu|cuisinella|cv|cw|cx|cy|cymru|cyou|cz|dabur|dad|dance|data|date|dating|datsun|day|dclk|dds|de|deal|dealer|deals|degree|delivery|dell|deloitte|delta|democrat|dental|dentist|desi|design|dev|dhl|diamonds|diet|digital|direct|directory|discount|discover|dish|diy|dj|dk|dm|dnp|do|docs|doctor|dodge|dog|doha|domains|dot|download|drive|dtv|dubai|duck|dunlop|duns|dupont|durban|dvag|dvr|dz|earth|eat|ec|eco|edeka|edu|education|ee|eg|email|emerck|energy|engineer|engineering|enterprises|epost|epson|equipment|er|ericsson|erni|es|esq|estate|esurance|et|etisalat|eu|eurovision|eus|events|everbank|exchange|expert|exposed|express|extraspace|fage|fail|fairwinds|faith|family|fan|fans|farm|farmers|fashion|fast|fedex|feedback|ferrari|ferrero|fi|fiat|fidelity|fido|film|final|finance|financial|fire|firestone|firmdale|fish|fishing|fit|fitness|fj|fk|flickr|flights|flir|florist|flowers|fly|fm|fo|foo|food|foodnetwork|football|ford|forex|forsale|forum|foundation|fox|fr|free|fresenius|frl|frogans|frontdoor|frontier|ftr|fujitsu|fujixerox|fun|fund|furniture|futbol|fyi|ga|gal|gallery|gallo|gallup|game|games|gap|garden|gb|gbiz|gd|gdn|ge|gea|gent|genting|george|gf|gg|ggee|gh|gi|gift|gifts|gives|giving|gl|glade|glass|gle|global|globo|gm|gmail|gmbh|gmo|gmx|gn|godaddy|gold|goldpoint|golf|goo|goodyear|goog|google|gop|got|gov|gp|gq|gr|grainger|graphics|gratis|green|gripe|grocery|group|gs|gt|gu|guardian|gucci|guge|guide|guitars|guru|gw|gy|hair|hamburg|hangout|haus|hbo|hdfc|hdfcbank|health|healthcare|help|helsinki|here|hermes|hgtv|hiphop|hisamitsu|hitachi|hiv|hk|hkt|hm|hn|hockey|holdings|holiday|homedepot|homegoods|homes|homesense|honda|honeywell|horse|hospital|host|hosting|hot|hoteles|hotels|hotmail|house|how|hr|hsbc|ht|hu|hughes|hyatt|hyundai|ibm|icbc|ice|icu|id|ie|ieee|ifm|ikano|il|im|imamat|imdb|immo|immobilien|in|inc|industries|infiniti|info|ing|ink|institute|insurance|insure|int|intel|international|intuit|investments|io|ipiranga|iq|ir|irish|is|iselect|ismaili|ist|istanbul|it|itau|itv|iveco|jaguar|java|jcb|jcp|je|jeep|jetzt|jewelry|jio|jll|jm|jmp|jnj|jo|jobs|joburg|jot|joy|jp|jpmorgan|jprs|juegos|juniper|kaufen|kddi|ke|kerryhotels|kerrylogistics|kerryproperties|kfh|kg|kh|ki|kia|kim|kinder|kindle|kitchen|kiwi|km|kn|koeln|komatsu|kosher|kp|kpmg|kpn|kr|krd|kred|kuokgroup|kw|ky|kyoto|kz|la|lacaixa|ladbrokes|lamborghini|lamer|lancaster|lancia|lancome|land|landrover|lanxess|lasalle|lat|latino|latrobe|law|lawyer|lb|lc|lds|lease|leclerc|lefrak|legal|lego|lexus|lgbt|li|liaison|lidl|life|lifeinsurance|lifestyle|lighting|like|lilly|limited|limo|lincoln|linde|link|lipsy|live|living|lixil|lk|llc|loan|loans|locker|locus|loft|lol|london|lotte|lotto|love|lpl|lplfinancial|lr|ls|lt|ltd|ltda|lu|lundbeck|lupin|luxe|luxury|lv|ly|ma|macys|madrid|maif|maison|makeup|man|management|mango|map|market|marketing|markets|marriott|marshalls|maserati|mattel|mba|mc|mckinsey|md|me|med|media|meet|melbourne|meme|memorial|men|menu|merckmsd|metlife|mg|mh|miami|microsoft|mil|mini|mint|mit|mitsubishi|mk|ml|mlb|mls|mm|mma|mn|mo|mobi|mobile|mobily|moda|moe|moi|mom|monash|money|monster|mopar|mormon|mortgage|moscow|moto|motorcycles|mov|movie|movistar|mp|mq|mr|ms|msd|mt|mtn|mtr|mu|museum|mutual|mv|mw|mx|my|mz|na|nab|nadex|nagoya|name|nationwide|natura|navy|nba|nc|ne|nec|net|netbank|netflix|network|neustar|new|newholland|news|next|nextdirect|nexus|nf|nfl|ng|ngo|nhk|ni|nico|nike|nikon|ninja|nissan|nissay|nl|no|nokia|northwesternmutual|norton|now|nowruz|nowtv|np|nr|nra|nrw|ntt|nu|nyc|nz|obi|observer|off|office|okinawa|olayan|olayangroup|oldnavy|ollo|om|omega|one|ong|onl|online|onyourside|ooo|open|oracle|orange|org|organic|origins|osaka|otsuka|ott|ovh|pa|page|panasonic|paris|pars|partners|parts|party|passagens|pay|pccw|pe|pet|pf|pfizer|pg|ph|pharmacy|phd|philips|phone|photo|photography|photos|physio|piaget|pics|pictet|pictures|pid|pin|ping|pink|pioneer|pizza|pk|pl|place|play|playstation|plumbing|plus|pm|pn|pnc|pohl|poker|politie|porn|post|pr|pramerica|praxi|press|prime|pro|prod|productions|prof|progressive|promo|properties|property|protection|pru|prudential|ps|pt|pub|pw|pwc|py|qa|qpon|quebec|quest|qvc|racing|radio|raid|re|read|realestate|realtor|realty|recipes|red|redstone|redumbrella|rehab|reise|reisen|reit|reliance|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rexroth|rich|richardli|ricoh|rightathome|ril|rio|rip|rmit|ro|rocher|rocks|rodeo|rogers|room|rs|rsvp|ru|rugby|ruhr|run|rw|rwe|ryukyu|sa|saarland|safe|safety|sakura|sale|salon|samsclub|samsung|sandvik|sandvikcoromant|sanofi|sap|sarl|sas|save|saxo|sb|sbi|sbs|sc|sca|scb|schaeffler|schmidt|scholarships|school|schule|schwarz|science|scjohnson|scor|scot|sd|se|search|seat|secure|security|seek|select|sener|services|ses|seven|sew|sex|sexy|sfr|sg|sh|shangrila|sharp|shaw|shell|shia|shiksha|shoes|shop|shopping|shouji|show|showtime|shriram|si|silk|sina|singles|site|sj|sk|ski|skin|sky|skype|sl|sling|sm|smart|smile|sn|sncf|so|soccer|social|softbank|software|sohu|solar|solutions|song|sony|soy|space|spiegel|sport|spot|spreadbetting|sr|srl|srt|st|stada|staples|star|starhub|statebank|statefarm|stc|stcgroup|stockholm|storage|store|stream|studio|study|style|su|sucks|supplies|supply|support|surf|surgery|suzuki|sv|swatch|swiftcover|swiss|sx|sy|sydney|symantec|systems|sz|tab|taipei|talk|taobao|target|tatamotors|tatar|tattoo|tax|taxi|tc|tci|td|tdk|team|tech|technology|tel|telefonica|temasek|tennis|teva|tf|tg|th|thd|theater|theatre|tiaa|tickets|tienda|tiffany|tips|tires|tirol|tj|tjmaxx|tjx|tk|tkmaxx|tl|tm|tmall|tn|to|today|tokyo|tools|top|toray|toshiba|total|tours|town|toyota|toys|tr|trade|trading|training|travel|travelchannel|travelers|travelersinsurance|trust|trv|tt|tube|tui|tunes|tushu|tv|tvs|tw|tz|ua|ubank|ubs|uconnect|ug|uk|unicom|university|uno|uol|ups|us|uy|uz|va|vacations|vana|vanguard|vc|ve|vegas|ventures|verisign|versicherung|vet|vg|vi|viajes|video|vig|viking|villas|vin|vip|virgin|visa|vision|vistaprint|viva|vivo|vlaanderen|vn|vodka|volkswagen|volvo|vote|voting|voto|voyage|vu|vuelos|wales|walmart|walter|wang|wanggou|warman|watch|watches|weather|weatherchannel|webcam|weber|website|wed|wedding|weibo|weir|wf|whoswho|wien|wiki|williamhill|win|windows|wine|winners|wme|wolterskluwer|woodside|work|works|world|wow|ws|wtc|wtf|xbox|xerox|xfinity|xihuan|xin|xxx|xyz|yachts|yahoo|yamaxun|yandex|ye|yodobashi|yoga|yokohama|you|youtube|yt|yun|za|zappos|zara|zero|zip|zippo|zm|zone|zuerich|zw', 0, NULL),
('lastcheckupdate', '10/24/2019 06:34:37', 0, NULL),
('list_categories', '', 1, NULL),
('maintenancemode', '', 1, NULL),
('message_from_name', 'StartdotNG', 1, NULL),
('organisation_name', 'StartdotNG', 1, NULL),
('phpListNewsIndex-en', '', 0, NULL),
('phpListNewsLastChecked-en', '1571935046', 0, NULL),
('plugins_disabled', '', 1, NULL),
('pqchoice', '', 1, NULL),
('readnews1', '', 1, NULL),
('remoteurl_append', '', 1, NULL),
('secret', 'c5c25e571e427067e8351aacb225db05923fde4b', 1, NULL),
('tld_last_sync', '1571934990', 0, NULL),
('version', 'dev', 0, NULL),
('viewednews1', '', 1, NULL),
('website', 'localhost', 1, NULL),
('xormask', '0cbe0dfedfd8402992df0898971d4c6c', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phplist_eventlog`
--

CREATE TABLE `phplist_eventlog` (
  `id` int(11) NOT NULL,
  `entered` datetime DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `entry` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_eventlog`
--

INSERT INTO `phplist_eventlog` (`id`, `entered`, `page`, `entry`) VALUES
(1, '2019-10-24 09:36:32', 'home', 'Fetching https://www.phplist.com/files/tlds-alpha-by-domain.txt success'),
(2, '2019-10-24 09:36:40', 'home', 'Fetching https://www.phplist.com/files/tlds-alpha-by-domain.txt.md5 success');

-- --------------------------------------------------------

--
-- Table structure for table `phplist_i18n`
--

CREATE TABLE `phplist_i18n` (
  `lan` varchar(10) NOT NULL,
  `original` text NOT NULL,
  `translation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_i18n`
--

INSERT INTO `phplist_i18n` (`lan`, `original`, `translation`) VALUES
('en', 'You are logged in as administrator (%s) of this phpList system', 'You are logged in as administrator (%s) of this phpList system'),
('en', 'You are therefore offered the following choice, which your subscribers will not see when they load this page.', 'You are therefore offered the following choice, which your subscribers will not see when they load this page.'),
('en', 'Go back to admin area', 'Go back to admin area'),
('en', 'Please choose', 'Please choose'),
('en', 'Make this subscriber confirmed immediately', 'Make this subscriber confirmed immediately'),
('en', 'Send this subscriber a request for confirmation email', 'Send this subscriber a request for confirmation email'),
('en', 'Subscriber removed from Blacklist for manual confirmation of subscription', 'Subscriber removed from do-not-send list for manual confirmation of subscription'),
('en', 'Subscriber has been removed from blacklist', 'Subscriber has been removed from do-not-send list'),
('en', 'Forwarded receiver requested blacklist', 'Forwarded receiver requested blacklist'),
('en', '\\\"Jump off\\\" used by subscriber, reason not requested', '\\\"Jump off\\\" used by subscriber, reason not requested'),
('en', '\\\"Jump off\\\" set, reason not requested', '\\\"Jump off\\\" set, reason not requested'),
('en', 'When testing the phpList forward functionality, you need to be logged in as an administrator.', 'When testing the phpList forward functionality, you need to be logged in as an administrator.'),
('en', 'Message Forwarded', 'Message forwarded'),
('en', '%s has forwarded message %d to %s', '%s has forwarded message %d to %s'),
('en', '%s tried forwarding message %d to %s but failed', '%s tried forwarding message %d to %s but failed'),
('en', 'Forward request from invalid user ID: %s', 'Forward request from invalid user ID: %s'),
('en', 'You do not have enough privileges to view this page', 'You do not have enough privileges to view this page'),
('en', 'Choose a list', 'Choose a list'),
('en', 'list', 'list'),
('en', '# bounced', '# bounced'),
('en', 'None found', 'None found'),
('en', 'Select another list', 'Select another list'),
('en', '%s bounces to list %s', '%s bounces to list %s'),
('en', 'Bounces on', 'Bounces on'),
('en', 'address', 'address'),
('en', '# bounces', '# bounces'),
('en', 'All draft campaigns deleted', 'All draft campaigns deleted'),
('en', 'campaigns deleted', 'campaigns deleted'),
('en', 'Campaign deleted', 'Campaign deleted'),
('en', 'start a new message', 'start a new campaign'),
('en', 'Start a new campaign', 'Start a new campaign'),
('en', 'Choose an existing draft message to work on', 'Choose an existing draft campaign to work on'),
('en', 'Draft messages', 'Draft campaigns'),
('en', 'Entered', 'Entered'),
('en', 'age', 'age'),
('en', 'del', 'del'),
('en', 'Delete all', 'Delete all'),
('en', 'Please select the lists you want to send your campaign to', 'Please select the lists you want to send your campaign to'),
('en', 'Please select the lists you want to exclude from this campaign', 'Please select the lists you want to exclude from this campaign'),
('en', 'The campaign will go to users who are a member of the lists above,     unless they are a member of one of the lists you select here.', 'The campaign will go to subscribers who are a member of the lists above, unless they are also a member of one of the lists you select here.'),
('en', 'Your database is out of date, please make sure to upgrade', 'Your database is out of date, please make sure to upgrade'),
('en', 'Your version', 'Your version'),
('en', 'phplist version', '<a href=https://www.phplist.com>phpList</a> version'),
('en', 'upgrade', 'Upgrade'),
('en', 'Database has not been initialised', 'Database has not been initialised'),
('en', 'go to', 'go to'),
('en', 'Initialise Database', 'Initialise Database'),
('en', 'to continue', 'to continue'),
('en', 'A new version of phpList is available!', 'A new version of phpList is available!'),
('en', 'The new version may have fixed security issues,<br/>so it is recommended to upgrade as soon as possible', 'The new version may have fixed security issues,<br/>so it is recommended to upgrade as soon as possible'),
('en', 'Latest version', 'Latest version'),
('en', 'Read what has changed in the new version', 'Read what has changed in the new version'),
('en', 'View what has changed', 'View what has changed'),
('en', 'Download the new version', 'Download the new version'),
('en', 'Download', 'Download'),
('en', 'Continue Configuration', 'Continue Configuration'),
('en', 'Continue the Configuration process of phpList', 'Continue the Configuration process of phpList'),
('en', 'Send a campaign', 'Send a campaign'),
('en', 'Start or continue a campaign', 'Start or continue a campaign'),
('en', 'Manage Campaigns', 'Manage campaigns'),
('en', 'View current campaigns', 'View current campaigns'),
('en', 'Manage Subscribers', 'Manage subscribers'),
('en', 'Search, edit and add Subscribers', 'Search, edit and add subscribers'),
('en', 'View statistics', 'View statistics'),
('en', 'Main', 'Main'),
('en', 'Manage Lists', 'Manage lists'),
('en', 'View, edit and add lists, that your subscribers can sign up to', 'View, edit and add lists, that your subscribers can sign up to'),
('en', 'users', 'Subscribers'),
('en', 'List all Users', 'List all subscribers'),
('en', 'import', 'Import'),
('en', 'Import Users', 'Import subscribers'),
('en', 'export', 'Export'),
('en', 'Export Users', 'Export subscribers'),
('en', 'reconcileusers', 'Reconcile subscribers'),
('en', 'Reconcile the User Database', 'Reconcile the subscriber database'),
('en', 'List and user functions', 'List and user functions'),
('en', 'Configure', 'Configure'),
('en', 'attributes', 'Attributes'),
('en', 'Configure Attributes', 'Configure attributes'),
('en', 'Control values for', 'Control values for'),
('en', 'spage', 'Subscribe page'),
('en', 'Configure Subscribe Pages', 'Configure subscribe pages'),
('en', 'Configuration Functions', 'Configuration functions'),
('en', 'admins', 'admins'),
('en', 'Add, edit and remove Administrators', 'Add, edit and remove Administrators'),
('en', 'adminattributes', 'Admin attributes'),
('en', 'Configure Attributes for administrators', 'Configure Attributes for administrators'),
('en', 'Administrator Functions', 'Administrator functions'),
('en', 'send', 'Send'),
('en', 'Send a Message', 'Send a campaign'),
('en', 'preparesend', 'preparesend'),
('en', 'Prepare a Message', 'Prepare a Message'),
('en', 'sendprepared', 'sendprepared'),
('en', 'Send a Prepared Message', 'Send a Prepared Message'),
('en', 'templates', 'templates'),
('en', 'Configure Templates', 'Configure templates'),
('en', 'messages', 'Messages'),
('en', 'List all Messages', 'List all campaigns'),
('en', 'processqueue', 'process queue'),
('en', 'Process the Message Queue', 'Process the Queue'),
('en', 'warning', 'Warning'),
('en', 'You have set TEST in config.php to 1, so it will only show what would be sent', 'You have set TEST in config.php to 1, so it will only show what would be sent'),
('en', 'processbounces', 'Process bounces'),
('en', 'Process Bounces', 'Process Bounces'),
('en', 'bounces', 'bounces'),
('en', 'View Bounces', 'View Bounces'),
('en', 'Message Functions', 'Campaign functions'),
('en', 'Plugins', 'Plugins'),
('en', 'Setup', 'Setup'),
('en', 'dbcheck', 'Check database'),
('en', 'Check Database structure', 'Check Database structure'),
('en', 'eventlog', 'Eventlog'),
('en', 'View the eventlog', 'View the eventlog'),
('en', 'admin', 'admin'),
('en', 'Change your details (e.g. password)', 'Change your details (e.g. password)'),
('en', 'System Functions', 'System functions'),
('en', 'Database structure check', 'Database structure check'),
('en', 'Database structure', 'Database structure'),
('en', 'Requeue', 'Requeue'),
('en', 'Stalled', 'Stalled'),
('en', 'still to process', 'still to process'),
('en', 'ETA', 'ETA'),
('en', 'Sent', 'Sent'),
('en', 'Processing', 'Processing'),
('en', 'msgs/hr', 'msgs/hr'),
('en', 'Invalid value for email address', 'Invalid value for email address'),
('en', 'error', 'Error'),
('en', 'Too many errors, please login again', 'Too many errors, please login again'),
('en', 'fatalerror', 'Fatal error'),
('en', 'Documentation about this error', 'Documentation about this error'),
('en', 'Main Page', 'Dashboard'),
('en', 'about', 'about'),
('en', 'In this section', 'In this section'),
('en', 'Recently visited', 'Recently Visited'),
('en', 'All Lists', 'All Lists'),
('en', 'All Public Lists', 'All Public Lists'),
('en', 'Add a list', 'Add a list'),
('en', 'Uncategorised', 'Uncategorised'),
('en', 'Public list', 'Public list'),
('en', 'Private list', 'Private list'),
('en', 'Select all', 'Select all'),
('en', 'There are no lists available', 'There are no lists available'),
('en', 'January', 'January'),
('en', 'February', 'February'),
('en', 'March', 'March'),
('en', 'April', 'April'),
('en', 'May', 'May'),
('en', 'June', 'June'),
('en', 'July', 'July'),
('en', 'August', 'August'),
('en', 'September', 'September'),
('en', 'October', 'October'),
('en', 'November', 'November'),
('en', 'December', 'December'),
('en', 'Jan', 'Jan'),
('en', 'Feb', 'Feb'),
('en', 'Mar', 'Mar'),
('en', 'Apr', 'Apr'),
('en', 'Jun', 'Jun'),
('en', 'Jul', 'Jul'),
('en', 'Aug', 'Aug'),
('en', 'Sep', 'Sep'),
('en', 'Oct', 'Oct'),
('en', 'Nov', 'Nov'),
('en', 'Dec', 'Dec'),
('en', 'years', 'years'),
('en', 'days', 'days'),
('en', 'hours', 'hours'),
('en', 'mins', 'minutes'),
('en', 'secs', 'seconds'),
('en', 'Attribute', 'Attribute'),
('en', 'Placeholder', 'Placeholder'),
('en', 'Listing %d to %d of %d', 'Listing %d to %d of %d'),
('en', 'Listing %d to %d', 'Listing %d to %d'),
('en', 'First Page', 'First Page'),
('en', 'Previous', 'Previous'),
('en', 'Next', 'Next'),
('en', 'Last Page', 'Last Page'),
('en', 'The plugin', 'The plugin'),
('en', 'Invalid security token, please reload the page and try again', 'Invalid security token, please reload the page and try again'),
('en', 'Invalid download URL, please reload the page and try again', 'Invalid download URL, please reload the page and try again'),
('en', 'Fetching plugin', 'Fetching plugin'),
('en', 'developer', 'Developer'),
('en', 'Project', 'Project'),
('en', 'Unable to download plugin package, check your connection', 'Unable to download plugin package, check your connection'),
('en', 'Installing plugin', 'Installing plugin'),
('en', 'updating existing plugin', 'updating existing plugin'),
('en', 'new plugin', 'new plugin'),
('en', 'Plugin installed successfully', 'Plugin installed successfully'),
('en', 'Error installing plugin', 'Error installing plugin'),
('en', 'continue', 'Continue'),
('en', 'Plugin directory is not writable', 'Plugin directory is not writable'),
('en', 'Invalid plugin package', 'Invalid plugin package'),
('en', 'Plugin installation failed', 'Plugin installation failed'),
('en', 'The plugin root directory is not writable, please install plugins manually', 'The plugin root directory is not writable, please install plugins manually'),
('en', 'PHP has no <a href=\\\"http://php.net/zip\\\">Zip capability</a>. This is required to allow installation from a remote URL', 'PHP has no <a href=\\\"http://php.net/zip\\\">Zip capability</a>. This is required to allow installation from a remote URL'),
('en', 'Install a new plugin', 'Install a new plugin'),
('en', 'Find plugins', 'Find plugins'),
('en', 'Plugin package URL', 'Plugin package URL'),
('en', 'Install plugin', 'Install plugin'),
('en', 'Installed plugins', 'Installed plugins'),
('en', 'Name', 'Name'),
('en', 'version', 'version'),
('en', 'description', 'Description'),
('en', 'origin', 'origin'),
('en', 'installed', 'installed'),
('en', 'installation Url', 'installation Url'),
('en', 'More information', 'More information'),
('en', 'Documentation Page', 'Documentation Page'),
('en', 'enabled', 'enabled'),
('en', 'Action', 'Action'),
('en', 'Initialise', 'Initialise'),
('en', 'Delete', 'delete'),
('en', 'delete this plugin', 'delete this plugin'),
('en', 'Dependency check', 'Dependency check'),
('en', 'Plugin can not be enabled, because \\\"%s\\\" is enabled.', 'Plugin can not be enabled, because \\\"%s\\\" is enabled.'),
('en', 'Plugin can not be enabled.', 'Plugin can not be enabled.'),
('en', 'Failure on system requirement <strong>%s</strong>', 'Failure on system requirement <strong>%s</strong>'),
('en', 'update this plugin', 'update this plugin'),
('en', 'update', 'update'),
('en', 'details', 'details'),
('en', 'delete subscriber', 'delete subscriber'),
('en', 'unconfirm subscriber', 'unconfirm subscriber'),
('en', 'blacklist subscriber', 'blacklist subscriber'),
('en', 'blacklist email address', 'blacklist email address'),
('en', 'delete subscriber and bounce', 'delete subscriber and bounce'),
('en', 'unconfirm subscriber and delete bounce', 'unconfirm subscriber and delete bounce'),
('en', 'blacklist subscriber and delete bounce', 'add subscriber to the do-not-send-list and delete bounce'),
('en', 'blacklist email address and delete bounce', 'add email address to the do-no-send-list and delete bounce'),
('en', 'delete bounce', 'delete bounce'),
('en', 'Unnamed List', 'Unnamed list'),
('en', 'Hello', 'Hello'),
('en', 'You have requested a new password for phpList.', 'You have requested a new password for phpList.'),
('en', 'To enter a new one, please visit the following link:', 'To enter a new one, please visit the following link:'),
('en', 'You have 24 hours left to change your password. After that, your token won\'t be valid.', 'You have 24 hours left to change your password. After that, your token won\'t be valid.'),
('en', 'New password', 'New password'),
('en', 'A password change token has been sent to the corresponding email address.', 'A password change token has been sent to the corresponding email address.'),
('en', 'Error sending password change token', 'Error sending password change token'),
('en', 'Unknown', 'Unknown'),
('en', 'very little time', 'very little time'),
('en', 'This is the Newsletter Subject', 'This is the Newsletter Subject'),
('en', 'A process for this page is already running and it was still alive %d seconds ago', 'A process for this page is already running and it was still alive %d seconds ago'),
('en', 'Running commandline, quitting. We\'ll find out what to do in the next run.', 'Running commandline, quitting. We\'ll find out what to do in the next run.'),
('en', 'Sleeping for 20 seconds, aborting will quit', 'Sleeping for 20 seconds, aborting will quit'),
('en', 'We have been waiting too long, I guess the other process is still going ok', 'We have been waiting too long, I guess the other process is still going ok'),
('en', 'Error, incorrect session token', 'Error, incorrect session token'),
('en', 'Remote queue processing has been activated successfully', 'Remote queue processing has been activated successfully'),
('en', 'view progress', 'view progress'),
('en', 'Error activating remote queue processing', 'Error activating remote queue processing'),
('en', 'The API key is incorrect', 'The API key is incorrect'),
('en', 'The phpList.com server is unable to reach your phpList installation', 'The phpList.com server is unable to reach your phpList installation'),
('en', 'Unknown error', 'Unknown error'),
('en', 'Change settings', 'Change settings'),
('en', 'Run queue locally', 'Run queue locally'),
('en', 'Sign up to receive news and updates about phpList', 'Sign up to receive news and updates about phpList'),
('en', 'to make sure you are updated when new versions come out. Sometimes security bugs are found which make it important to upgrade. Traffic on the list is very low.', 'to make sure you are updated when new versions come out. Sometimes security bugs are found which make it important to upgrade. Traffic on the list is very low.'),
('en', 'Subscribe', 'Subscribe'),
('en', 'Do not subscribe', 'Do not subscribe'),
('en', 'You do not have access to this page', 'You do not have access to this page'),
('en', 'Download as CSV file', 'Download as CSV file'),
('en', 'There are currently no campaigns to view', 'There are currently no campaigns to view'),
('en', 'bncs', 'bncs'),
('en', 'fwds', 'fwds'),
('en', 'views', 'views'),
('en', 'Clicks', 'Clicks'),
('en', 'rate', 'rate'),
('en', 'date', 'date'),
('en', 'Comparison to other admins', 'Comparison to other admins'),
('en', 'View all campaigns', 'View all campaigns'),
('en', 'Campaign not found', 'Campaign not found'),
('en', 'subject', 'Subject'),
('en', 'Date entered', 'Date entered'),
('en', 'Date sent', 'Date sent'),
('en', 'Sent as HTML', 'Sent as HTML'),
('en', 'Sent as text', 'Sent as text'),
('en', 'Bounced', 'Bounced'),
('en', 'Opened', 'Opened'),
('en', '% Opened', '% Opened'),
('en', 'Clicked', 'Clicked'),
('en', '% Clicked', '% Clicked'),
('en', 'Forwarded', 'Forwarded'),
('en', 'Sending message %d with subject %s to %s', 'Sending message %d with subject %s to %s'),
('en', 'sendingtextonlyto', 'Sending text only to'),
('en', 'Error sending message %d (%d/%d) to %s (%s)', 'Error sending message %d (%d/%d) to %s (%s)'),
('en', 'Size of HTML email: %s', 'Size of HTML email: %s'),
('en', 'Size of Text email: %s', 'Size of Text email: %s'),
('en', 'Message too large (%s is over %s), suspending', 'Message too large (%s is over %s), suspending'),
('en', 'Warning: the final message exceeds the sending limit, this campaign will fail sending. Reduce the size by removing attachments or images', 'Warning: the final message exceeds the sending limit, this campaign will fail sending. Reduce the size by removing attachments or images'),
('en', 'Campaign %d suspended. Message too large', 'Campaign %d suspended. Message too large'),
('en', 'Campaign %d suspended, message too large', 'Campaign %d suspended, message too large'),
('en', 'Insufficient memory to add attachment to campaign %d %d - %d', 'Insufficient memory to add attachment to campaign %d %d - %d'),
('en', 'Error, when trying to send campaign %d the attachment (%s) could not be copied to the repository. Check for permissions.', 'Error, when trying to send campaign %d the attachment (%s) could not be copied to the repository. Check for permissions.'),
('en', 'phpList system error', 'phpList system error'),
('en', 'failed to open attachment (%s) to add to campaign %d', 'failed to open attachment (%s) to add to campaign %d'),
('en', 'Attachment %s does not exist', 'Attachment %s does not exist'),
('en', 'Error, when trying to send campaign %d the attachment (%s) could not be found in the repository', 'Error, when trying to send campaign %d the attachment (%s) could not be found in the repository'),
('en', 'Campaign %d suspended for too many errors with attachments', 'Campaign %d suspended for too many errors with attachments'),
('en', 'import is not available', 'import is not available'),
('en', 'No lists available', 'No lists available'),
('en', 'add_list', 'Add a new list'),
('en', 'Please enter details of the remote Server', 'Please enter details of the remote server'),
('en', 'Server:', 'Server'),
('en', 'User', 'Subscriber'),
('en', 'Password:', 'Password'),
('en', 'Database Name:', 'Database Name'),
('en', 'Table prefix:', 'Table prefix'),
('en', 'Usertable prefix:', 'Usertable prefix'),
('en', 'select_lists', 'Select the lists'),
('en', 'Copy lists from remote server (lists are matched by name)', 'Copy lists from remote server (lists are matched by name)'),
('en', 'Mark new users as HTML:', 'Mark new subscribers as HTML'),
('en', 'If you check \\\"Overwrite Existing\\\", information about a user in the database will be replaced by the imported information. Users are matched by email.', 'If you check \\\"Overwrite existing\\\", information about a subscriber in the database will be replaced by the imported information. Subscribers are matched by email.'),
('en', 'Overwrite Existing:', 'Overwrite existing'),
('en', 'Making connection with remote database', 'Making connection with remote database'),
('en', 'cannot connect to remote database', 'Unable to connect to the remote database'),
('en', 'Getting data from', 'Getting data from'),
('en', 'Remote version is', 'Remote version is'),
('en', 'Remote version has', 'Remote version has'),
('en', 'No users to copy, is the prefix correct?', 'No subscribers to copy, is the prefix correct?'),
('en', 'Lists', 'Lists'),
('en', 'Copying lists', 'Copying lists'),
('en', 'exists locally', 'exists locally'),
('en', 'created locally', 'created locally'),
('en', 'Remote list', 'Remote list'),
('en', 'not created', 'not created'),
('en', 'Copying attributes', 'Copying attributes'),
('en', 'Copying users', 'Copying subscribers'),
('en', 'Error, no mapped attribute for', 'Error, no mapped attribute for'),
('en', 'Error, no local list defined for', 'Error, no local list defined for'),
('en', 'Done', 'Done'),
('en', 'new users', 'new subscribers'),
('en', 'and', 'and'),
('en', 'existing users', 'existing subscribers'),
('en', 'Open Source', 'Open Source'),
('en', 'How to get help', 'How to get help'),
('en', 'How to help out', 'How to help out'),
('en', 'phpList is Open Source software', 'phpList is Open Source software'),
('en', 'The concept behind open source is collaboration. A loosely organised network of many contributors where the whole is greater than the sum of its parts.', 'The concept behind open source is collaboration. A loosely organised network of many contributors where the whole is greater than the sum of its parts.'),
('en', 'If you are interested to know more about Open Source, you can visit the links below', 'If you are interested to know more about Open Source, you can visit the links below'),
('en', 'Get help with phpList', 'Get help with phpList'),
('en', 'To be written. In the meantime you can <a href=\\\"https://www.phplist.com/support\\\">visit the support section on the phpList website</a>', 'To be written. In the meantime you can <a href=\\\"https://www.phplist.com/support\\\">visit the support section on the phpList website</a>'),
('en', 'Help out with phpList', 'Help out with phpList'),
('en', 'To be written. In the meantime you can <a href=\\\"https://www.phplist.com/developers\\\">visit the developers section on the phpList website</a>', 'To be written. In the meantime you can <a href=\\\"https://www.phplist.com/developers\\\">visit the developers section on the phpList website</a>'),
('en', 'This page can only be called from the commandline', 'This page can only be called from the commandline'),
('en', 'Remote processing of the queue is now handled with a processing secret', 'Remote processing of the queue is now handled with a processing secret'),
('en', 'Incorrect processing secret', 'Incorrect processing secret'),
('en', 'Bounce processing error', 'Bounce processing error'),
('en', 'Bounce Processing info', 'Bounce processing info'),
('en', 'system message bounced, user marked unconfirmed', 'system message bounced, subscriber marked unconfirmed'),
('en', 'Bounced system message', 'Bounced system message'),
('en', 'User marked unconfirmed', 'Subscriber marked unconfirmed'),
('en', 'View Bounce', 'View bounce'),
('en', 'system message bounced, but unknown user', 'system message bounced, but unknown subscriber'),
('en', 'Cannot create POP3 connection to', 'Cannot create POP3 connection to'),
('en', 'Cannot open mailbox file', 'Cannot open mailbox file'),
('en', 'bounces to fetch from the mailbox', 'bounces to fetch from the mailbox'),
('en', 'Please do not interrupt this process', 'Please do not interrupt this process'),
('en', 'bounces to process', 'bounces to process'),
('en', 'processing first', 'processing first'),
('en', 'Running in test mode, not deleting messages from mailbox', 'Running in test mode, not deleting messages from mailbox'),
('en', 'Processed messages will be deleted from mailbox', 'Processed messages will be deleted from mailbox'),
('en', 'Deleting message', 'Deleting message'),
('en', 'Not deleting processed message', 'Not deleting processed message'),
('en', 'Not deleting unprocessed message', 'Not deleting unprocessed message'),
('en', 'Closing mailbox, and purging messages', 'Closing mailbox, and purging messages'),
('en', 'IMAP is not included in your PHP installation, cannot continue', 'IMAP is not included in your PHP installation, cannot continue'),
('en', 'Check out', 'Check out'),
('en', 'Bounce mechanism not properly configured', 'Bounce mechanism not properly configured'),
('en', 'bounce_protocol not supported', 'bounce_protocol not supported'),
('en', '%d bounces to reprocess', '%d bounces to reprocess'),
('en', '%d out of %d processed', '%d out of %d processed'),
('en', '%d bounces were re-processed and %d bounces were re-identified', '%d bounces were re-processed and %d bounces were re-identified'),
('en', 'Processing bounces based on active bounce rules', 'Processing bounces based on active bounce rules'),
('en', 'processed %d out of %d bounces for advanced bounce rules', 'processed %d out of %d bounces for advanced bounce rules'),
('en', 'Process Killed by other process', 'Process Killed by other process'),
('en', 'Auto unconfirmed', 'Auto unconfirmed'),
('en', 'Subscriber auto unconfirmed for', 'Subscriber auto unconfirmed for'),
('en', 'bounce rule', 'bounce rule'),
('en', 'Subscriber auto blacklisted  by bounce rule', 'Subscriber auto blacklisted  by bounce rule'),
('en', 'Auto Unsubscribed', 'Auto unsubscribed'),
('en', 'User auto unsubscribed for', 'User auto unsubscribed for'),
('en', 'Subscriber auto blacklisted by bounce rule %d', 'Subscriber auto blacklisted by bounce rule %d'),
('en', 'Email address auto blacklisted by bounce rule %d', 'Email address auto blacklisted by bounce rule %d'),
('en', 'email auto unsubscribed for', 'email auto unsubscribed for'),
('en', 'bounces processed by advanced processing', 'bounces processed by advanced processing'),
('en', 'bounces were not matched by advanced processing rules', 'bounces were not matched by advanced processing rules'),
('en', 'Identifying consecutive bounces', 'Identifying consecutive bounces'),
('en', 'Nothing to do', 'Nothing to do'),
('en', 'User (url:%s) has consecutive bounces (%d) over threshold (%d), user marked unconfirmed', 'Subscriber (url:%s) has consecutive bounces (%d) over threshold (%d), subscriber marked unconfirmed'),
('en', 'Subscriber auto unconfirmed for %d consecutive bounces', 'Subscriber auto unconfirmed for %d consecutive bounces'),
('en', '%d consecutive bounces, threshold reached, blacklisting subscriber', '%d consecutive bounces, threshold reached, blacklisting subscriber'),
('en', '%d consecutive bounces, threshold reached', '%d consecutive bounces, threshold reached'),
('en', 'processed %d out of %d subscribers', 'Processed %d out of %d subscribers'),
('en', 'total of %d subscribers processed', 'total of %d subscribers processed'),
('en', 'Report of advanced bounce processing:', 'Report of advanced bounce processing:'),
('en', 'Below are users who have been marked unconfirmed. The in () is the number of consecutive bounces.', 'Below are subscribers who have been marked unconfirmed. The in () is the number of consecutive bounces.'),
('en', 'Report:', 'Report:'),
('en', 'Sorry, this page can only be used by super admins', 'Sorry, this page can only be used by super admins'),
('en', 'Resending confirmation request to', 'Resending confirmation request to'),
('en', 'user found', 'subscriber found'),
('en', 'no user found', 'no subscriber found'),
('en', 'unable to find original email', 'unable to find original email address'),
('en', 'Marking all subscribers confirmed', 'Marking all subscribers confirmed'),
('en', 'Marking all subscribers on list %s confirmed', 'Marking all subscribers on list %s confirmed'),
('en', 'subscribers apply', 'subscribers apply'),
('en', 'Creating UniqID for all subscribers who do not have one', 'Creating UniqID for all subscribers who do not have one'),
('en', 'Marking all subscribers to receive HTML', 'Marking all subscribers to receive HTML'),
('en', 'Marking all subscribers to receive text', 'Marking all subscribers to receive text'),
('en', 'Deleting subscribers who are not on any list', 'Deleting subscribers who are not on any list'),
('en', 'Moving subscribers who are not on any list to', 'Moving subscribers who are not on any list to'),
('en', 'Deleting subscribers with more than', 'Deleting subscribers with more than'),
('en', 'Blacklisting subscribers with more than', 'Blacklisting subscribers with more than'),
('en', 'Resending request for confirmation to subscribers who signed up after', 'Resending request for confirmation to subscribers who signed up after'),
('en', 'and before', 'and before'),
('en', 'Deleting unconfirmed subscribers who signed up after', 'Deleting unconfirmed subscribers who signed up after'),
('en', 'Trying to merge duplicates', 'Trying to merge duplicates'),
('en', 'Don\'t know how to', 'Don\'t know how to'),
('en', 'Trying to fix subscribers with an invalid email', 'Trying to fix subscribers with an invalid email address'),
('en', 'subscribers fixed', 'subscribers fixed'),
('en', 'subscribers could not be fixed', 'subscribers could not be fixed'),
('en', 'Marking subscribers with an invalid email as unconfirmed', 'Marking subscribers with an invalid email as unconfirmed'),
('en', 'subscribers updated', 'subscribers updated'),
('en', 'Cleaning some user tables of invalid entries', 'Cleaning some user tables of invalid entries'),
('en', 'entries apply', 'entries apply'),
('en', 'Delete will delete user and all listmemberships', 'Delete will delete subscriber and all listmemberships'),
('en', 'subscribers', 'Subscribers'),
('en', 'found', 'found'),
('en', 'in the database', 'in the database'),
('en', '-All-', '-All-'),
('en', 'Mark all subscribers to receive HTML', 'Mark all subscribers to receive HTML'),
('en', 'Mark all subscribers to receive text', 'Mark all subscribers to receive text'),
('en', 'Mark all subscribers on list %s confirmed', 'Mark all subscribers on list %s confirmed'),
('en', 'Click here', 'Click here'),
('en', 'To move all subscribers who are not subscribed to any list to %s', 'To move all subscribers who are not subscribed to any list to %s'),
('en', 'To delete all subscribers with more than', 'To delete all subscribers with more than'),
('en', 'To blacklist all subscribers with more than', 'To blacklist all subscribers with more than'),
('en', 'Note: this will use the total count of bounces on a subscriber, not consecutive bounces', 'Note: this will use the total count of bounces on a subscriber, not consecutive bounces'),
('en', 'Delete subscribers who have an invalid email address', 'Delete subscribers who have an invalid email address'),
('en', 'To delete subscribers who signed up and have not confirmed their subscription', 'To delete subscribers who signed up and have not confirmed their subscription'),
('en', 'Date they signed up after', 'Date they signed up after'),
('en', 'Date they signed up before', 'Date they signed up before'),
('en', 'No such template', 'No such template'),
('en', 'Images stored', 'Images stored'),
('en', 'No images found', 'No images found'),
('en', 'Template saved and ready for use in campaigns', 'Template saved and ready for use in campaigns'),
('en', 'Image', 'Image'),
('en', '\\\"not full URL', 'not full URL'),
('en', 'does not exist', 'does not exist'),
('en', 'Not a full URL', 'Not a full URL'),
('en', 'No Title', 'No title'),
('en', 'Template does not contain the [CONTENT] placeholder', 'Template does not contain the [CONTENT] placeholder'),
('en', 'Template saved', 'Template saved'),
('en', 'Images', 'Images'),
('en', 'Below is the list of images used in your template. If an image is currently unavailable, please upload it to the database.', 'Below is the list of images used in your template. If an image is currently unavailable, please upload it to the database.'),
('en', 'This includes all images, also fully referenced ones, so you may choose not to upload some. If you upload images, they will be included in the campaigns that use this template.', 'This includes all images, also fully referenced ones, so you may choose not to upload some. If you upload images, they will be included in the campaigns that use this template.'),
('en', 'Image name:', 'Image name'),
('en', '%d times used', '%d times used'),
('en', 'Save Images', 'Save images'),
('en', 'Template was successfully saved', 'Template was successfully saved'),
('en', 'Some errors were found, template NOT saved!', 'Some errors were found, template NOT saved!'),
('en', 'Sending test', 'Sending test'),
('en', 'Sending test \\\"Request for confirmation\\\" to', 'Sending test \\\"Request for confirmation\\\" to'),
('en', 'OK', 'OK'),
('en', 'failed', 'failed'),
('en', 'Sending test \\\"Welcome\\\" to', 'Sending test \\\"Welcome\\\" to'),
('en', 'Sending test \\\"Unsubscribe confirmation\\\" to', 'Sending test \\\"Unsubscribe confirmation\\\" to'),
('en', 'Error sending test messages to', 'Error sending test messages to'),
('en', 'Sending a test from templates only works for the system template.', 'Sending a test from templates only works for the system template.'),
('en', 'To test your template, go to campaigns and send a test campaign using the template.', 'To test your template, go to campaigns and send a test campaign using the template.'),
('en', 'List of Templates', 'List of templates'),
('en', 'Title of this template', 'Title of this template'),
('en', 'Content of the template.', 'Content of the template.'),
('en', 'The content should at least have <b>[CONTENT]</b> somewhere.', 'The content should at least have <b>[CONTENT]</b> somewhere.'),
('en', 'You can upload a template file or paste the text in the box below', 'You can upload a template file or paste the text in the box below'),
('en', 'Template file.', 'Template file.'),
('en', 'Check that all links have a full URL', 'Check that all links have a full URL'),
('en', 'Check that all images have a full URL', 'Check that all images have a full URL'),
('en', 'Check that all external images exist', 'Check that all external images exist'),
('en', 'Save Changes', 'Save changes'),
('en', 'Send test message', 'Send test message'),
('en', 'to email addresses', 'to email addresses'),
('en', '(comma separate addresses - all must be existing subscribers)', '(comma separate addresses - all must be existing subscribers)'),
('en', 'Send Test', 'Send test'),
('en', 'Deleting', 'Deleting'),
('en', 'No template have been defined', 'No template have been defined'),
('en', 'Existing templates', 'Existing templates'),
('en', 'ID', 'ID'),
('en', 'Campaign Default', 'Campaign default'),
('en', 'System', 'System'),
('en', 'Add new Template', 'Add new template'),
('en', 'Add default system template', 'Add default system template'),
('en', 'Name cannot be empty:', 'Name cannot be empty'),
('en', 'Name is not unique enough', 'Name is not unique enough'),
('en', 'Existing attributes:', 'Existing attributes:'),
('en', 'No Attributes have been defined yet', 'No attributes have been defined yet'),
('en', 'Attribute:', 'Attribute:'),
('en', 'Name:', 'Name:'),
('en', 'Type', 'Type'),
('en', 'Default Value:', 'Default value:'),
('en', 'Order of Listing:', 'Order of listing:'),
('en', 'Is this attribute required?:', 'Is this attribute required?:'),
('en', 'Add a new Attribute:', 'Add a new attribute:'),
('en', 'The settings have been reset to the phpList default', 'The settings have been reset to the phpList default'),
('en', 'invalid request', 'invalid request'),
('en', 'Are you sure you want to reset the configuration to the default?', 'Are you sure you want to reset the configuration to the default?'),
('en', 'Reset to default', 'Reset to default'),
('en', 'You can edit all of the values in this page, and click the \\\"save changes\\\" button once to save all the changes you made.', 'You can edit all of the values in this page, and click the \\\"save changes\\\" button once to save all the changes you made.'),
('en', 'cannot be empty', 'cannot be empty'),
('en', 'Changes saved', 'Changes saved'),
('en', 'Changes not saved', 'Changes not saved'),
('en', 'Categories saved', 'Categories saved'),
('en', 'settings', 'settings'),
('en', 'Yes', 'Yes'),
('en', 'No', 'No'),
('en', 'edit this value', 'edit this value'),
('en', 'Edit', 'Edit'),
('en', 'No Access', 'You do not have sufficient access'),
('en', 'Remote queue processing settings were saved successfully', 'Remote queue processing settings were saved successfully'),
('en', 'Error, the API key is incorrect', 'Error, the API key is incorrect'),
('en', 'Error, unable to connect to the phpList.com server for checking. Please verify that your webserver is able to connect to https://pqapi.phplist.com', 'Error, unable to connect to the phpList.com server for checking. Please verify that your webserver is able to connect to https://pqapi.phplist.com'),
('en', 'Use local processing instead', 'Use local processing instead'),
('en', 'Process the queue using the service from phpList.com', 'Process the queue using the service from phpList.com'),
('en', 'This is only possible if your phpList installation is not behind a firewall', 'This is only possible if your phpList installation is not behind a firewall'),
('en', 'Your PHP settings do not allow this functionality. Please set \\\"allow_url_fopen\\\" in your php.ini to be \\\"on\\\" to continue.', 'Your PHP settings do not allow this functionality. Please set \\\"allow_url_fopen\\\" in your php.ini to be \\\"on\\\" to continue.'),
('en', 'API key from phpList.com', 'API key from phpList.com'),
('en', 'Continue setup', 'Continue setup'),
('en', 'Blacklisted by', 'Blacklisted by'),
('en', 'All done, %d emails processed<br/>%d emails blacklisted<br/>%d emails deleted<br/>%d emails not found', 'All done, %d emails processed<br/>%d emails blacklisted<br/>%d emails deleted<br/>%d emails not found'),
('en', '%d subscribers could not be deleted, because they have already received campaigns', '%d subscribers could not be deleted, because they have already received campaigns'),
('en', 'Remove more', 'Remove more'),
('en', 'Mass remove email addresses', 'Mass remove email addresses'),
('en', 'Check to also add the emails to the blacklist', 'Check to also add the emails to the blacklist'),
('en', 'Paste the emails to remove in this box, and click continue', 'Paste the emails to remove in this box, and click continue'),
('en', '\\n-------------------------------------------------------------------------------- \\n    This is a notification of a possible spam attack to your phplist subscribe page.\\n    The data submitted has been copied below, so you can check whether this was actually the case.\\n    The submitted data has been converted into non-html characters, for security reasons.\\n    If you want to stop receiving this message, set \\n    \\n     define(\\\"NOTIFY_SPAM\\\",0);  \\n     \\n     in your phplist config file.  \\n     \\n     This subscriber has NOT been added to the database. \\n     If there is an error, you will need to  add them manually.\\n--------------------------------------------------------------------------------', '\\n------------------------------------------------------------------------------- \\nThis is a notification of a possible spam attack to your phplist subscribe page.\\nThe data submitted has been copied below, so you can check whether this was actually the case. \\nThe submitted data has been converted into non-html characters, for security reasons.\\nIf you want to stop receiving this message, set \\n\\ndefine(NOTIFY_SPAM,0);\\n\\n in your phplist config file.\\nThis subscriber has not been added to the database.\\nIf there is an error, you will need to  add them manually\\n\\n --------------------------------------------------------------------------------  \\n'),
('en', 'phplist Spam blocked', 'phplist Spam blocked'),
('en', 'Email is blacklisted, so request for confirmation has been sent.', 'Subscriber is blacklisted, so request for confirmation has been sent.'),
('en', 'If user confirms subscription, they will be removed from the blacklist.', 'If subscriber confirms subscription, they will be removed from the blacklist.'),
('en', 'Choose a message', 'Choose a campaign'),
('en', 'message', 'Message'),
('en', 'Listing %s to %s', 'Listing %s to %s'),
('en', 'total', 'total'),
('en', 'email', 'email'),
('en', 'Add a user', 'Add a subscriber'),
('en', 'add', 'add'),
('en', 'Members of', 'Members of'),
('en', 'edit list details', 'edit list details'),
('en', 'Download subscribers', 'Download subscribers'),
('en', 'Import Subscribers to this list', 'Import subscribers to this list'),
('en', 'subscribers were moved to', 'subscribers were moved to'),
('en', 'subscribers were copied to', 'subscribers were copied to'),
('en', 'subscribers were deleted from this list', 'subscribers were deleted from this list'),
('en', 'The \\\"list of all subscribers\\\" is not a real list, but it gives you access to all subscribers in your system. There may be more subscribers in your system than are members of your lists.', 'The \\\"list of all subscribers\\\" is not a real list, but it gives you access to all subscribers in your system. There may be more subscribers in your system than are members of your lists.'),
('en', 'Users found, click add to add this user', 'subscribers found, click add to add this subscriber'),
('en', 'No user found with that email', 'No subscriber found with that email'),
('en', 'add user', 'Add Subscriber'),
('en', 'Inserting user', 'Inserting subscriber'),
('en', 'User added', 'Subscriber added'),
('en', 'Removing %d from this list', 'Removing %d from this list'),
('en', 'Listing subscriber %d to %d', 'Listing subscriber %d to %d'),
('en', 'Listing subscriber 1 to 50', 'Listing subscriber 1 to 50'),
('en', 'confirmed', 'confirmed'),
('en', 'unconfirmed', 'unconfirmed'),
('en', '%d subscribers', '%d subscribers'),
('en', 'Tag all users in this page', 'Tag all subscribers in this page'),
('en', 'Members', 'Members'),
('en', 'tag', 'tag'),
('en', 'Actions', 'Actions'),
('en', 'What to do with \\\"Tagged\\\" users', 'What to do with \\\"Tagged\\\" subscribers'),
('en', 'This will only process the users in this page that have the \\\"Tag\\\" checkbox checked', 'This will only process the subscribers in this page that have the \\\"Tag\\\" checkbox checked'),
('en', 'from this list', 'from this list'),
('en', 'Move', 'Move'),
('en', 'to', 'to'),
('en', 'Copy', 'Copy'),
('en', 'Nothing', 'Nothing'),
('en', 'What to do with all subscribers', 'What to do with all subscribers'),
('en', 'This will process all subscribers on this list, confirmed and unconfirmed', 'This will process all subscribers on this list, confirmed and unconfirmed'),
('en', 'do it', 'do it'),
('en', 'Deleted', 'Deleted'),
('en', 'subscribe pages', 'Subscribe pages'),
('en', 'title', 'title'),
('en', 'owner', 'owner'),
('en', 'default', 'default'),
('en', 'active', 'active'),
('en', 'not active', 'not active'),
('en', 'View', 'View'),
('en', 'Add a new subscribe page', 'Add a new subscribe page'),
('en', 'default login is', 'Default login is'),
('en', 'with password', 'with password'),
('en', 'In order to login, you need to enable cookies in your browser', 'In order to login, you need to enable cookies in your browser'),
('en', 'Forgot password', 'Forgot Password?'),
('en', 'Enter your email address', 'Enter your email address'),
('en', 'Send password', 'Send Password'),
('en', 'Your password was changed succesfully', 'Your password was changed successfully'),
('en', 'The passwords you entered are not the same.', 'The passwords you entered are not the same.'),
('en', 'You have requested a password update', 'You have requested a password update'),
('en', 'Confirm password', 'confirm password'),
('en', 'Unknown token or time expired (More than 24 hrs. passed since the notification email was sent)', 'Unknown token or time expired (More than 24 hrs. passed since the notification email was sent)'),
('en', 'Password', 'Password'),
('en', 'All done, %d emails processed, %d emails marked unconfirmed, %d emails blacklisted<br/>', 'All done, %d emails processed, %d emails marked unconfirmed, %d emails blacklisted<br/>'),
('en', 'Add more', 'Add more'),
('en', 'Manage suppression list', 'Manage suppression list'),
('en', 'Make suppression permanent', 'Make suppression permanent'),
('en', 'Paste the emails to mark unconfirmed in this box, and click continue', 'Paste the emails to mark unconfirmed in this box, and click continue'),
('en', 'phplist test suite', 'phplist test suite'),
('en', 'Test passed', 'Test passed'),
('en', 'Test failed', 'Test failed'),
('en', 'Tests available', 'Tests available'),
('en', 'Purpose', 'Purpose'),
('en', 'Sort by', 'Sort by'),
('en', 'Ascending', 'Ascending'),
('en', 'Descending', 'Descending'),
('en', 'Embargo', 'Embargo'),
('en', 'draft', 'draft'),
('en', 'static', 'static'),
('en', 'Go', 'Go'),
('en', 'Clear', 'Clear'),
('en', 'Requeuing', 'Requeuing'),
('en', 'This campaign is scheduled to stop sending in the past. No mails will be sent.', 'This campaign is scheduled to stop sending in the past. No mails will be sent.'),
('en', 'Review Scheduling', 'Review scheduling'),
('en', 'Suspending', 'Suspending'),
('en', 'Marking as sent', 'Marking as sent'),
('en', 'Suspending all', 'Suspending all'),
('en', 'Marking all as sent', 'Marking all as sent'),
('en', 'Campaigns', 'Campaigns'),
('en', 'Status', 'Status'),
('en', 'Viewed', 'Viewed'),
('en', 'Unique Views', 'Unique Views'),
('en', 'Time to send', 'Time to send'),
('en', 'Text', 'Text'),
('en', 'html', 'html'),
('en', 'PDF', 'PDF'),
('en', 'both', 'both'),
('en', 'Suspend', 'Suspend'),
('en', 'Statistics', 'Statistics'),
('en', 'Mark&nbsp;sent', 'Mark&nbsp;sent'),
('en', 'Mark sent', 'Mark sent'),
('en', 'Are you sure you want to delete this campaign?', 'Are you sure you want to delete this campaign?'),
('en', 'delete this campaign', 'delete this campaign'),
('en', 'Suspend All', 'Suspend all'),
('en', 'Mark All Sent', 'Mark all sent'),
('en', 'No such attribute:', 'No such attribute'),
('en', 'This datatype does not have editable values', 'This datatype does not have editable values'),
('en', 'Back to attributes', 'Back to attributes'),
('en', 'Add new', 'Add new'),
('en', 'Are you sure you want to delete all values?', 'Are you sure you want to delete all values?'),
('en', 'Alternatively you can replace all values with another one:', 'Alternatively you can replace all values with another one:'),
('en', 'Replace with', 'Replace with'),
('en', 'Delete and replace', 'Delete and replace'),
('en', 'Cannot delete', 'Cannot delete'),
('en', 'The following subscriber(s) are dependent on this value<br />Update the subscriber profiles to not use this attribute value and try again', 'The following subscriber(s) are dependent on this value<br />Update the subscriber profiles to not use this attribute value and try again'),
('en', '* Too many to list, total dependencies:', '* Too many to list, total dependencies:'),
('en', '* Too many errors, quitting', '* Too many errors, quitting'),
('en', 'one per line', 'one per line'),
('en', 'Change order', 'Change order'),
('en', 'You have been logged out, because the session token of your request was incorrect', 'You have been logged out, because the session token of your request was incorrect'),
('en', 'You have been logged out for security purposes, because there were too many errors in your session', 'You have been logged out for security purposes, because there were too many errors in your session'),
('en', 'Converting to UTF-8 requires sufficient diskspace on your system.', 'Converting to UTF-8 requires sufficient diskspace on your system.'),
('en', 'The maximum table size in your system is %s and space available on the root filesystem is %s, which means %s is required.', 'The maximum table size in your system is %s and space available on the root filesystem is %s, which means %s is required.'),
('en', 'This is not a problem if your Database server is on a different filesystem. Click the button to continue.', 'This is not a problem if your Database server is on a different filesystem. Click the button to continue.'),
('en', 'Otherwise, free up some diskspace and try again', 'Otherwise, free up some diskspace and try again'),
('en', 'Confirm UTF8 conversion', 'Confirm UTF8 conversion'),
('en', 'Converting DB to use UTF-8, please wait', 'Converting DB to use UTF-8, please wait'),
('en', 'Upgrading the database to use UTF-8, please wait', 'Upgrading the database to use UTF-8, please wait'),
('en', 'Upgrading table', 'Upgrading table'),
('en', 'Upgrading column', 'Upgrading column'),
('en', 'upgrade to UTF-8, done', 'upgrade to UTF-8, done'),
('en', 'Unable to determine the name of the database to convert', 'Unable to determine the name of the database to convert'),
('en', 'The DB was already converted to UTF-8 on', 'The DB was already converted to UTF-8 on'),
('en', 'All Done', 'All done'),
('en', 'Access Denied', 'Access denied'),
('en', 'Send Campaign', 'Send campaign'),
('en', 'You should not paste the results of a test message back into the editor<br/>This will break the click-track statistics, and overload the server.', 'You should not paste the results of a test message back into the editor<br/>This will break the click-track statistics, and overload the server.'),
('en', 'Warning: You indicated the content was not HTML, but there were  some HTML  tags in it. This  may  cause  errors', 'Warning: You indicated the content was not HTML, but there were some HTML tags in it. This may cause errors'),
('en', 'You are trying to send a remote URL, but PEAR::HTTP_Request or CURL is not available, so this will fail', 'You are trying to send a remote URL, but PEAR::HTTP_Request or CURL is not available, so this will fail'),
('en', 'Mime Type is longer than 255 characters, this is trouble', 'Mime Type is longer than 255 characters, this will cause problems'),
('en', 'Attachment %d succesfully added', 'Attachment %d succesfully added'),
('en', 'Adding attachment %d failed', 'Adding attachment %d failed'),
('en', 'Uploaded file not properly received, empty file', 'Uploaded file not properly received, empty file'),
('en', 'Adding attachment', 'Adding attachment'),
('en', 'Campaign saved as draft', 'Campaign saved as draft'),
('en', 'Campaign added', 'Campaign added'),
('en', 'This campaign is scheduled to stop sending before the embargo time. No mails will be sent.', 'This campaign is scheduled to stop sending before the embargo time. No mails will be sent.'),
('en', 'Campaign queued', 'Campaign queued'),
('en', 'Sorry, you used invalid characters in the Subject field.', 'Sorry, you used invalid characters in the \\\"subject\\\" field.'),
('en', 'Sorry, you used invalid characters in the From field.', 'Sorry, you used invalid characters in the \\\"from\\\" field.'),
('en', 'Please enter a from line.', 'Please enter a from line.'),
('en', 'Please enter a message', 'Please add some content'),
('en', 'Please enter a subject', 'Please enter a subject'),
('en', 'Error: you can use an attribute in one rule only', 'Error: you can use an attribute in one rule only');
INSERT INTO `phplist_i18n` (`lan`, `original`, `translation`) VALUES
('en', 'Please select the list(s) to send the campaign to', 'Please select the list(s) to send the campaign to'),
('en', 'You can send a test mail once every %d seconds', 'You can send a test mail once every %d seconds'),
('en', 'Sending test mails is currently not available', 'Sending test mails is currently not available'),
('en', 'No target email addresses listed for testing.', 'No target email addresses listed for testing.'),
('en', 'There is a maximum of %d test emails allowed', 'There is a maximum of %d test emails allowed'),
('en', 'Sent test mail to', 'Sent test mail to'),
('en', 'success', 'success'),
('en', 'Email address not found to send test message.', 'Email address not found to send test message.'),
('en', 'Removed Attachment', 'Removed attachment'),
('en', 'Content', 'Content'),
('en', 'Forward', 'Forward'),
('en', 'Format', 'Format'),
('en', 'Attach', 'Attach'),
('en', 'Scheduling', 'Scheduling'),
('en', 'Finish', 'Finish'),
('en', 'What is prepare a message', 'What is prepare a message'),
('en', 'Campaign subject', 'Campaign subject'),
('en', 'From Line', 'From line'),
('en', 'Send a Webpage', 'Send a webpage'),
('en', 'Compose Message', 'Compose message'),
('en', 'Send a Webpage - URL', 'Send a webpage - URL'),
('en', 'phpList operates in the time zone \\\"%s\\\"', 'phpList operates in the time zone \\\"%s\\\"'),
('en', 'Dates and times are relative to the Server Time', 'Dates and times are relative to the Server Time'),
('en', 'Current Server Time is', 'Current Server Time is'),
('en', 'Embargoed Until', 'Embargoed until'),
('en', 'Stop sending after', 'Stop sending after'),
('en', 'Repeat campaign every', 'Repeat campaign every'),
('en', 'no repetition', 'no repetition'),
('en', 'hour', 'hour'),
('en', 'day', 'day'),
('en', 'week', 'week'),
('en', 'fortnight', 'fortnight'),
('en', 'four weeks', 'four weeks'),
('en', 'Repeat Until', 'Repeat until'),
('en', 'Requeue every', 'Requeue every'),
('en', 'do not requeue', 'do not requeue'),
('en', 'Requeue Until', 'Requeue until'),
('en', 'Send as', 'Send as'),
('en', 'Use Template', 'Use template'),
('en', 'select one', 'select one'),
('en', 'No template', 'No template'),
('en', 'Plain text version of message', 'Plain text version of message'),
('en', 'generate from HTML', 'generate from HTML'),
('en', 'Footer', 'Footer'),
('en', 'forwardfooter', 'Forward footer'),
('en', 'Add attachments to your campaign', 'Add attachments to your campaign'),
('en', 'The upload has the following limits set by the server', 'The upload has the following limits set by the server'),
('en', 'Maximum size of total data being sent to the server', 'Maximum size of total data being sent to the server'),
('en', 'Maximum size of each individual file', 'Maximum size of each individual file'),
('en', 'Current Attachments', 'Current attachments'),
('en', 'filename', 'File name'),
('en', 'desc', 'desc'),
('en', 'size', 'Size'),
('en', 'file', 'file'),
('en', 'Delete checked', 'Delete checked'),
('en', 'The total size of attachments is very large. Sending this campaign may fail due to resource limits.', 'The total size of attachments is very large. Sending this campaign may fail due to resource limits.'),
('en', 'New Attachment', 'New attachment'),
('en', 'Add (and save)', 'Add (and save)');

-- --------------------------------------------------------

--
-- Table structure for table `phplist_linktrack`
--

CREATE TABLE `phplist_linktrack` (
  `linkid` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `forward` varchar(255) DEFAULT NULL,
  `firstclick` datetime DEFAULT NULL,
  `latestclick` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `clicked` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_linktrack_forward`
--

CREATE TABLE `phplist_linktrack_forward` (
  `id` int(11) NOT NULL,
  `url` varchar(2083) DEFAULT NULL,
  `urlhash` char(32) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT '',
  `personalise` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_linktrack_ml`
--

CREATE TABLE `phplist_linktrack_ml` (
  `messageid` int(11) NOT NULL,
  `forwardid` int(11) NOT NULL,
  `firstclick` datetime DEFAULT NULL,
  `latestclick` datetime DEFAULT NULL,
  `total` int(11) DEFAULT 0,
  `clicked` int(11) DEFAULT 0,
  `htmlclicked` int(11) DEFAULT 0,
  `textclicked` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_linktrack_uml_click`
--

CREATE TABLE `phplist_linktrack_uml_click` (
  `id` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `forwardid` int(11) DEFAULT NULL,
  `firstclick` datetime DEFAULT NULL,
  `latestclick` datetime DEFAULT NULL,
  `clicked` int(11) DEFAULT 0,
  `htmlclicked` int(11) DEFAULT 0,
  `textclicked` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_linktrack_userclick`
--

CREATE TABLE `phplist_linktrack_userclick` (
  `linkid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_list`
--

CREATE TABLE `phplist_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `entered` datetime DEFAULT NULL,
  `listorder` int(11) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `rssfeed` varchar(255) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` tinyint(4) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_list`
--

INSERT INTO `phplist_list` (`id`, `name`, `description`, `entered`, `listorder`, `prefix`, `rssfeed`, `modified`, `active`, `owner`, `category`) VALUES
(1, 'test', 'List for testing', '2019-10-24 09:34:37', NULL, NULL, NULL, '2019-10-24 16:34:37', 0, 1, ''),
(2, 'newsletter', 'Sign up to our newsletter', '2019-10-24 09:34:38', NULL, NULL, NULL, '2019-10-24 16:34:38', 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `phplist_listmessage`
--

CREATE TABLE `phplist_listmessage` (
  `id` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `entered` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_listuser`
--

CREATE TABLE `phplist_listuser` (
  `userid` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `entered` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_listuser`
--

INSERT INTO `phplist_listuser` (`userid`, `listid`, `entered`, `modified`) VALUES
(1, 1, '2019-10-24 09:34:38', '2019-10-24 16:34:38'),
(1, 2, '2019-10-24 09:34:38', '2019-10-24 16:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `phplist_message`
--

CREATE TABLE `phplist_message` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '(no subject)',
  `fromfield` varchar(255) NOT NULL DEFAULT '',
  `tofield` varchar(255) NOT NULL DEFAULT '',
  `replyto` varchar(255) NOT NULL DEFAULT '',
  `message` longtext DEFAULT NULL,
  `textmessage` longtext DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `entered` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `embargo` datetime DEFAULT NULL,
  `repeatinterval` int(11) DEFAULT 0,
  `repeatuntil` datetime DEFAULT NULL,
  `requeueinterval` int(11) DEFAULT 0,
  `requeueuntil` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userselection` text DEFAULT NULL,
  `sent` datetime DEFAULT NULL,
  `htmlformatted` tinyint(4) DEFAULT 0,
  `sendformat` varchar(20) DEFAULT NULL,
  `template` int(11) DEFAULT NULL,
  `processed` mediumint(8) UNSIGNED DEFAULT 0,
  `astext` int(11) DEFAULT 0,
  `ashtml` int(11) DEFAULT 0,
  `astextandhtml` int(11) DEFAULT 0,
  `aspdf` int(11) DEFAULT 0,
  `astextandpdf` int(11) DEFAULT 0,
  `viewed` int(11) DEFAULT 0,
  `bouncecount` int(11) DEFAULT 0,
  `sendstart` datetime DEFAULT NULL,
  `rsstemplate` varchar(100) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_message`
--

INSERT INTO `phplist_message` (`id`, `uuid`, `subject`, `fromfield`, `tofield`, `replyto`, `message`, `textmessage`, `footer`, `entered`, `modified`, `embargo`, `repeatinterval`, `repeatuntil`, `requeueinterval`, `requeueuntil`, `status`, `userselection`, `sent`, `htmlformatted`, `sendformat`, `template`, `processed`, `astext`, `ashtml`, `astextandhtml`, `aspdf`, `astextandpdf`, `viewed`, `bouncecount`, `sendstart`, `rsstemplate`, `owner`) VALUES
(1, 'a8a643d2-2b60-4cda-aea0-b535623f68d1', 'Do you want to continue receiving our messages?', '', '', '', '<p>Hi [FIRST NAME%%there], remember us? You first signed up for our email newsletter on&nbsp;[ENTERED] &ndash; please click here to confirm you&#39;re happy to continue receiving our messages:</p>\r\n\r\n<p><strong><a href=\"[CONFIRMATIONURL]\" title=\"Confirm subscription\">Continue receiving messages</a></strong>&nbsp; <u>(If you do not confirm using this link, then you won&#39;t hear from us again</u>)</p>\r\n\r\n<p>While you&#39;re at it, you can also update your preferences, including your email address or other details, by clicking here:</p>\r\n\r\n<p><strong><a href=\"[PREFERENCESURL]\">Update preferences</a></strong></p>\r\n\r\n<p>By confirming your membership and keeping your details up to date, you&#39;re helping us to manage and protect your data in accordance with best practices.</p>\r\n\r\n<p>Thank you!</p>', NULL, '--\r\n\r\n    <div class=\"footer\" style=\"text-align:left; font-size: 75%;\">\r\n      <p>This message was sent to [EMAIL] by [FROMEMAIL].</p>\r\n      <p>To forward this message, please do not use the forward button of your email application, because this message was made specifically for you only. Instead use the <a href=\"[FORWARDURL]\">forward page</a> in our newsletter system.<br/>\r\n      To change your details and to choose which lists to be subscribed to, visit your personal <a href=\"[PREFERENCESURL]\">preferences page</a>.<br/>\r\n      Or you can <a href=\"[UNSUBSCRIBEURL]\">opt-out completely</a> from all future mailings.</p>\r\n    </div>\r\n\r\n  ', '2019-10-24 09:34:37', '2019-10-24 16:34:37', NULL, 0, NULL, 0, NULL, 'draft', NULL, NULL, 0, 'invite', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phplist_messagedata`
--

CREATE TABLE `phplist_messagedata` (
  `name` varchar(100) NOT NULL,
  `id` int(11) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_message_attachment`
--

CREATE TABLE `phplist_message_attachment` (
  `id` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `attachmentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_sendprocess`
--

CREATE TABLE `phplist_sendprocess` (
  `id` int(11) NOT NULL,
  `started` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `alive` int(11) DEFAULT 1,
  `ipaddress` varchar(50) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_subscribepage`
--

CREATE TABLE `phplist_subscribepage` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `active` tinyint(4) DEFAULT 0,
  `owner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_subscribepage_data`
--

CREATE TABLE `phplist_subscribepage_data` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_template`
--

CREATE TABLE `phplist_template` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` longblob DEFAULT NULL,
  `listorder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_templateimage`
--

CREATE TABLE `phplist_templateimage` (
  `id` int(11) NOT NULL,
  `template` int(11) NOT NULL DEFAULT 0,
  `mimetype` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_templateimage`
--

INSERT INTO `phplist_templateimage` (`id`, `template`, `mimetype`, `filename`, `data`, `width`, `height`) VALUES
(1, 0, 'image/png', 'powerphplist.png', 0x6956424f5277304b47676f414141414e535568455567414141457341414141684341594141414352495662574141414142484e4353565149434167496641686b6941414141416c7753466c7a4141414c45674141437849423074312b2f41414141423530525668305532396d64486468636d554151575276596d5567526d6c795a586476636d747a49454e544e5334787178394936774141446d684a52454655614948746d6e747731465757787a2b2f587a2f54366151545167496b4a6752354c47524946446350735341455745466b5a534969735049635261544b456b454d775547585252615a576c53796c4b50727142444647435879554171694b4c55673641444268435241454751685755314949707275394c742f6a2f326a6b782f7070454f775a6d6f65745836727572727634357837372f6665632b3635743639414e347a4f794d674446675035674b31372b663844324947395150475a6d7072447171707142554c6e6a39455a475446414d664472763354762f6f6278456243347472713644547249366944714d4844625836396666374f6f42764a71713676627849364d596e3468716a666352704166684134663964392f7a6437386e574369486c6a52572b6e777a50476b3530375430673131565a77714c7750415a4c45796274624432506f5078503744565935397541326632306c4b3268675342672f6a56486b5a747669425a4536627a6146337467497766646c76326639664c2f54514333426f5237444f3541584c74627975656d39577076614c636936654f74706a4c4c6234675348316a753361546b763978614438777556614f2b6d35302f43366e65463072424342764e37497373554869546a3153526d6e50696c6a524a634f54312f325777424f665649576b7661366e4b546e336774634a39746b735a4b534e675a622f4d4377656b3939556f6139395371322b454759493631614873433457512f6674457a74462b566b54587551345a6e6a7734776c7446356e667746732f516553506d476174674238626d63344f764c30394245653246756261446858466679644f773154704256622f454273385950592f584b7777595a7a5666786d30335a7338514e7071622b4975614e4f7971677841497a4948453955334143756e4b6c456b695155525546564647525a4271442b6243554173697a6a6362627a507a5556415052507670554271534e2b6c6f7a42624346353547335548512f314c4c49736f367242623057574d566d73534a4945774a4764622f4267775839674e45647939664946545a646572772f684f79515644754d65654a6878447a79736b564a37704a774271634f78747a6231494e555750776837363155617a6c557850484d384b576c6a4f4c5a7247796c7059346a75503543542b392f5836672f2b3152335934676546444c777a2f2b6e697a7a5364482f392b513538793366767844316d355963747338595049766e634f414435334f2b5a494b3136586b2b597246376c516359547336584e346f32426872317a3053646178586473305039554a7238754a4f6449616b74665a4d45427a2f5557797073326d706634694465644f6b7a56744e69614c6c66707a317764596658672f4a2f642f304b4f392b724f56484377755973472f765572313466303058376e597030784950797857764f484e694f597246796a6258416841376f4e4c794d696272756e3770754b4c6a736c754369734c4949624e56525274365373647637742b47692f5659624a595352733346556d5353427333465a504653754f6c4f69524a346e4c744b5577574b2b64504871487855683165567a764e567935715a505946653273546e785676496666424a517849485835544d6843637342485a45337064645631685378683030336f373065664b366730662f3334444d78352f6a696d4c562f51776c2b5972463747334e6c462f74684b394b464a37354543774d5445344e3649674d473757492b512b75455354325636346d49444868642f7452432b4b58507236474d632b664973377038396c2f32736262796a543158525048646a4a75532f4b746259363062316577376b717a6e6170313758743369434d7a736851652b517143704b692f437a79656b4d334a2f6c336a66416a4551534e595545516b43515a6a38654e5871386e4f6a7161794d68495646584637585a6a743975525a526d4c78594a4f703650727766505052666966696b416767434149662f4c4539534964484c4167436e6a6348767a2b41502b5965516454377037437146476a5345684951465656576c746271616d70346443685135772b6652716a30596a5a624134684449412b53464d5542612f585334545a6a4841444d3767525a466e47352f4e686959674151516a4a48355351674d2f7670363274445a314f3136734f7439754e30576a45594441454765696942336f785130465641414733323433425947445a736d584d6e54755841514d476847326b7362475230744a53336e7a7a54525246775751796f616f716b7149455a2f4d475a436d4b6773566949544d7a6b34714b437278654c304b3354765946525647496a59306c4c53324e4579644f494d7379676941514341524953556c6835383664744c53304d472f655046777556316a435646566c374e6978584c6c7968652b2f2f78366458742b44724c4454714b6771667238666d383347756e587265504c4a4a304f49386e673876504c4b4b7a7a3131465055316457526d4a6a49716c5772654f615a5a314256565676324e774f2f33382b7759634e3437625858474470304b443666372b66774249445836325873324c47382f767272784d62476173476d7171726f6444724d5a6a4e6d73376e5850736d795445524542432b3939424c3333484d5062726337624c32775a756a7a2b56426b425a505a52485a32646b685a494244677a62666534747a5a73397879537a4b62667663374e6d78346e73457067356b2f667a36584c312f686a54662f5147784d4c424430655636664436566a6458564734494967594451614152413754452b534a4a784f4a35496b495167434a704d4a673847414c4d743476563545556579497849504730456c45707a355a6c6b50386b74466f704c362b6e716c54707849494248433558456953684d666a306571496f6f68657238666e3878454942504236765469645471785255543349445575574a456e6365757574544a6f346962567231374a75335470476a68774a674d766c6f724c79612b624f6e734d2f3358303343785973704b472b6e734570677846466b5963652b68634f4854724564392f2f4c795a7a4248362f6e377675756f75596d426743675144333333382f555646525646645855317061797266666668733057556b694a7965486566506d6b5a5355524556464253556c4a62533274744b2f6633396d7a5a7246685173586d4478354d756e7036546763447662733263506e6e3338655041717071766270436b56526d44466a426b314e545a53566c5a475a6d636e7332624e4a5455336c327256726650625a5a78772f6670773161395a6773396d595033382b61576c702f5076476a66674467524264596331514a2b724979737869376471316a4c31724c415546425a772f66783641714b676f787434356c6b38506673726237377a4e77494544474470306d4359375a4d675163736550782b2f7a423165693330392b666a35465255555546525868395871707271356d3473534a66504442423477614e51715078344d67434b7865765a72342b486871616d71343737373765502f3939306c495343412b5070373136396454576c704b586c34654e54553165447765746d376479706f31617768304731516e4f6f6e4c7a38386e4a7965486b534e48736e333764704b536b716973724553575a5a352f2f6e6c79636e49306e63334e7a5a772f6631367a68443558466f4a41656e6f36414d7566574934737952515746724a3538325a476a426a42307157504d6d504772396c572f445a66486a314b596d4c696459563650576c706152684e4a6b3158707738704b436a677777382f52424145746d3764536b6c4a4363383939787862746d784270394f7862647332317139666a79524a76507271712b7a647535666c793564545846774d77496b544a336a6b6b55646f613274445656586d7a4a6e4479792b2f7a4c35392b2f423676574748416b456632393765546e5a324e684552456178597359494c4679356774566f5a4e6d77594c70634c683850423473574c4f586a774946753262474651596d4b506e546e3850713271784d584661636d564b3165536c356448595745686c79356459732b6576635446785448766f59643435353133734e767449654b32574274476730464c4734314747686f612b50545454346d4f6a69596d4a6f6232396e614b693475352f6662625355354f5270496b446834386946367670312b2f666c7937646f304442773577787831336148377076666665772b6c30456873625330784d4441634f484f43373737356a3071524a6d692f734455616a6b5a4d6e542b4c7a2b646935637965624e6d31693473534a4e446333593766626959364f526852467a47597a555748385661396b7959714372495132766e4c6c5371622f38335357507261553358743273336274576c35363855583841542b7256362f4735584a706452565a51655736377842466b5a392b2b676c4a6b6a526e626a41592b5048484878454541617656716d33336e6556367656357a394949676f43674b625731746d675076644f6a58726c326a5837392b4e79514b774751795556746279364a46693669707157486d7a4a6d556c4a53775938634f45684d543866763966656f4953356252614b436876714648666c4a694573334e7a625137326f6d4e6a6356734e7250682b513159725661654c6e6861322f61626d712f6938313176584a5a6c45684d54735667736d6e2f786572304d487a346376393950613273726572322b7832774b67714435485645555355314e316377744541675147526c4a616d6f716c793966376e4f676e54704f6e6a7a4a696855726d4470314b6773574c434139505a3246437864715a505549715073697932517963654c45695a433875726f366974392b6d394c5339386e4c7932506a786f326f716f7256616d586a786f3159496979736557594e446f65447332664f496b6c42556753436f5568386644797256713343614454696444724a7973726969536565594e2b2b665451334e36505436634b5331556d594c4d73382f766a6a5a47646e343351364d52674d464251554542455251586c354f61594f482b6e7a2b6642367666683850693063454151426e382f4876486e7a4b4377734a446f3647727664546c565646513648517a752b4751774752464845362f57474a613258343435415a57556c78343866353834373777534355547171796f434542496150474535565652562b76782b547959545a624f61464631356730365a4e4c463336474e3833666b646b78333258536a4165616d7472343935373732584b6c436b34484136536b704c3436717576324c78354d326c7061514168666b6456565152427747417751456551375056363262466a4234324e6a5669745667774741797458727554793563746b5a5756684d42676f4b536e42372f6472784f2f617455744c6537316546693161784d795a4d334534484d5445784f427975586a33335866782b58776350587155705575586b706d5a7961716e6e3862587a54534630526b5a6258533757685a51635470645a47646c386f6333336941364b6871333238327a7a7a354c79772b7453494541632b664d4a54382f5030525a613273722b666e354e445931455230646a543851774f2f3338353962747043636e4d7a535278386c643849456f71785776766e6d47796f714b704156685a6959474c4b7a737a6c2b2f4467656a7765785977644e48544b45754c673450423450753366765a736d534a54676344744c54303345366e5878353742694e5455325954435a6962445a794a3077674d6a49795a49576550584d47434f3649315455314445354a49544d7269396a595746706157766a6a56332b6b7a5237306857617a6d636d544a325051367a6c515867366875364664474a3252735a64752f30494c714d69716771504e7a7633337a3254647636346a4c713466486f2b482f5166326b33784c4d6a6b354f5346452f6644444432782b38555832376673596e553650494542416b7648372f5777744b6d4c77344d45732b733169544f594956455642627a42674d706b515251464656764234504552594968414673624d5442414953397259326867775a777136794d683562746f797671366f77365055496f6f444a5a4d616731344d51584a56757478753657592f5261455256565552527847677945676745385076384b49714371424d786d637a6f64626f4f48516f657478734567636a49534b3432686479616671514869727154425149365555643056445337642b2b6d746157564a55736559664c6b7963783659465a4954566d574f587a6b434e7533622b505973532b444d79734b3047487a71717169312b76523658546f44555979737a4b31736a3468434a772b5861306c56594a4263544147564b396e2f72787a3930326a47316c466e582f666836777551534134494546455553546148553573746d67796272754e39462b4e3570626b5a46525670616d786b5a7161476d72506e734865316b5a6b704256524a336151495243514a4652564a58504d474d77524558787839476a7778482b7a74776f71714b7043744d334770456d544f487a344d442f392b4350694461355a2f707a6f63733738714c61364f6a2f735777645230507261515678776c35456b4351517736413067434d6953684b4971475051473756446346663641684d4667774f7678424b39694f6e61646e77744655584237504667694972513437433849376133444c36396f626f796572326936347066335762322f7a2f6f2f5a346a5131394c4c79654d41414141415355564f524b35435949493d, 70, 30);

-- --------------------------------------------------------

--
-- Table structure for table `phplist_urlcache`
--

CREATE TABLE `phplist_urlcache` (
  `id` int(11) NOT NULL,
  `url` varchar(2083) NOT NULL,
  `lastmodified` int(11) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `content` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_urlcache`
--

INSERT INTO `phplist_urlcache` (`id`, `url`, `lastmodified`, `added`, `content`) VALUES
(1, 'https://www.phplist.com/files/tlds-alpha-by-domain.txt', 1571934990, '2019-10-24 09:36:32', 0x232056657273696f6e20323031383130303430302c204c617374205570646174656420546875204f63742020342030373a30373a30312032303138205554430a4141410a414152500a4142415254480a4142420a4142424f54540a4142425649450a4142430a41424c450a41424f4741444f0a41425544484142490a41430a41434144454d590a414343454e545552450a4143434f554e54414e540a4143434f554e54414e54530a41434f0a4143544956450a4143544f520a41440a414441430a4144530a4144554c540a41450a4145470a4145524f0a4145544e410a41460a4146414d494c59434f4d50414e590a41464c0a4146524943410a41470a4147414b48414e0a4147454e43590a41490a4149470a4149474f0a4149524255530a414952464f5243450a41495254454c0a414b444e0a414c0a414c4641524f4d454f0a414c49424142410a414c495041590a414c4c46494e414e5a0a414c4c53544154450a414c4c590a414c534143450a414c53544f4d0a414d0a414d45524943414e455850524553530a414d45524943414e46414d494c590a414d45580a414d46414d0a414d4943410a414d5354455244414d0a414e414c59544943530a414e44524f49440a414e5155414e0a414e5a0a414f0a414f4c0a41504152544d454e54530a4150500a4150504c450a41510a4151554152454c4c450a41520a415241420a4152414d434f0a41524348490a41524d590a415250410a4152540a415254450a41530a415344410a415349410a4153534f4349415445530a41540a4154484c4554410a4154544f524e45590a41550a41554354494f4e0a415544490a41554449424c450a415544494f0a415553504f53540a415554484f520a4155544f0a4155544f530a415649414e43410a41570a4157530a41580a4158410a415a0a415a5552450a42410a424142590a42414944550a42414e414d45580a42414e414e4152455055424c49430a42414e440a42414e4b0a4241520a42415243454c4f4e410a424152434c4159434152440a424152434c4159530a42415245464f4f540a4241524741494e530a4241534542414c4c0a4241534b455442414c4c0a424155484155530a42415945524e0a42420a4242430a4242540a424256410a4243470a42434e0a42440a42450a42454154530a4245415554590a424545520a42454e544c45590a4245524c494e0a424553540a424553544255590a4245540a42460a42470a42480a4248415254490a42490a4249424c450a4249440a42494b450a42494e470a42494e474f0a42494f0a42495a0a424a0a424c41434b0a424c41434b4652494441590a424c414e434f0a424c4f434b4255535445520a424c4f470a424c4f4f4d424552470a424c55450a424d0a424d530a424d570a424e0a424e4c0a424e50504152494241530a424f0a424f4154530a424f454852494e4745520a424f46410a424f4d0a424f4e440a424f4f0a424f4f4b0a424f4f4b494e470a424f5343480a424f5354494b0a424f53544f4e0a424f540a424f5554495155450a424f580a42520a425241444553434f0a42524944474553544f4e450a42524f41445741590a42524f4b45520a42524f544845520a4252555353454c530a42530a42540a42554441504553540a425547415454490a4255494c440a4255494c444552530a425553494e4553530a4255590a42555a5a0a42560a42570a42590a425a0a425a480a43410a4341420a434146450a43414c0a43414c4c0a43414c56494e4b4c45494e0a43414d0a43414d4552410a43414d500a43414e43455252455345415243480a43414e4f4e0a43415045544f574e0a4341504954414c0a4341504954414c4f4e450a4341520a4341524156414e0a43415244530a434152450a4341524545520a434152454552530a434152530a434152544945520a434153410a434153450a4341534549480a434153480a434153494e4f0a4341540a4341544552494e470a434154484f4c49430a4342410a43424e0a434252450a4342530a43430a43440a4345420a43454e5445520a43454f0a4345524e0a43460a4346410a4346440a43470a43480a4348414e454c0a4348414e4e454c0a434841524954590a43484153450a434841540a43484541500a4348494e5441490a4348524953544d41530a4348524f4d450a43485259534c45520a4348555243480a43490a4349505249414e490a434952434c450a434953434f0a4349544144454c0a434954490a43495449430a434954590a43495459454154530a434b0a434c0a434c41494d530a434c45414e494e470a434c49434b0a434c494e49430a434c494e495155450a434c4f5448494e470a434c4f55440a434c55420a434c55424d45440a434d0a434e0a434f0a434f4143480a434f4445530a434f464645450a434f4c4c4547450a434f4c4f474e450a434f4d0a434f4d434153540a434f4d4d42414e4b0a434f4d4d554e4954590a434f4d50414e590a434f4d504152450a434f4d50555445520a434f4d5345430a434f4e444f530a434f4e535452554354494f4e0a434f4e53554c54494e470a434f4e544143540a434f4e54524143544f52530a434f4f4b494e470a434f4f4b494e474348414e4e454c0a434f4f4c0a434f4f500a434f52534943410a434f554e5452590a434f55504f4e0a434f55504f4e530a434f55525345530a43520a4352454449540a435245444954434152440a435245444954554e494f4e0a435249434b45540a43524f574e0a4352530a4352554953450a435255495345530a4353430a43550a43554953494e454c4c410a43560a43570a43580a43590a43594d52550a43594f550a435a0a44414255520a4441440a44414e43450a444154410a444154450a444154494e470a44415453554e0a4441590a44434c4b0a4444530a44450a4445414c0a4445414c45520a4445414c530a4445475245450a44454c49564552590a44454c4c0a44454c4f495454450a44454c54410a44454d4f435241540a44454e54414c0a44454e544953540a444553490a44455349474e0a4445560a44484c0a4449414d4f4e44530a444945540a4449474954414c0a4449524543540a4449524543544f52590a444953434f554e540a444953434f5645520a444953480a4449590a444a0a444b0a444d0a444e500a444f0a444f43530a444f43544f520a444f4447450a444f470a444f48410a444f4d41494e530a444f540a444f574e4c4f41440a44524956450a4454560a44554241490a4455434b0a44554e4c4f500a44554e530a4455504f4e540a44555242414e0a445641470a4456520a445a0a45415254480a4541540a45430a45434f0a4544454b410a4544550a454455434154494f4e0a45450a45470a454d41494c0a454d4552434b0a454e455247590a454e47494e4545520a454e47494e454552494e470a454e5445525052495345530a45504f53540a4550534f4e0a45515549504d454e540a45520a4552494353534f4e0a45524e490a45530a4553510a4553544154450a45535552414e43450a45540a45544953414c41540a45550a4555524f564953494f4e0a4555530a4556454e54530a4556455242414e4b0a45584348414e47450a4558504552540a4558504f5345440a455850524553530a455854524153504143450a464147450a4641494c0a4641495257494e44530a46414954480a46414d494c590a46414e0a46414e530a4641524d0a4641524d4552530a46415348494f4e0a464153540a46454445580a464545444241434b0a464552524152490a4645525245524f0a46490a464941540a464944454c4954590a4649444f0a46494c4d0a46494e414c0a46494e414e43450a46494e414e4349414c0a464952450a4649524553544f4e450a4649524d44414c450a464953480a46495348494e470a4649540a4649544e4553530a464a0a464b0a464c49434b520a464c49474854530a464c49520a464c4f524953540a464c4f574552530a464c590a464d0a464f0a464f4f0a464f4f440a464f4f444e4554574f524b0a464f4f5442414c4c0a464f52440a464f5245580a464f5253414c450a464f52554d0a464f554e444154494f4e0a464f580a46520a465245450a46524553454e4955530a46524c0a46524f47414e530a46524f4e54444f4f520a46524f4e544945520a4654520a46554a495453550a46554a495845524f580a46554e0a46554e440a4655524e49545552450a465554424f4c0a4659490a47410a47414c0a47414c4c4552590a47414c4c4f0a47414c4c55500a47414d450a47414d45530a4741500a47415244454e0a47420a4742495a0a47440a47444e0a47450a4745410a47454e540a47454e54494e470a47454f5247450a47460a47470a474745450a47480a47490a474946540a47494654530a47495645530a474956494e470a474c0a474c4144450a474c4153530a474c450a474c4f42414c0a474c4f424f0a474d0a474d41494c0a474d42480a474d4f0a474d580a474e0a474f44414444590a474f4c440a474f4c44504f494e540a474f4c460a474f4f0a474f4f44594541520a474f4f470a474f4f474c450a474f500a474f540a474f560a47500a47510a47520a475241494e4745520a47524150484943530a4752415449530a475245454e0a47524950450a47524f434552590a47524f55500a47530a47540a47550a475541524449414e0a47554343490a475547450a47554944450a475549544152530a475552550a47570a47590a484149520a48414d425552470a48414e474f55540a484155530a48424f0a484446430a4844464342414e4b0a4845414c54480a4845414c5448434152450a48454c500a48454c53494e4b490a484552450a4845524d45530a484754560a484950484f500a484953414d495453550a484954414348490a4849560a484b0a484b540a484d0a484e0a484f434b45590a484f4c44494e47530a484f4c494441590a484f4d454445504f540a484f4d45474f4f44530a484f4d45530a484f4d4553454e53450a484f4e44410a484f4e455957454c4c0a484f5253450a484f53504954414c0a484f53540a484f5354494e470a484f540a484f54454c45530a484f54454c530a484f544d41494c0a484f5553450a484f570a48520a485342430a48540a48550a4855474845530a48594154540a4859554e4441490a49424d0a494342430a4943450a4943550a49440a49450a494545450a49464d0a494b414e4f0a494c0a494d0a494d414d41540a494d44420a494d4d4f0a494d4d4f42494c49454e0a494e0a494e430a494e44555354524945530a494e46494e4954490a494e464f0a494e470a494e4b0a494e535449545554450a494e535552414e43450a494e535552450a494e540a494e54454c0a494e5445524e4154494f4e414c0a494e545549540a494e564553544d454e54530a494f0a49504952414e47410a49510a49520a49524953480a49530a4953454c4543540a49534d41494c490a4953540a495354414e42554c0a49540a495441550a4954560a495645434f0a4a41475541520a4a4156410a4a43420a4a43500a4a450a4a4545500a4a45545a540a4a4557454c52590a4a494f0a4a4c4c0a4a4d0a4a4d500a4a4e4a0a4a4f0a4a4f42530a4a4f425552470a4a4f540a4a4f590a4a500a4a504d4f5247414e0a4a5052530a4a5545474f530a4a554e495045520a4b415546454e0a4b4444490a4b450a4b45525259484f54454c530a4b455252594c4f474953544943530a4b4552525950524f504552544945530a4b46480a4b470a4b480a4b490a4b49410a4b494d0a4b494e4445520a4b494e444c450a4b49544348454e0a4b4957490a4b4d0a4b4e0a4b4f454c4e0a4b4f4d415453550a4b4f534845520a4b500a4b504d470a4b504e0a4b520a4b52440a4b5245440a4b554f4b47524f55500a4b570a4b590a4b594f544f0a4b5a0a4c410a4c4143414958410a4c414442524f4b45530a4c414d424f524748494e490a4c414d45520a4c414e4341535445520a4c414e4349410a4c414e434f4d450a4c414e440a4c414e44524f5645520a4c414e584553530a4c4153414c4c450a4c41540a4c4154494e4f0a4c4154524f42450a4c41570a4c41575945520a4c420a4c430a4c44530a4c454153450a4c45434c4552430a4c454652414b0a4c4547414c0a4c45474f0a4c455855530a4c4742540a4c490a4c494149534f4e0a4c49444c0a4c4946450a4c494645494e535552414e43450a4c4946455354594c450a4c49474854494e470a4c494b450a4c494c4c590a4c494d495445440a4c494d4f0a4c494e434f4c4e0a4c494e44450a4c494e4b0a4c495053590a4c4956450a4c4956494e470a4c4958494c0a4c4b0a4c4c430a4c4f414e0a4c4f414e530a4c4f434b45520a4c4f4355530a4c4f46540a4c4f4c0a4c4f4e444f4e0a4c4f5454450a4c4f54544f0a4c4f56450a4c504c0a4c504c46494e414e4349414c0a4c520a4c530a4c540a4c54440a4c5444410a4c550a4c554e444245434b0a4c5550494e0a4c5558450a4c55585552590a4c560a4c590a4d410a4d414359530a4d41445249440a4d4149460a4d4149534f4e0a4d414b4555500a4d414e0a4d414e4147454d454e540a4d414e474f0a4d41500a4d41524b45540a4d41524b4554494e470a4d41524b4554530a4d415252494f54540a4d41525348414c4c530a4d415345524154490a4d415454454c0a4d42410a4d430a4d434b494e5345590a4d440a4d450a4d45440a4d454449410a4d4545540a4d454c424f55524e450a4d454d450a4d454d4f5249414c0a4d454e0a4d454e550a4d4552434b4d53440a4d45544c4946450a4d470a4d480a4d49414d490a4d4943524f534f46540a4d494c0a4d494e490a4d494e540a4d49540a4d4954535542495348490a4d4b0a4d4c0a4d4c420a4d4c530a4d4d0a4d4d410a4d4e0a4d4f0a4d4f42490a4d4f42494c450a4d4f42494c590a4d4f44410a4d4f450a4d4f490a4d4f4d0a4d4f4e4153480a4d4f4e45590a4d4f4e535445520a4d4f5041520a4d4f524d4f4e0a4d4f5254474147450a4d4f53434f570a4d4f544f0a4d4f544f524359434c45530a4d4f560a4d4f5649450a4d4f5649535441520a4d500a4d510a4d520a4d530a4d53440a4d540a4d544e0a4d54520a4d550a4d555345554d0a4d555455414c0a4d560a4d570a4d580a4d590a4d5a0a4e410a4e41420a4e414445580a4e41474f59410a4e414d450a4e4154494f4e574944450a4e41545552410a4e4156590a4e42410a4e430a4e450a4e45430a4e45540a4e455442414e4b0a4e4554464c49580a4e4554574f524b0a4e4555535441520a4e45570a4e4557484f4c4c414e440a4e4557530a4e4558540a4e4558544449524543540a4e455855530a4e460a4e464c0a4e470a4e474f0a4e484b0a4e490a4e49434f0a4e494b450a4e494b4f4e0a4e494e4a410a4e495353414e0a4e49535341590a4e4c0a4e4f0a4e4f4b49410a4e4f5254485745535445524e4d555455414c0a4e4f52544f4e0a4e4f570a4e4f5752555a0a4e4f5754560a4e500a4e520a4e52410a4e52570a4e54540a4e550a4e59430a4e5a0a4f42490a4f425345525645520a4f46460a4f46464943450a4f4b494e4157410a4f4c4159414e0a4f4c4159414e47524f55500a4f4c444e4156590a4f4c4c4f0a4f4d0a4f4d4547410a4f4e450a4f4e470a4f4e4c0a4f4e4c494e450a4f4e594f5552534944450a4f4f4f0a4f50454e0a4f5241434c450a4f52414e47450a4f52470a4f5247414e49430a4f524947494e530a4f53414b410a4f5453554b410a4f54540a4f56480a50410a504147450a50414e41534f4e49430a50415249530a504152530a504152544e4552530a50415254530a50415254590a504153534147454e530a5041590a504343570a50450a5045540a50460a5046495a45520a50470a50480a504841524d4143590a5048440a5048494c4950530a50484f4e450a50484f544f0a50484f544f4752415048590a50484f544f530a50485953494f0a5049414745540a504943530a5049435445540a50494354555245530a5049440a50494e0a50494e470a50494e4b0a50494f4e4545520a50495a5a410a504b0a504c0a504c4143450a504c41590a504c415953544154494f4e0a504c554d42494e470a504c55530a504d0a504e0a504e430a504f484c0a504f4b45520a504f4c495449450a504f524e0a504f53540a50520a5052414d45524943410a50524158490a50524553530a5052494d450a50524f0a50524f440a50524f44554354494f4e530a50524f460a50524f47524553534956450a50524f4d4f0a50524f504552544945530a50524f50455254590a50524f54454354494f4e0a5052550a50525544454e5449414c0a50530a50540a5055420a50570a5057430a50590a51410a51504f4e0a5155454245430a51554553540a5156430a524143494e470a524144494f0a524149440a52450a524541440a5245414c4553544154450a5245414c544f520a5245414c54590a524543495045530a5245440a52454453544f4e450a524544554d4252454c4c410a52454841420a52454953450a52454953454e0a524549540a52454c49414e43450a52454e0a52454e540a52454e54414c530a5245504149520a5245504f52540a52455055424c4943414e0a524553540a52455354415552414e540a5245564945570a524556494557530a524558524f54480a524943480a524943484152444c490a5249434f480a52494748544154484f4d450a52494c0a52494f0a5249500a524d49540a524f0a524f434845520a524f434b530a524f44454f0a524f474552530a524f4f4d0a52530a525356500a52550a52554742590a525548520a52554e0a52570a5257450a5259554b59550a53410a534141524c414e440a534146450a5341464554590a53414b5552410a53414c450a53414c4f4e0a53414d53434c55420a53414d53554e470a53414e4456494b0a53414e4456494b434f524f4d414e540a53414e4f46490a5341500a5341524c0a5341530a534156450a5341584f0a53420a5342490a5342530a53430a5343410a5343420a534348414546464c45520a5343484d4944540a5343484f4c415253484950530a5343484f4f4c0a534348554c450a5343485741525a0a534349454e43450a53434a4f484e534f4e0a53434f520a53434f540a53440a53450a5345415243480a534541540a5345435552450a53454355524954590a5345454b0a53454c4543540a53454e45520a53455256494345530a5345530a534556454e0a5345570a5345580a534558590a5346520a53470a53480a5348414e4752494c410a53484152500a534841570a5348454c4c0a534849410a5348494b5348410a53484f45530a53484f500a53484f5050494e470a53484f554a490a53484f570a53484f5754494d450a5348524952414d0a53490a53494c4b0a53494e410a53494e474c45530a534954450a534a0a534b0a534b490a534b494e0a534b590a534b5950450a534c0a534c494e470a534d0a534d4152540a534d494c450a534e0a534e43460a534f0a534f434345520a534f4349414c0a534f465442414e4b0a534f4654574152450a534f48550a534f4c41520a534f4c5554494f4e530a534f4e470a534f4e590a534f590a53504143450a5350494547454c0a53504f52540a53504f540a53505245414442455454494e470a53520a53524c0a5352540a53540a53544144410a535441504c45530a535441520a535441524855420a535441544542414e4b0a53544154454641524d0a5354430a53544347524f55500a53544f434b484f4c4d0a53544f524147450a53544f52450a53545245414d0a53545544494f0a53545544590a5354594c450a53550a5355434b530a535550504c4945530a535550504c590a535550504f52540a535552460a535552474552590a53555a554b490a53560a5357415443480a5357494654434f5645520a53574953530a53580a53590a5359444e45590a53594d414e5445430a53595354454d530a535a0a5441420a5441495045490a54414c4b0a54414f42414f0a5441524745540a544154414d4f544f52530a54415441520a544154544f4f0a5441580a544158490a54430a5443490a54440a54444b0a5445414d0a544543480a544543484e4f4c4f47590a54454c0a54454c45464f4e4943410a54454d4153454b0a54454e4e49530a544556410a54460a54470a54480a5448440a544845415445520a544845415452450a544941410a5449434b4554530a5449454e44410a54494646414e590a544950530a54495245530a5449524f4c0a544a0a544a4d4158580a544a580a544b0a544b4d4158580a544c0a544d0a544d414c4c0a544e0a544f0a544f4441590a544f4b594f0a544f4f4c530a544f500a544f5241590a544f53484942410a544f54414c0a544f5552530a544f574e0a544f594f54410a544f59530a54520a54524144450a54524144494e470a545241494e494e470a54524156454c0a54524156454c4348414e4e454c0a54524156454c4552530a54524156454c455253494e535552414e43450a54525553540a5452560a54540a545542450a5455490a54554e45530a54555348550a54560a5456530a54570a545a0a55410a5542414e4b0a5542530a55434f4e4e4543540a55470a554b0a554e49434f4d0a554e49564552534954590a554e4f0a554f4c0a5550530a55530a55590a555a0a56410a5641434154494f4e530a56414e410a56414e47554152440a56430a56450a56454741530a56454e54555245530a564552495349474e0a564552534943484552554e470a5645540a56470a56490a5649414a45530a564944454f0a5649470a56494b494e470a56494c4c41530a56494e0a5649500a56495247494e0a564953410a564953494f4e0a56495354415052494e540a564956410a5649564f0a564c41414e444552454e0a564e0a564f444b410a564f4c4b53574147454e0a564f4c564f0a564f54450a564f54494e470a564f544f0a564f594147450a56550a5655454c4f530a57414c45530a57414c4d4152540a57414c5445520a57414e470a57414e47474f550a5741524d414e0a57415443480a574154434845530a574541544845520a574541544845524348414e4e454c0a57454243414d0a57454245520a574542534954450a5745440a57454444494e470a574549424f0a574549520a57460a57484f5357484f0a5749454e0a57494b490a57494c4c49414d48494c4c0a57494e0a57494e444f57530a57494e450a57494e4e4552530a574d450a574f4c544552534b4c555745520a574f4f44534944450a574f524b0a574f524b530a574f524c440a574f570a57530a5754430a5754460a58424f580a5845524f580a5846494e4954590a58494855414e0a58494e0a584e2d2d313142344333440a584e2d2d31434b324531420a584e2d2d315151573233410a584e2d2d325343524a39430a584e2d2d3330525237590a584e2d2d3342535430304d0a584e2d2d334453343433470a584e2d2d33453042373037450a584e2d2d334843524a39430a584e2d2d334f513138564c38504e3336410a584e2d2d33505855384b0a584e2d2d343243324439410a584e2d2d343542523543594c0a584e2d2d343542524a39430a584e2d2d3435513131430a584e2d2d34474252494d0a584e2d2d353442374654413043430a584e2d2d353551573432470a584e2d2d3535515835440a584e2d2d35535533344a393336424753470a584e2d2d35545a4d35470a584e2d2d3646525a3832470a584e2d2d3651513938364233584c0a584e2d2d3830414458484b530a584e2d2d3830414f3231410a584e2d2d383041514543445231410a584e2d2d38304153454844420a584e2d2d3830415357470a584e2d2d38593041303633410a584e2d2d3930413341430a584e2d2d393041450a584e2d2d39304149530a584e2d2d3944425132410a584e2d2d3945543532550a584e2d2d394b52543030410a584e2d2d423457363035464552440a584e2d2d42434b314239413544524534430a584e2d2d43314156470a584e2d2d4332425237470a584e2d2d43434b324233420a584e2d2d434734424b490a584e2d2d434c434843304541304232473241394743440a584e2d2d435a52363934420a584e2d2d435a525330540a584e2d2d435a525532440a584e2d2d443141434a33420a584e2d2d4431414c460a584e2d2d45314134430a584e2d2d45434b5644544339440a584e2d2d454656593838480a584e2d2d455354563735470a584e2d2d4643543432394b0a584e2d2d46484245490a584e2d2d464951323238433548530a584e2d2d4649513634420a584e2d2d4649515338530a584e2d2d4649515a39530a584e2d2d464a51373230410a584e2d2d464c57333531450a584e2d2d465043524a394333440a584e2d2d465a433243394532430a584e2d2d465a5953384436395556474d0a584e2d2d473258583438430a584e2d2d47434b52334630460a584e2d2d474543524a39430a584e2d2d474b33415431450a584e2d2d483242524547334556450a584e2d2d483242524a39430a584e2d2d483242524a394338430a584e2d2d485854383134450a584e2d2d49314236423141364132450a584e2d2d494d523531334e0a584e2d2d494f304137490a584e2d2d4a314145460a584e2d2d4a31414d480a584e2d2d4a3657313933470a584e2d2d4a4c51363155395737420a584e2d2d4a56523138394d0a584e2d2d4b435258373744315834410a584e2d2d4b5052573133440a584e2d2d4b5052593537440a584e2d2d4b5055373136460a584e2d2d4b50555433490a584e2d2d4c314143430a584e2d2d4c4742424154314144384a0a584e2d2d4d474239415742460a584e2d2d4d474241334133454a540a584e2d2d4d474241334134463136410a584e2d2d4d47424137433042424e30410a584e2d2d4d474241414b43374456460a584e2d2d4d474241414d374138480a584e2d2d4d474241423242440a584e2d2d4d4742414939415a475150364a0a584e2d2d4d4742415948374750410a584e2d2d4d474242394642504f420a584e2d2d4d4742424831410a584e2d2d4d4742424831413731450a584e2d2d4d474243304139415a43470a584e2d2d4d4742434137445a444f0a584e2d2d4d4742455250344135443441520a584e2d2d4d474247553832410a584e2d2d4d4742493445434558500a584e2d2d4d4742504c3246480a584e2d2d4d474254334448440a584e2d2d4d4742545832420a584e2d2d4d4742583443443041420a584e2d2d4d4958383931460a584e2d2d4d4b3142553434430a584e2d2d4d585451314d0a584e2d2d4e47424335415a440a584e2d2d4e474245394530410a584e2d2d4e474252580a584e2d2d4e4f44450a584e2d2d4e515637460a584e2d2d4e51563746533030454d410a584e2d2d4e5951593236410a584e2d2d4f33435734480a584e2d2d4f4742504638464c0a584e2d2d4f5455373936440a584e2d2d50314143460a584e2d2d503141490a584e2d2d504254393737430a584e2d2d504742533044480a584e2d2d5053535932550a584e2d2d51394a594234430a584e2d2d51434b4131504d430a584e2d2d5158414d0a584e2d2d524851563936470a584e2d2d524f56553838420a584e2d2d525643314530414d33450a584e2d2d533942524a39430a584e2d2d534553353534470a584e2d2d543630423536410a584e2d2d54434b57450a584e2d2d54495134395851594a0a584e2d2d554e555034590a584e2d2d5645524d47454e53424552415445522d4354420a584e2d2d5645524d47454e534245524154554e472d5057420a584e2d2d56485155560a584e2d2d565551383631420a584e2d2d5734523835454c3846485535444e52410a584e2d2d5734525334304c0a584e2d2d5747424831430a584e2d2d5747424c36410a584e2d2d584851353231420a584e2d2d584b4332414c3348594532410a584e2d2d584b4332444c334135454530480a584e2d2d5939413341510a584e2d2d5946524f344936374f0a584e2d2d5947424932414d4d580a584e2d2d5a4652313634420a5858580a58595a0a5941434854530a5941484f4f0a59414d4158554e0a59414e4445580a59450a594f444f42415348490a594f47410a594f4b4f48414d410a594f550a594f55545542450a59540a59554e0a5a410a5a4150504f530a5a4152410a5a45524f0a5a49500a5a4950504f0a5a4d0a5a4f4e450a5a5545524943480a5a570a),
(2, 'https://www.phplist.com/files/tlds-alpha-by-domain.txt.md5', 1571934992, '2019-10-24 09:36:40', 0x34643562666666353464643131376333623531633732626136623335616562362020746c64732d616c7068612d62792d646f6d61696e2e7478740a);

-- --------------------------------------------------------

--
-- Table structure for table `phplist_usermessage`
--

CREATE TABLE `phplist_usermessage` (
  `messageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `entered` datetime NOT NULL,
  `viewed` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_userstats`
--

CREATE TABLE `phplist_userstats` (
  `id` int(11) NOT NULL,
  `unixdate` int(11) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `listid` int(11) DEFAULT 0,
  `value` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_attribute`
--

CREATE TABLE `phplist_user_attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `listorder` int(11) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `tablename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_blacklist`
--

CREATE TABLE `phplist_user_blacklist` (
  `email` varchar(255) NOT NULL,
  `added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_blacklist_data`
--

CREATE TABLE `phplist_user_blacklist_data` (
  `email` varchar(150) NOT NULL,
  `name` varchar(25) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_message_bounce`
--

CREATE TABLE `phplist_user_message_bounce` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `bounce` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_message_forward`
--

CREATE TABLE `phplist_user_message_forward` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `forward` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_message_view`
--

CREATE TABLE `phplist_user_message_view` (
  `id` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `viewed` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_user`
--

CREATE TABLE `phplist_user_user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `confirmed` tinyint(4) DEFAULT 0,
  `blacklisted` tinyint(4) DEFAULT 0,
  `optedin` tinyint(4) DEFAULT 0,
  `bouncecount` int(11) DEFAULT 0,
  `entered` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `uniqid` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT '',
  `htmlemail` tinyint(4) DEFAULT 0,
  `subscribepage` int(11) DEFAULT NULL,
  `rssfrequency` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `passwordchanged` date DEFAULT NULL,
  `disabled` tinyint(4) DEFAULT 0,
  `extradata` text DEFAULT NULL,
  `foreignkey` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phplist_user_user`
--

INSERT INTO `phplist_user_user` (`id`, `email`, `confirmed`, `blacklisted`, `optedin`, `bouncecount`, `entered`, `modified`, `uniqid`, `uuid`, `htmlemail`, `subscribepage`, `rssfrequency`, `password`, `passwordchanged`, `disabled`, `extradata`, `foreignkey`) VALUES
(1, 'admin@startng.tech', 1, 0, 0, 0, '2019-10-24 09:34:21', '2019-10-24 16:34:21', 'e1f0239ab1642d4baa861fd012d1980c', '5e61a05d-c822-401e-a88c-5dc968d78828', 1, NULL, NULL, 'ca4b97bd261d806ca450806a35834133a30468a1f7d8f233b79a81100da5b8d2', '2019-10-24', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_user_attribute`
--

CREATE TABLE `phplist_user_user_attribute` (
  `attributeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phplist_user_user_history`
--

CREATE TABLE `phplist_user_user_history` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `systeminfo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phplist_admin`
--
ALTER TABLE `phplist_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loginnameidx` (`loginname`);

--
-- Indexes for table `phplist_adminattribute`
--
ALTER TABLE `phplist_adminattribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phplist_admintoken`
--
ALTER TABLE `phplist_admintoken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phplist_admin_attribute`
--
ALTER TABLE `phplist_admin_attribute`
  ADD PRIMARY KEY (`adminattributeid`,`adminid`);

--
-- Indexes for table `phplist_admin_password_request`
--
ALTER TABLE `phplist_admin_password_request`
  ADD PRIMARY KEY (`id_key`);

--
-- Indexes for table `phplist_attachment`
--
ALTER TABLE `phplist_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phplist_bounce`
--
ALTER TABLE `phplist_bounce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dateindex` (`date`),
  ADD KEY `statusidx` (`status`(20));

--
-- Indexes for table `phplist_bounceregex`
--
ALTER TABLE `phplist_bounceregex`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `regex` (`regexhash`);

--
-- Indexes for table `phplist_bounceregex_bounce`
--
ALTER TABLE `phplist_bounceregex_bounce`
  ADD PRIMARY KEY (`regex`,`bounce`);

--
-- Indexes for table `phplist_config`
--
ALTER TABLE `phplist_config`
  ADD PRIMARY KEY (`item`);

--
-- Indexes for table `phplist_eventlog`
--
ALTER TABLE `phplist_eventlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enteredidx` (`entered`),
  ADD KEY `pageidx` (`page`);

--
-- Indexes for table `phplist_i18n`
--
ALTER TABLE `phplist_i18n`
  ADD UNIQUE KEY `lanorigunq` (`lan`,`original`(200)),
  ADD KEY `lanorigidx` (`lan`,`original`(200));

--
-- Indexes for table `phplist_linktrack`
--
ALTER TABLE `phplist_linktrack`
  ADD PRIMARY KEY (`linkid`),
  ADD UNIQUE KEY `miduidurlindex` (`messageid`,`userid`,`url`),
  ADD KEY `midindex` (`messageid`),
  ADD KEY `uidindex` (`userid`),
  ADD KEY `urlindex` (`url`),
  ADD KEY `miduidindex` (`messageid`,`userid`);

--
-- Indexes for table `phplist_linktrack_forward`
--
ALTER TABLE `phplist_linktrack_forward`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `urlunique` (`urlhash`),
  ADD KEY `urlindex` (`url`(255)),
  ADD KEY `uuididx` (`uuid`);

--
-- Indexes for table `phplist_linktrack_ml`
--
ALTER TABLE `phplist_linktrack_ml`
  ADD PRIMARY KEY (`messageid`,`forwardid`),
  ADD KEY `midindex` (`messageid`),
  ADD KEY `fwdindex` (`forwardid`);

--
-- Indexes for table `phplist_linktrack_uml_click`
--
ALTER TABLE `phplist_linktrack_uml_click`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `miduidfwdid` (`messageid`,`userid`,`forwardid`),
  ADD KEY `midindex` (`messageid`),
  ADD KEY `uidindex` (`userid`),
  ADD KEY `miduidindex` (`messageid`,`userid`);

--
-- Indexes for table `phplist_linktrack_userclick`
--
ALTER TABLE `phplist_linktrack_userclick`
  ADD KEY `linkindex` (`linkid`),
  ADD KEY `uidindex` (`userid`),
  ADD KEY `midindex` (`messageid`),
  ADD KEY `linkuserindex` (`linkid`,`userid`),
  ADD KEY `linkusermessageindex` (`linkid`,`userid`,`messageid`);

--
-- Indexes for table `phplist_list`
--
ALTER TABLE `phplist_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nameidx` (`name`),
  ADD KEY `listorderidx` (`listorder`);

--
-- Indexes for table `phplist_listmessage`
--
ALTER TABLE `phplist_listmessage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `messageid` (`messageid`,`listid`),
  ADD KEY `listmessageidx` (`listid`,`messageid`);

--
-- Indexes for table `phplist_listuser`
--
ALTER TABLE `phplist_listuser`
  ADD PRIMARY KEY (`userid`,`listid`),
  ADD KEY `userenteredidx` (`userid`,`entered`),
  ADD KEY `userlistenteredidx` (`userid`,`listid`,`entered`),
  ADD KEY `useridx` (`userid`),
  ADD KEY `listidx` (`listid`);

--
-- Indexes for table `phplist_message`
--
ALTER TABLE `phplist_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuididx` (`uuid`);

--
-- Indexes for table `phplist_messagedata`
--
ALTER TABLE `phplist_messagedata`
  ADD PRIMARY KEY (`name`,`id`);

--
-- Indexes for table `phplist_message_attachment`
--
ALTER TABLE `phplist_message_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageidx` (`messageid`),
  ADD KEY `messageattidx` (`messageid`,`attachmentid`);

--
-- Indexes for table `phplist_sendprocess`
--
ALTER TABLE `phplist_sendprocess`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phplist_subscribepage`
--
ALTER TABLE `phplist_subscribepage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phplist_subscribepage_data`
--
ALTER TABLE `phplist_subscribepage_data`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Indexes for table `phplist_template`
--
ALTER TABLE `phplist_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `phplist_templateimage`
--
ALTER TABLE `phplist_templateimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templateidx` (`template`);

--
-- Indexes for table `phplist_urlcache`
--
ALTER TABLE `phplist_urlcache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `urlindex` (`url`(255));

--
-- Indexes for table `phplist_usermessage`
--
ALTER TABLE `phplist_usermessage`
  ADD PRIMARY KEY (`userid`,`messageid`),
  ADD KEY `messageidindex` (`messageid`),
  ADD KEY `useridindex` (`userid`),
  ADD KEY `enteredindex` (`entered`),
  ADD KEY `statusidx` (`status`),
  ADD KEY `viewedidx` (`viewed`);

--
-- Indexes for table `phplist_userstats`
--
ALTER TABLE `phplist_userstats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry` (`unixdate`,`item`,`listid`),
  ADD KEY `dateindex` (`unixdate`),
  ADD KEY `itemindex` (`item`),
  ADD KEY `listindex` (`listid`),
  ADD KEY `listdateindex` (`listid`,`unixdate`);

--
-- Indexes for table `phplist_user_attribute`
--
ALTER TABLE `phplist_user_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nameindex` (`name`),
  ADD KEY `idnameindex` (`id`,`name`);

--
-- Indexes for table `phplist_user_blacklist`
--
ALTER TABLE `phplist_user_blacklist`
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `emailidx` (`email`);

--
-- Indexes for table `phplist_user_blacklist_data`
--
ALTER TABLE `phplist_user_blacklist_data`
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `emailidx` (`email`),
  ADD KEY `emailnameidx` (`email`,`name`);

--
-- Indexes for table `phplist_user_message_bounce`
--
ALTER TABLE `phplist_user_message_bounce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `umbindex` (`user`,`message`,`bounce`),
  ADD KEY `useridx` (`user`),
  ADD KEY `msgidx` (`message`),
  ADD KEY `bounceidx` (`bounce`);

--
-- Indexes for table `phplist_user_message_forward`
--
ALTER TABLE `phplist_user_message_forward`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usermessageidx` (`user`,`message`),
  ADD KEY `useridx` (`user`),
  ADD KEY `messageidx` (`message`);

--
-- Indexes for table `phplist_user_message_view`
--
ALTER TABLE `phplist_user_message_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usermsgidx` (`userid`,`messageid`),
  ADD KEY `msgidx` (`messageid`),
  ADD KEY `useridx` (`userid`);

--
-- Indexes for table `phplist_user_user`
--
ALTER TABLE `phplist_user_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `foreignkey` (`foreignkey`),
  ADD KEY `idxuniqid` (`uniqid`),
  ADD KEY `enteredindex` (`entered`),
  ADD KEY `confidx` (`confirmed`),
  ADD KEY `blidx` (`blacklisted`),
  ADD KEY `optidx` (`optedin`),
  ADD KEY `uuididx` (`uuid`);

--
-- Indexes for table `phplist_user_user_attribute`
--
ALTER TABLE `phplist_user_user_attribute`
  ADD PRIMARY KEY (`attributeid`,`userid`),
  ADD KEY `userindex` (`userid`),
  ADD KEY `attindex` (`attributeid`),
  ADD KEY `attuserid` (`userid`,`attributeid`);

--
-- Indexes for table `phplist_user_user_history`
--
ALTER TABLE `phplist_user_user_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userididx` (`userid`),
  ADD KEY `dateidx` (`date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phplist_admin`
--
ALTER TABLE `phplist_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phplist_adminattribute`
--
ALTER TABLE `phplist_adminattribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_admintoken`
--
ALTER TABLE `phplist_admintoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phplist_admin_password_request`
--
ALTER TABLE `phplist_admin_password_request`
  MODIFY `id_key` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_attachment`
--
ALTER TABLE `phplist_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_bounce`
--
ALTER TABLE `phplist_bounce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_bounceregex`
--
ALTER TABLE `phplist_bounceregex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_eventlog`
--
ALTER TABLE `phplist_eventlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phplist_linktrack`
--
ALTER TABLE `phplist_linktrack`
  MODIFY `linkid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_linktrack_forward`
--
ALTER TABLE `phplist_linktrack_forward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_linktrack_uml_click`
--
ALTER TABLE `phplist_linktrack_uml_click`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_list`
--
ALTER TABLE `phplist_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phplist_listmessage`
--
ALTER TABLE `phplist_listmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_message`
--
ALTER TABLE `phplist_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phplist_message_attachment`
--
ALTER TABLE `phplist_message_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_sendprocess`
--
ALTER TABLE `phplist_sendprocess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_subscribepage`
--
ALTER TABLE `phplist_subscribepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_template`
--
ALTER TABLE `phplist_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_templateimage`
--
ALTER TABLE `phplist_templateimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phplist_urlcache`
--
ALTER TABLE `phplist_urlcache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phplist_userstats`
--
ALTER TABLE `phplist_userstats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_user_attribute`
--
ALTER TABLE `phplist_user_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_user_message_bounce`
--
ALTER TABLE `phplist_user_message_bounce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_user_message_forward`
--
ALTER TABLE `phplist_user_message_forward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_user_message_view`
--
ALTER TABLE `phplist_user_message_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phplist_user_user`
--
ALTER TABLE `phplist_user_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phplist_user_user_history`
--
ALTER TABLE `phplist_user_user_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
