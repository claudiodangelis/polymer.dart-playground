import 'dart:html';
import 'dart:convert' show JSON;

import 'package:polymer/polymer.dart';
export 'package:polymer/init.dart';
import 'package:paper_elements/paper_checkbox.dart';
import 'package:paper_elements/paper_slider.dart';

main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      PaperCheckbox cbMute = querySelector('#mute');
      PaperSlider sVolume = querySelector('#volume');

      HttpRequest.getString("/settings.json").then((String json) {

        var settings = JSON.decode(json);

        cbMute.checked = settings["mute"] as bool;
        sVolume.value = settings["volume"] as num;

        cbMute.onChange.listen((_) {

          if (cbMute.checked) {
            sVolume.attributes["disabled"] = "";
          } else {
            sVolume.attributes.remove("disabled");
          }

        });

      });

    });
  });
}
