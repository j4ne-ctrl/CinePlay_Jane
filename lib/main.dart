import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() {
  runApp(const CinePlayApp());
}

class CinePlayApp extends StatelessWidget {
  const CinePlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CinePlay App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5FA),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/main': (context) {
          final username = ModalRoute.of(context)?.settings.arguments as String?;
          return MainNavigationPage(username: username ?? '');
        },
      },
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  final String username;

  const MainNavigationPage({super.key, this.username = ''});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const MovieListPage(),
      const JadwalBioskopPage(),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 114, 88, 0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'CINEPLAY',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD4AF37),
                            letterSpacing: 4,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'CINEPLAY_JANE INSPIRED BY M.TIX',
                          style: TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontSize: 8.5,
                            letterSpacing: 0.5,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C1C),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFF2A2A2A)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.location_on, size: 18, color: Color(0xFFD4AF37)),
                              SizedBox(width: 6),
                              Text(
                                'MALANG',
                                style: TextStyle(
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C1C),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF2A2A2A)),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.search, color: Color(0xFFD4AF37), size: 22),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: pages[_selectedIndex],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFF0E0E0E),
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: const Color(0xFF9A9A9A),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  final List<Map<String, String>> _movies = const [
    {
      'title': 'RESIDENT EVIL',
      'genre': 'Horror / Action',
      'rating': '7,7',
      'synopsis':
          'Directed by Zach Cregger, Resident Evil (2026) is a survival horror film that follows Bryan (Austin Abrams), an ordinary medical courier tasked with delivering a crucial package to a hospital in Raccoon City on a cold, snowy night. The routine assignment quickly spirals into a claustrophobic nightmare when a viral outbreak explodes across the isolated town, mutating the citizens into bloodthirsty monsters. Lacking any military training or heavy weaponry, the everyman protagonist must navigate a relentless gauntlet of infected creatures—clutching a delivery that holds the key to a cure—in a desperate, action-packed race to survive the chaotic night.',
      'image': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR-d8LM8Bo2W2pyrplBFGFY8l2bTFTPmwFepqsjAWXfW3Lg-VtZ',
    },
    {
      'title': 'URANG BUNIAN',
      'genre': 'Horror / Mystery',
      'rating': '9,6',
      'synopsis':
          'Urang Bunian (2026) is an Indonesian survival horror film that brings the chilling Minangkabau folklore of West Sumatra to life. The story centers on Teddy, a disciplined soldier, and his friend Kevin as they travel deep into the remote highlands to visit Teddys wife. Ignoring local warnings to halt their journey before nightfall, the duo presses on into the pitch-black night, only to have their car break down in a dense, mystical forest. They inadvertently cross an invisible threshold into the alternate dimension of the Urang Bunian—mysterious, human-like supernatural entities that twist the fabric of reality, space, and time, trapping the two men in a terrifying struggle to escape the spirits elusive domain.',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUVQHyU1kG0cYIDul9uLl-QsJLTXkBMTHMFABrruXJjnXr57wrk1_2fEk&s=10',
    },
    {
      'title': 'FALL 2: DEADPOINT',
      'genre': 'Thriller / Survival',
      'rating': '5,6',
      'synopsis':
          'Fall 2: Deadpoint (2026) is a survival thriller that serves as a direct sequel to the 2022 hit film Fall, following Jax Hunter, a young woman deeply paralyzed by grief after the death of her sister, Shiloh. Seeking closure and a way to heal, Jax teams up with her sisters fearless friend, Luce, to take on an infamous, extremely dangerous plank walk on Mount Kwan in Thailand. Accompanied by a local guide, their emotional tribute rapidly shifts into a vertiginous nightmare when an unexpected rockslide shatters the climbing path, leaving the two women stranded on a fragile wooden plank thousands of feet in the air. Trapped with zero safety net, thinning oxygen, and punishing exposure, they must conquer their paralyzing psychological fears and fight against brutal odds to survive the terrifying drop below.',
      'image': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSEAjj9fL-j9zTtMYClalkaKC5Vt4craBpdpayPBgkuqoyWrLkx',
    },
    {
      'title': 'AGENSI RUMAH TANGGA',
      'genre': 'Comedy / Drama',
      'rating': '8,2',
      'synopsis':
          'Agensi Rumah Tangga (2026) is an Indonesian comedy-drama film that follows Katia, a proud startup worker who suddenly finds her life upended after getting laid off. Facing a severe financial crunch due to her house mortgage and constant pressure from her retired mother, Katia takes a bold leap of faith by transforming her home into a domestic helper agency named "Agensi Rumah Tangga". Alongside her best friend Sashi, she recruits and trains various women from rural areas to become professional domestic workers. Managing the agency plunges Katias life into a whirlwind of daily drama—ranging from dealing with eccentric, rule-bending helpers to satisfying demanding clients—while unexpectedly finding romance with a man named Kafka who brings a whole new color to her journey.',
      'image': 'https://m.media-amazon.com/images/M/MV5BNzhiM2Q0ZWItNTkzYi00MjYwLTg5MmEtYzY5ZjM2YTE3ZjFiXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    },
    {
      'title': 'ISTIMEWA',
      'genre': 'Drama',
      'rating': '8,5',
      'synopsis':
          'Istimewa (2026) is an Indonesian family drama film that makes history by casting children with disabilities as its main protagonists. The story is set in Rumah Istimewa, a shelter where five children with special needs—Aldo, Bimo, Ken, Nita, and Mul—have built a tight-knit family under the care of their beloved foster father, Pak Mahendra, and a dedicated volunteer named Mbak Kinan. Their peaceful lives are upended when Pak Mahendra, who is secretly battling advanced cancer, abruptly disappears without a trace to spare them the pain of his illness. Refusing to give up on the man who gave them a home, the five friends bravely step outside their comfort zone and embark on a daring journey across the country to find him, facing the unfamiliar outside world and public scrutiny while proving that true family is bonded by love rather than blood.',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2k2AgFkzEQnnFljjybZSzQM3LRiNy4ZE03VpyBBjkO23WO-p1D2FvyiE&s=10',
    },
    {
      'title': 'HEARTH OF THE BEAST',
      'genre': 'Action / Thriller',
      'rating': '7,8',
      'synopsis':
          'Heart of the Beast (2026) is an intense survival thriller directed by David Ayer that explores the profound bond between a man and his loyal animal companion. The story follows James Belmont, a retired Army Special Forces officer deeply struggling with PTSD, who seeks solitude in the remote Alaskan wilderness alongside his retired combat dog, Odin. Their quiet retreat shatters into a brutal nightmare when their seaplane suffers a catastrophic crash, leaving them completely stranded in the freezing arctic terrain. Forced to embark on a grueling 58-mile trek back to civilization with zero safety equipment, the vulnerable duo must brave sub-zero elements, punishing terrain, and aggressive predators like wolves in a raw, life-or-death battle for survival that pushes their physical limits and psychological resilience to the absolute edge.',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSc-e42Z29CdBbvyMp9lup-7MYS1bwJgA91o7PROxUbFMM57mS',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://i.ytimg.com/vi/s1lSPL9nVxU/maxresdefault.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFD4AF37),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Now Playing',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailMoviePage(
                          title: movie['title']!,
                          genre: movie['genre']!,
                          rating: movie['rating']!,
                          synopsis: movie['synopsis']!,
                          image: movie['image']!,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C1C),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              movie['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFFD4AF37),
                                    strokeWidth: 2,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(Icons.movie, color: Color(0xFFD4AF37), size: 34),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie['title']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class DetailMoviePage extends StatelessWidget {
  final String title;
  final String genre;
  final String rating;
  final String synopsis;
  final String image;

  const DetailMoviePage({
    super.key,
    required this.title,
    required this.genre,
    required this.rating,
    required this.synopsis,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double posterWidth = (MediaQuery.of(context).size.width - 52) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E0E),
        foregroundColor: const Color(0xFFD4AF37),
        title: const Text('Movie Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: posterWidth,
                          height: posterWidth * 1.45,
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFF1C1C1C),
                                child: const Icon(Icons.movie, color: Color(0xFFD4AF37), size: 60),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(genre, style: const TextStyle(color: Color(0xFF9A9A9A), fontSize: 14)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFD4AF37), size: 20),
                        const SizedBox(width: 6),
                        Text(
                          '$rating / 10',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Synopsis',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      synopsis,
                      style: const TextStyle(color: Color(0xFFDDDDDD), fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JadwalBioskopPage extends StatelessWidget {
  const JadwalBioskopPage({super.key});

  final List<Map<String, String>> _studios = const [
    {'name': 'Studio IMAX 3D', 'price': 'Rp 75.000'},
    {'name': 'Studio Regular', 'price': 'Rp 40.000'},
    {'name': 'Velvet VIP', 'price': 'Rp 120.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Cinema',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 18),
        ..._studios.map((studio) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailJadwalPage(studio: studio['name']!),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: studio['name']!.toUpperCase(),
                          style: const TextStyle(
                            color: Color(0xFFE5E5E5),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '  (${studio['price']})',
                          style: const TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'CinePlay',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class DetailJadwalPage extends StatelessWidget {
  final String studio;

  const DetailJadwalPage({super.key, required this.studio});

  @override
  Widget build(BuildContext context) {
    const schedule = [
      {'movie': 'Avatar 3', 'time': '12:30 • 15:45 • 19:00'},
      {'movie': 'Spider-Man', 'time': '13:00 • 16:15 • 20:00'},
      {'movie': 'Inception', 'time': '14:00 • 17:30 • 21:00'},
      {'movie': 'Resident Evil', 'time': '15:00 • 18:15 • 21:30'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E0E),
        foregroundColor: const Color(0xFFD4AF37),
        title: Text('$studio Schedule'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: schedule.map((item) {
          return Card(
            color: const Color(0xFF1C1C1C),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(item['movie']!, style: const TextStyle(color: Colors.white)),
              subtitle: Text(item['time']!, style: const TextStyle(color: Color(0xFF9A9A9A))),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, this.username = ''});

  @override
  Widget build(BuildContext context) {
    const history = [
      {'movie': 'Avatar 3', 'info': 'Studio IMAX 3D • 12 Sep 2026'},
      {'movie': 'Inception', 'info': 'Studio Regular • 28 Aug 2026'},
      {'movie': 'Spider-Man', 'info': 'Velvet VIP • 10 Aug 2026'},
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFD4AF37),
            backgroundImage: AssetImage('assets/images/jane.jpeg'),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            username.trim().isEmpty ? 'User' : username.trim(),
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Booking History',
          style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        ...history.map((item) {
          return Card(
            color: const Color(0xFF1C1C1C),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const Icon(Icons.confirmation_number, color: Color(0xFFD4AF37)),
              title: Text(item['movie']!, style: const TextStyle(color: Colors.white)),
              subtitle: Text(item['info']!, style: const TextStyle(color: Color(0xFF9A9A9A))),
            ),
          );
        }),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 146, 0, 0),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ),
      ],
    );
  }
}