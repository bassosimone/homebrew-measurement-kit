class AndroidLibmaxminddb < Formula
  desc "C library for the MaxMind DB file format"
  homepage "https://github.com/maxmind/libmaxminddb"
  url "https://github.com/maxmind/libmaxminddb/releases/download/1.4.2/libmaxminddb-1.4.2.tar.gz"
  sha256 "dd582aa971be23dee960ec33c67fb5fd38affba508e6f00ea75959dbd5aad156"
  revision 1

  bottle do
    root_url "https://dl.bintray.com/measurement-kit/homebrew"
    cellar :any_skip_relocation
    sha256 "cb86bdde496af04e244caabc268fa7f689a0386729ef32a8b4747a910b0d7fe5" => :catalina
  end

  depends_on "cross" => :build

  keg_only "this is an Android build that we should not install system wide"

  def install
    ENV['ANDROID_NDK_ROOT'] = '/usr/local/share/android-sdk/ndk-bundle'
    [ "x86", "x86_64", "armeabi-v7a", "arm64-v8a" ].each do |arch|
      mkdir "build-#{arch}" do
        system "cross-android", "#{arch}", "../configure", "--disable-debug",
                            "--disable-dependency-tracking",
                            "--disable-shared",
                            "--disable-tests",
                            "--prefix=#{prefix}/#{arch}"
        system "make", "install"
      end
    end
  end
end
