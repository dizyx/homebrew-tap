cask "nockerl-voice" do
  version "1.0.9"
  sha256 "644c760392f78b1122e46b0e217cc7a146be6251f363c51d034e02ad574aa5fd"

  # The app bundle is named "Nockerl Voice.app" but the DMG deliberately is not. A space in
  # the filename becomes %20 in this URL and in the Sparkle appcast enclosure that every
  # installed copy parses, so the artefact keeps a plain name.
  url "https://github.com/dizyx/nockerl-voice/releases/download/v#{version}/NockerlVoice-#{version}.dmg"
  name "Nockerl Voice"
  desc "Speech-to-text for macOS"
  homepage "https://nockerl.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself through Sparkle. Declaring it stops brew treating a
  # self-updated install as drift and trying to reinstall over the top of it.
  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Nockerl Voice.app"

  zap trash: [
    "~/Library/Application Support/com.dizyx.nockerlvoice",
    "~/Library/Logs/NockerlVoice",
    "~/Library/Preferences/com.dizyx.nockerlvoice.plist",
  ]
end
