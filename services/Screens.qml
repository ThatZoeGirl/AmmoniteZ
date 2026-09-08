pragma Singleton

import Quickshell

Singleton {
    id: root

    readonly property list<ShellScreen> screens: Quickshell.screens

    function init() {
        /*screens.forEach(s => {
            var found = found;
            for (let i = 0; i < Config.screens.length; i++) {
                if (Config.screens[i]["name"] == s.name) {
                    found = true;
                }
            }

        if (!found) {
                Config.screens.push({
                    "name": s.name,
                    "bar": true
                });
                Config.save();
              }
            });*/
    }
}
