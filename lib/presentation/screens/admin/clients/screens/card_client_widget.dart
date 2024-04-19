import 'package:app_barber_yha/presentation/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardClientWidget extends StatelessWidget {
  final String nombre;
  final String telefono;
  final String foto;
  final VoidCallback ontap;
  const CardClientWidget({
    super.key,
    this.foto = '',
    required this.nombre,
    required this.telefono,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return GestureDetector(
      onTap: ontap,
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => AdminClientInfo(
      //               nombre: nombre,
      //               foto: foto,
      //               telefono: telefono,
      //             )));

      child: SizedBox(
        width: 340,
        height: 120,
        // width: 343,
        // height: 109,
        child: Container(
          decoration: BoxDecoration(
              color: themeProvider.theme.cardColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                child: Image.asset(
                  width: 90,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  foto,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        nombre,
                        style: themeProvider.theme.textTheme.displayLarge,
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: Text(
                        telefono,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: themeProvider.theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
