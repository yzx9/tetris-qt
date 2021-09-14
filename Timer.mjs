.pragma library

function Timer() {
    return Qt.createQmlObject("import QtQuick 2.0; Timer {}", app);
}

export function setTimeout(cb, ms) {
    const timer = new Timer();
    timer.interval = ms;
    timer.repeat = false;
    timer.triggered.connect(function() {
        cb()
        timer.destroy()
    })
    timer.start();

    return () => timer.destroy()
}

export function setInterval(cb, ms) {
    const timer = new Timer();
    timer.interval = ms;
    timer.repeat = true;
    timer.triggered.connect(cb)
    timer.start();

    return () => timer.destroy()
}
