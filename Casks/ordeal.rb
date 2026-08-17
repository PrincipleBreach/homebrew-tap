cask "ordeal" do
  version "0.1.0"

  on_arm do
    sha256 "bb468b255c40deb92da06fce05fd59eaa886259fc450d7bed662d7e7878ff111"
    url "https://github.com/PrincipleBreach/ordeal/releases/download/v#{version}/ordeal_#{version}_darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "875584ce4b43485151ab9f585fc69abaa692e8cf13e96e424db91c61e5758de0"
    url "https://github.com/PrincipleBreach/ordeal/releases/download/v#{version}/ordeal_#{version}_darwin_amd64.tar.gz"
  end

  name "Ordeal"
  desc "Adversarial test harness for Sigma detection rules"
  homepage "https://principlebreach.com"

  binary "ordeal"

  # The release binary is not yet Apple-notarized; clear the quarantine flag on
  # install so the CLI runs. Notarization is planned.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/ordeal"],
                   must_succeed: false
  end
end
