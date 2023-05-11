import 'package:flutter/material.dart';

import '../model/data_model.dart';

class GameProvider with ChangeNotifier {
  final List<DataModel> _categoryData = [
    DataModel(
      image: 'assets/images/animals.png',
      name: 'Animals',
      description: 'Imitate animal behavior or sounds it makes. Guess which animal your friend is trying to tell you about',
      words: [
        'Dog',
        'Cow',
        'Cat',
        'Horse',
        'Donkey',
        'Tiger',
        'Lion',
        'Panther',
        'Leopard',
        'Cheetah',
        'Bear',
        'Elephant',
        'Polar bear',
        'Turtle',
        'Tortoise',
        'Crocodile',
        'Rabbit',
        'Porcupine',
        'Hare',
        'Hen',
        'Pigeon',
        'Albatross',
        'Crow',
        'Fish',
        'Dolphin',
        'Frog',
        'Whale',
        'Alligator',
        'Eagle',
        'Flying squirrel',
        'Ostrich',
        'Fox',
        'Goat',
        'Jackal',
        'Emu',
        'Armadillo',
        'Eel',
        'Goose',
        'Arctic fox',
        'Wolf',
        'Beagle',
        'Gorilla',
        'Chimpanzee',
        'Monkey',
        'Beaver',
        'Orangutan',
        'Antelope',
        'Bat',
        'Badger',
        'Giraffe',
        'Hermit',
        'Crab',
        'Giant Panda',
        'Hamster',
        'Cobra',
        'Hammerhead shark',
        'Camel',
        'Hawk',
        'Deer',
        'Chameleon',
        'Hippopotamus',
        'Jaguar',
        'Chihuahua',
        'King Cobra',
        'Ibex',
        'Lizard',
        'Koala',
        'Kangaroo',
        'Iguana',
        'Llama',
        'Chinchillas',
        'Dodo',
        'Jellyfish',
        'Rhinoceros',
        'Hedgehog',
        'Zebra',
        'Possum',
        'Wombat',
        'Bison',
        'Bull',
        'Buffalo',
        'Sheep',
        'Meerkat',
        'Mouse',
        'Otter',
        'Sloth',
        'Owl',
        'Vulture',
        'Flamingo',
        'Racoon',
        'Mole',
        'Duck',
        'Swan',
        'Lynx',
        'Monitor lizard',
        'Elk',
        'Boar',
        'Lemur',
        'Mule',
        'Baboon',
        'Mammoth',
        'Blue whale',
        'Rat',
        'Snake',
        'Peacock',
      ],
    ),
    DataModel(
      image: 'assets/images/fruits.png',
      name: 'Fruits & Vegetables',
      description: 'These fruits and vegetables are wonderful. Try to describe it by describing its color, taste and appearance',
      words: [
        'Apple',
        'Watermelon',
        'Orange',
        'Pear',
        'Cherry',
        'Strawberry',
        'Nectarine',
        'Grape',
        'Mango',
        'Blueberry',
        'Pomegranate',
        'Carambola',
        'Plum',
        'Banana',
        'Raspberry',
        'Mandarin',
        'Jackfruit',
        'Papaya',
        'Kiwi',
        'Pineapple',
        'Lime',
        'Lemon',
        'Apricot',
        'Grapefruit',
        'Melon',
        'Coconut',
        'Avocado',
        'Peach',
        'Corn',
        'Mushroom',
        'Broccoli',
        'Cucumber',
        'Red pepper',
        'Pineapple',
        'Tomato',
        'Swede',
        'Carrot',
        'Brussels sprout',
        'Pumpkin',
        'Cabbage',
        'Potato',
        'Eggplant',
        'Sweet potato',
        'Turnip',
        'Zucchini',
        'Green chilli',
        'Onion',
        'Lettuce',
        'Radish',
        'Pea',
        'Asparagus',
        'Celery',
        'Green pepper',
        'French beans',
        'Spinach',
        'Beet',
        'Red chillies',
        'Bean',
      ],
    ),
    DataModel(
      image: 'assets/images/countries.png',
      name: 'Countries',
      description: 'How are you with geography? If you are not very good, you can make it guessed by telling the famous sheikhs of the countries.',
      words: [
        'Afghanistan',
        'Albania',
        'Algeria',
        'Andorra',
        'Angola',
        'Antigua and Barbuda',
        'Argentina',
        'Armenia',
        'Australia',
        'Austria',
        'Azerbaijan',
        'The Bahamas',
        'Bahrain',
        'Bangladesh',
        'Barbados',
        'Belarus',
        'Belgium',
        'Belize',
        'Benin',
        'Bolivia',
        'Bosnia and Herzegovina',
        'Brazil',
        'Bulgaria',
        'Cambodia',
        'Cameroon',
        'Canada',
        'Chile',
        'China',
        'Colombia',
        'Cyprus',
        'Denmark',
        'Dominican Republic',
        'Ecuador',
        'Egypt',
        'Ethiopia',
        'Fiji',
        'Finland',
        'France',
        'Georgia',
        'Germany',
        'Greece',
        'Guinea',
        'Haiti',
        'Hungary',
        'Iceland',
        'India',
        'Indonesia',
        'Iran',
        'Iraq',
        'Ireland',
        'Israel',
        'Italy',
        'Japan',
        'Jordan',
        'Kazakhstan',
        'Kenya',
        'Korea',
        'Kosovo',
        'Kuwait',
        'Kyrgyzstan',
        'Liberia',
        'Libya',
        'Madagascar',
        'Malaysia',
        'Maldives',
        'Mali',
        'Malta',
        'Mexico',
        'Moldova',
        'Monaco',
        'Mongolia',
        'Montenegro',
        'Morocco',
        'Mozambique',
        'Namibia',
        'Nepal',
        'Netherlands',
        'New Zealand',
        'Nicaragua',
        'Niger',
        'Nigeria',
        'Norway',
        'Oman',
        'Pakistan',
        'Palau',
        'Panama',
        'Papua New Guinea',
        'Paraguay',
        'Peru',
        'Philippines',
        'Poland',
        'Portugal',
        'Qatar',
        'Romania',
        'Russia',
        'Saudi Arabia',
        'Serbia',
        'Singapore',
        'Somalia',
        'South Africa',
        'Spain',
        'Sri Lanka',
        'Sudan',
        'Sweden',
        'Switzerland',
        'Syria',
        'Taiwan',
        'Tajikistan',
        'Tanzania',
        'Thailand',
        'Tunisia',
        'Turkey',
        'Turkmenistan',
        'Tuvalu',
        'Uganda',
        'Ukraine',
        'United Arab Emirates',
        'United Kingdom',
        'United States',
        'Uruguay',
        'Uzbekistan',
        'Vatican City',
        'Venezuela',
        'Vietnam',
        'Yemen',
        'Zimbabwe',
      ],
    ),
    DataModel(
      image: 'assets/images/vehicles.png',
      name: 'Vehicles',
      description:
          'We use many vehicles in our daily life. Can you explain this without saying it? It may be easy for you to describe their voices and appearances by describing them.',
      words: [
        'Car',
        'Plane',
        'Ferry',
        'Ship',
        'Boat',
        'Baloon',
        'Bicycle',
        'Van',
        'Skateboard',
        'Taxi',
        'Police car',
        'Ambulance',
        'Bus',
        'Tractor',
        'Subway',
        'Fire engine',
        'Baby carriage',
        'Crane',
        'Forklift',
        'Motorcycle',
        'Recycling truck',
        'Mountain bike',
        'Tonga',
        'Cement mixer',
        'Scooter',
        'Water tanker',
        'Metro',
        'Helicopter',
        'Jeep',
        'Airoplane',
        'Tricycle',
        'School bus',
        'Submarine',
        'Escavator',
        'Sailboat',
        'Rocket',
        'Yacht',
        'Zeppelin',
        'Garbage truck',
        'Horse carriage',
        'Cruiser',
        'Coach',
        'Canoe',
        'Parachute',
        'Skis',
        'Go-kart',
        'Buoy',
        'Fighter jet',
        'Golfcart',
        'Sledge dog',
        'Wind glider',
        'Semitrailer',
        'Bulldozer',
        'Tramway',
        'Locomotive',
        'Tram',
        'Rowboat',
        'Camper van',
        'Limousine',
        'Barge',
        'Maglev',
        'Ice boat',
        'Drone',
      ],
    ),
    DataModel(
      image: 'assets/images/music.png',
      name: 'Music Instruments',
      description: "Do you like music? who doesn't love it! Then let's try to guess which musical instrument it is",
      words: [
        'Piano',
        'Flute',
        'Veena',
        'Drums',
        'Mridangam',
        'Violin',
        'Guitar',
        'Triangle',
        'Trumpet',
        'Saxophone',
        'Mouth organ',
        'Cello',
        'Xylophone',
        'Clap box',
        'Electric guitar',
        'Bass guitar',
        'Bugle',
        'Harp',
        'Harmonium',
        'Oboe',
        'Maracas',
        'Cymbal',
        'Accordion',
        'Bongo drums',
        'Bell',
        'French horn',
        'Banjo',
        'Conga drums',
        'Keyboard',
        'Gong',
        'Pipe organ',
        'Comet',
        'Tambourine',
        'Trombone',
        'Ukulele',
        'Electronic drums',
        'Drum pad',
        'Clarinet',
        'Harmonica',
        'Tuba',
        'Bass drum',
        'Snare drum',
        'Euphonium',
        'Piccolo',
        'Lute',
        'Marimba',
        'Bassoon',
        'Cornet',
        'Celesta',
        'Spinet',
        'Oud',
        'Yueqin',
        'Dholak',
        'Tabla',
        'Damru',
        'Sarangi',
        'Sitar',
        'Gu-zheng',
        'Ektara',
        'Shehnai',
        'Sarod',
        'Pungi',
        'Gramophone',
        'Tubular Chimes',
      ],
    ),
    DataModel(
      image: 'assets/images/foods.png',
      name: 'Foods & Drinks',
      description: 'Try to guess the name of delicious food and drinks from each of them. You can describe its taste and appearance',
      words: [
        '7 Up',
        'Acid',
        'Almond',
        'Anorexia',
        'Apple',
        'Apple pie',
        'Bacon',
        'Bagel',
        'Banana',
        'Basil',
        'Bean',
        'Beer',
        'Berry',
        'Bite',
        'Bitter',
        'Bland',
        'Bounty',
        'Brandy',
        'Breakfast',
        'Broccoli',
        'Brownie',
        'Bulimia',
        'Burger',
        'Burger King',
        'Burritos',
        'Butter',
        'Cabbage',
        'Caesar',
        'Cake',
        'Calamari',
        'Candy',
        'Celery',
        'Champagne',
        'Cheese',
        'Cheeseburger',
        'Cheesecake',
        'Chewing gum',
        'Chili',
        'Chips',
        'Chocolate',
        'Coca-Cola',
        'Coffee',
        'Cookie',
        'Corn',
        'Corn Flakes',
        'Cottage cheese',
        'Crunchy',
        'Cupcake',
        'Dinner',
        'Donut',
        'Dr. Pepper',
        'Eggs',
        'Fanta',
        'Fork',
        'French fries',
        'Fried chicken',
        'Garlic bread',
        'Ginger',
        'Herbs',
        'Hot dog',
        'Hot wings',
        'Ice cream',
        'Jelly',
        'KFC',
        'Kebab',
        'Lasagna',
        'Lemonade',
        'Lobster',
        'Lollipop',
        'Lunch',
        'Mac and cheese',
        'Margarine',
        "McDonald's",
        'Milk',
        'Mint',
        'Mountain Dew',
        'Mushroom',
        'Noodles',
        'Nougat',
        'Onion',
        'Oreo',
        'Pancakes',
        'Pasta',
        'Pepper',
        'Pepsi',
        'Pizza',
        'Pizza Hut',
        'Plate',
        'Popcorn',
        'Potato',
        'Quesadilla',
        'Raw',
        'Restaurant',
        'Ribs',
        'Rice',
        'Salty',
        'Sausage',
        'Shrimp',
        'Snacks',
        'Soup',
        'Sour',
        'Spaghetti',
        'Spicy',
        'Spoon',
        'Sprite',
        'Steak',
        'Stomach rumble',
        'Subway',
        'Sugar',
        'Sushi',
        'Sweet',
        'Taco Bell',
        'Tacos',
        'Tea',
        'Toast',
        'Toffee',
        'Tuna',
        'Waffles',
        'Water',
        'Watermelon',
        "Wendy's",
        'White chocolate',
        'Yogurt'
      ],
    ),
  ];

  List<DataModel> get categoryData => _categoryData;

  int? _minute;
  int? get minute => _minute;

  void setMinute(int? m) {
    _minute = m;
    notifyListeners();
  }

  String? _second;
  String? get second => _second;

  void setSecond(String? s) {
    _second = s;
    notifyListeners();
  }

  DataModel? _selectedCategory;
  DataModel? get selectedCategory => _selectedCategory;

  void setSelectedCategory(DataModel? s) {
    _selectedCategory = s;
    notifyListeners();
  }

  List<String>? _wrong;
  List<String>? get wrong => _wrong;

  void addWrongs(String? s) {
    _wrong!.add(s!);
    notifyListeners();
  }

  List<String>? _correct;
  List<String>? get correct => _correct;

  void addCorrects(String? s) {
    _correct!.add(s!);
    notifyListeners();
  }
}