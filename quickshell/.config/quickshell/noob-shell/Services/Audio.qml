pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property PwNodeAudio pwAudio: Pipewire.defaultAudioSink?.audio
    property int speakerVolume: Math.round(pwAudio?.volume * 100) ?? 0
    property bool isMuted: pwAudio?.muted ?? false
}
