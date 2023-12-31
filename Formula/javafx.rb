class Javafx < Formula
  desc "Java development kit for creating rich client applications"
  homepage "https://openjfx.io/"
  version "21.0.1"
  url "https://download2.gluonhq.com/openjfx/21.0.1/openjfx-21.0.1_osx-x64_bin-sdk.zip"
  sha256 "87669aadfc0e1c729b66eeb5b7af6e99bb1a3c5a80b520cf9193910c08e04a7f"
  license "GPL-2.0-or-later"

  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    (testpath/"HelloFX.java").write <<~EOS
      import javafx.application.Application;
      import javafx.scene.Scene;
      import javafx.scene.control.Label;
      import javafx.scene.layout.StackPane;
      import javafx.stage.Stage;

      public class HelloFX extends Application {
        @Override
        public void start(Stage stage) {
          Label label = new Label("Hello, JavaFX!");
          Scene scene = new Scene(new StackPane(label), 640, 480);
          stage.setScene(scene);
          stage.show();
        }
        public static void main(String[] args) {
          launch();
        }
      }
    EOS

    java_options = ENV.delete("_JAVA_OPTIONS")
    system "javac",
           "-J#{java_options}",
           "--module-path", lib,
           "--add-modules", "javafx.controls",
           "HelloFX.java"
  end
end
