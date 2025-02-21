import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/event1.png",
      "title": "New Music Event on Dubai Botek",
      "location": "Riyadh, Marash Tower",
      "price": 500,
    },
    {
      "image": "assets/cart2.png",
      "title": "New Music Event on Dubai Botek",
      "location": "Riyadh, Marash Tower",
      "price": 300,
    },
  ];

  TextEditingController couponController = TextEditingController();
  double discount = 0.0;

  void applyDiscount() {
    if (couponController.text == "1635") {
      setState(() {
        discount = 0.25; 
      });
      showDiscountPopup(true);
    } else {
      showDiscountPopup(false);
    }
  }

  void showDiscountPopup(bool isSuccess) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/image/success.svg",
                height: 50,
                color: isSuccess ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 15),
              Text(
                isSuccess ? "Successfully Discount completed." : "Coupon is not active",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("DONE", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

void clearCart() {
  setState(() {
    cartItems.clear();
  });
  Get.snackbar("Cart Cleared", "The List is Empty",
      snackPosition: SnackPosition.BOTTOM);
}


 void removeItem(int index) {
  setState(() {
    cartItems.removeAt(index);
  });
}
  double get totalPrice {
    double total = cartItems.fold(0, (sum, item) => sum + item["price"]);
    return total - (total * discount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Card",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        cartItems.length.toString().padLeft(2, '0'),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Your Cart",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: clearCart,
                  child: const Text("Clear All",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return cartItemCard(item, index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: couponController,
                    decoration: InputDecoration(
                      hintText: "Have Coupon?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  ),
                  onPressed: applyDiscount,
                  child: const Text("CHECK", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Total Order Value",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                      "${totalPrice.toInt()} SR",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    if (discount > 0)
                      Text(
                        " 800 SR",
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[500]),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cartItemCard(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item["image"],
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["title"],
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                Text(item["location"], style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 5),
                Text("${item["price"]} SR",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
       IconButton(
  onPressed: () => removeItem(index),
  icon: const Icon(Icons.delete, color: Colors.red),
),
        ],
      ),
    );
  }
}
