import 'package:flutter/material.dart';
import 'package:fotoflu/controllers/galeria_controller.dart';
import 'package:fotoflu/controllers/panel_inferior_controller.dart';
import 'package:get/get.dart';

class PanelInferior extends GetView<PanelInferiorController> {
  const PanelInferior({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Column(children: [_ControlesNavegacion(), _BarraNavegacion()]),
    );
  }
}

class _ControlesNavegacion extends StatelessWidget {
  final galeriaController = Get.find<GaleriaController>();
  final pageController = Get.find<GaleriaController>().pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (pageController.page! > 0) {
                pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              if (pageController.page! < galeriaController.images.length - 1) {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          IconButton(icon: const Icon(Icons.check), onPressed: () {}),
          IconButton(icon: const Icon(Icons.close), onPressed: () {}),
          IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
          SizedBox(width: 20),
          IconButton(icon: const Icon(Icons.rotate_left), onPressed: () {}),
          IconButton(icon: const Icon(Icons.rotate_right), onPressed: () {}),
          SizedBox(width: 20),
          IconButton(icon: const Icon(Icons.zoom_in), onPressed: () {}),
          IconButton(icon: const Icon(Icons.zoom_out), onPressed: () {}),
        ],
      ),
    );
  }
}

class _BarraNavegacion extends StatelessWidget {
  final galeriaController = Get.find<GaleriaController>();
  final pageController = Get.find<GaleriaController>().pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: Future.delayed(
          Duration(milliseconds: 100),
        ), // Espera breve para asegurar que el PageView esté construido
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Obx(
              () => Slider(
                value: galeriaController.currentPage.value,
                max: galeriaController.images.length.toDouble() - 1,
                onChanged: (double value) {
                  pageController.jumpToPage(value.toInt());
                },
              ),
            );
          }
        },
      ),
    );
  }
}
