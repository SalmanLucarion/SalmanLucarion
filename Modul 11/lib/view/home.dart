import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../viewmodel/tasbih_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TasbihController controller = Get.put(TasbihController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔹 Angka Tasbih
              Obx(
                    () => Text(
                  '${controller.counter.value.round()}',
                  style: const TextStyle(
                    fontSize: 250,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Progress Bar
              Obx(
                    () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearProgressIndicator(
                    value: controller.progress.value / 100,
                    backgroundColor: Colors.white54,
                    color: Colors.amberAccent.shade400,
                    minHeight: 15,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 75),

              // 🔹 Tombol Fingerprint (Tambah Hitungan)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: InkWell(
                  onTap: controller.incrementCounter,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(30),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 100,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // 🔹 Tombol Reset
      floatingActionButton: FloatingActionButton(
        onPressed: controller.resetCounter,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
