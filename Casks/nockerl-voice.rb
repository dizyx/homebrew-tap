cask "nockerl-voice" do
  version "1.0.13"
  sha256 "37d113107f4cebffbfc706cd2a8b589c235dd83d9d59b69b8739fee166622487"

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
  depends_on macos: :sonoma

  app "Nockerl Voice.app"

  # Verified against the running app, not guessed. The support directory is named
  # "NockerlVoice", NOT the bundle id: AppPaths.directoryNamespace returns the bundle id
  # only for non-production builds. The first version of this cask listed
  # com.dizyx.nockerlvoice, a path that does not exist on a production install, so zap
  # would have left every kept recording behind while reporting success.
  #
  # The transcription history is deliberately NOT listed. It lives at SwiftData's default
  # location, ~/Library/Application Support/default.store, which is shared rather than
  # namespaced to this app, so any other non-sandboxed SwiftData app can own that same
  # file. Deleting another application's database during an uninstall would be far worse
  # than leaving a file behind. The README says where it is and lets the user decide.
  zap trash: [
    "~/Library/Application Support/NockerlVoice",
    "~/Library/Logs/NockerlVoice",
    "~/Library/Preferences/com.dizyx.nockerlvoice.plist",
  ]
end
