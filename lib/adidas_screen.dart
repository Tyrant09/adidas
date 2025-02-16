import 'package:flutter/material.dart';

class AdidasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ พื้นหลังสีขาว
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ชิดซ้าย
          children: [
            const SizedBox(height: 10),

            // Tabs: Women, Men, Kids (Padding ซ้าย-ขวา)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Women",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  SizedBox(width: 20),
                  Text("Men",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  SizedBox(width: 20),
                  Text("Kids",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 10),

            ClipRRect(
              child: Image.asset(
                'assets/images/promotions.jpg',
                width: MediaQuery.of(context).size.width, // ✅ ใช้ขนาดเต็มจอ
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(child: Text("Image not found")),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Image.asset('assets/icons/shoes.png',
                        width: 24, height: 24),
                    title: const Text("SHOES",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(),

                  ListTile(
                    leading: Image.asset('assets/icons/polo-shirt.png',
                        width: 24, height: 24),
                    title: const Text("CLOTHING",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(),

                  ListTile(
                    leading: Image.asset('assets/icons/hat.png',
                        width: 24, height: 24),
                    title: const Text("ACCESSORIES",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(),

                  const SizedBox(height: 10),

                  // ✅ Grid of Buttons (SALE, SPORT, NEW & TRENDING, GIFT CARDS) แบบขนาด Auto
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.5, // ✅ ปรับอัตราส่วนให้ดีขึ้น
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return _buildCategoryItem(categories[index]['icon']!,
                          categories[index]['label']!);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.percent, 'label': "SALE"},
    {'icon': Icons.directions_run, 'label': "SPORT"},
    {'icon': Icons.local_fire_department, 'label': "NEW & TRENDING"},
    {'icon': Icons.card_giftcard, 'label': "GIFT CARDS"},
  ];

  Widget _buildCategoryItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 8), // ✅ ปรับ Padding
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ ให้ขนาดปรับตามเนื้อหา
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.black),
          const SizedBox(height: 5),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
