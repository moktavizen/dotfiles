pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property int speakerVolume: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100)
}
