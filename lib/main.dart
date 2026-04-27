import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InDriveHomeScreen(),
    ),
  );
}

class InDriveHomeScreen extends StatelessWidget {
  const InDriveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Map Image (Static Image instead of Live Map)
          Container(
            width: 380,
            height: 380,
            child: Image.network(
              'https://snazzy-maps-cdn.azureedge.net/assets/1243-xxxxxxxxxxx.png?v=20220106114208', // Yeh ek sample map image hai
              fit: BoxFit.cover,
            ),
          ),

          // 2. Top Circular Buttons (Menu & Share)
          Positioned(top: 50, left: 20, child: _buildRoundButton(Icons.menu)),
          Positioned(
            top: 50,
            right: 20,
            child: _buildRoundButton(Icons.reply, isMirror: true),
          ),

          // 3. Map Marker (Grand Parade)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A89F3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Grand Parade",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const Icon(
                  Icons.location_on,
                  color: Color(0xFF4A89F3),
                  size: 48,
                ),
              ],
            ),
          ),

          // 4. Target Location Button
          Positioned(
            right: 20,
            bottom: 420,
            child: _buildRoundButton(Icons.near_me),
          ),

          // 5. Bottom UI Panel
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHowToBanner(),
                const SizedBox(height: 10),
                _buildBookingPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets (Same as before for consistency) ---

  Widget _buildRoundButton(IconData icon, {bool isMirror = false}) {
    return Container(
      height: 48,
      width: 48,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
        ],
      ),
      child: Transform(
        alignment: Alignment.center,
        transform: isMirror ? Matrix4.rotationY(3.14) : Matrix4.identity(),
        child: Icon(icon, color: Colors.black87, size: 24),
      ),
    );
  }

  Widget _buildHowToBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        children: [
          Icon(Icons.help_center_rounded, color: Color(0xFF4A89F3), size: 30),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "How to use inDrive? Click here to learn!",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  Widget _buildBookingPanel() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 35),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildServiceIcon("Ride", Icons.directions_car, true),
                _buildServiceIcon(
                  "Comfort",
                  Icons.airline_seat_recline_extra,
                  false,
                ),
                _buildServiceIcon("Courier", Icons.inventory_2, false),
                _buildServiceIcon("City to city", Icons.map_rounded, false),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Icon(Icons.circle, color: Color(0xFF00A651), size: 16),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  "Grand Parade",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "Entrance",
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Destination Section (Highlighted Area)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black54, size: 24),
                const SizedBox(width: 10),
                const Text(
                  "To",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildChip("South African Revenue Service"),
                        const SizedBox(width: 8),
                        _buildChip("Wa..."),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Fare Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.attach_money, color: Colors.black38, size: 20),
                SizedBox(width: 10),
                Text(
                  "Offer your fare",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                Spacer(),
                Icon(Icons.payment_rounded, color: Colors.black87, size: 22),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // Action Buttons
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB9E902),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Find a driver",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 60,
                width: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFFB9E902),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.tune, color: Colors.black, size: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE2F7CC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 14),
      ),
    );
  }

  Widget _buildServiceIcon(String label, IconData icon, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 75,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFE3F2FD)
                  : const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.black45,
              size: 28,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
