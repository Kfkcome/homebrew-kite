# Cask template: scripts/release.sh fills 0.1.3 and 468f5edc4de94cf00053175949202fe250e0ca74bb12967c2660adb40ced1c79 and writes the result to
# target/release/bundle/kite.rb. Copy that into a tap (Kfkcome/homebrew-kite, Casks/kite.rb);
# then `brew install --cask Kfkcome/kite/kite`.
cask "kite" do
  version "0.1.3"
  sha256 "468f5edc4de94cf00053175949202fe250e0ca74bb12967c2660adb40ced1c79"

  url "https://github.com/Kfkcome/kite/releases/download/v#{version}/kite-#{version}-macos-arm64.zip"
  name "Kite"
  desc "Fast, low-memory SSH terminal"
  homepage "https://github.com/Kfkcome/kite"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Kite.app"

  zap trash: [
    "~/Library/Application Support/kite",
    "~/Library/Logs/kite",
  ]
end
