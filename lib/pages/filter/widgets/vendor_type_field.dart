import 'package:flutter/material.dart';
import 'package:makemebela/models/filter-model.dart';

class VendorTypeField extends StatelessWidget {
  VendorTypeField({this.onSaved, this.initialValue});
  final FormFieldSetter<int> onSaved;
  final int initialValue;
  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (state.value & VENDOR_TYPE_PRIVATE != 0) {
                  //Para Verificar uma flag
                  if (state.value & VENDOR_TYPE_SALON != 0)
                    state.didChange(state.value &
                        ~VENDOR_TYPE_PRIVATE); // Para desabilitar uma Flag
                  else
                    state.didChange(VENDOR_TYPE_SALON);
                } else {
                  state.didChange(state.value |
                      VENDOR_TYPE_PRIVATE); //Para Habilita uma Flag
                }
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_PRIVATE != 0
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: state.value & VENDOR_TYPE_PRIVATE != 0
                      ? Colors.pink
                      : Colors.transparent,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Privat",
                  style: TextStyle(
                    color: state.value & VENDOR_TYPE_PRIVATE != 0
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                if (state.value & VENDOR_TYPE_SALON != 0) {
                  //Para Verificar uma flag
                  if (state.value & VENDOR_TYPE_PRIVATE != 0)
                    state.didChange(state.value &
                        ~VENDOR_TYPE_SALON); // Para desabilitar uma Flag
                  else
                    state.didChange(VENDOR_TYPE_PRIVATE);
                } else {
                  state.didChange(
                      state.value | VENDOR_TYPE_SALON); //Para Habilita uma Flag
                }
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_SALON != 0
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: state.value & VENDOR_TYPE_SALON != 0
                      ? Colors.pink
                      : Colors.transparent,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Salon",
                  style: TextStyle(
                    color: state.value & VENDOR_TYPE_SALON != 0
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
