# dizyx/homebrew-tap

Homebrew tap for dizyx applications.

## Nockerl Voice

Private speech to text for macOS. Press a hotkey, speak, and clean text is pasted
into whatever app you are using.

```sh
brew install --cask dizyx/tap/nockerl-voice
```

Requires macOS 14 Sonoma or later.

The cask installs the same signed, notarized DMG published on the
[Nockerl Voice releases page](https://github.com/dizyx/nockerl-voice/releases).
The app is Developer ID signed and notarized by Apple, and it is deliberately not
sandboxed: a global hotkey and pasting into the focused app both require
permissions the Mac App Store forbids, which is why it is distributed directly.

Source: <https://github.com/dizyx/nockerl-voice>
