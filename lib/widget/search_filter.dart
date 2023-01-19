import 'package:flutter/material.dart';
import 'package:my_todo_test/blocs/exports_bloc.dart';
import '../static/static_data.dart';

class WidgetSearchFilter extends StatelessWidget {
  const WidgetSearchFilter({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BlocBuilder<DarkModeCubit, bool>(
            builder: (context, state) {
              return TextField(
                style: const TextStyle(color: Constants.colorWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      state ? Constants.colorSecondary : Constants.colorWhite,
                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      style: state ? BorderStyle.none : BorderStyle.solid,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: state
                        ? Constants.colorWhite.withOpacity(0.5)
                        : Constants.colorBg,
                    fontSize: 15,
                    letterSpacing: -0.41,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: state
                        ? Constants.colorWhite.withOpacity(0.5)
                        : Constants.colorBg,
                    size: 25,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Clicked Filter'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Constants.colorOrange,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Icon(
              Icons.settings_input_composite_rounded,
              color: Constants.colorWhite.withOpacity(0.8),
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
