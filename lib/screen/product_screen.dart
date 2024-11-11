import 'package:flutter/material.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/screen/image_slider.dart';
import 'package:shopapp/widgets/product_widget/addto_cart.dart';
import 'package:shopapp/widgets/product_widget/appbar.dart';
import 'package:shopapp/widgets/product_widget/information.dart';
import 'package:shopapp/widgets/product_widget/product_desc.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButton: AddToCart(
        currentNumber: currentNumber,
        onAdd: () {
          setState(() {
            currentNumber++;
          });
        },
        onRemove: () {
          if (currentNumber != 1) {
            setState(() {
              currentNumber--;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductAppbar(),
              ImageSlider(
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
                currentImage: currentImage,
                image: widget.product.image,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: currentImage == index
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 120,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductInfo(product: widget.product),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: List.generate(
                          widget.product.colors.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              
                              duration: const Duration(milliseconds: 300),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentColor == index
                                    ? Colors.white
                                    : widget.product.colors[index],
                                border: currentColor == index
                                    ? Border.all(
                                        color: widget.product.colors[index],
                                      )
                                    : null,
                              ),
                              padding: currentColor == index
                                  ? const EdgeInsets.all(2)
                                  : null,
                              margin: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: widget.product.colors[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ProductDesc(
                        text: widget.product.description,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
