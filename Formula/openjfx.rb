class Openjfx < Formula
  desc "Java development kit for creating rich client applications"
  homepage "https://openjfx.io/"
  version "22.0.1"
  url "https://download2.gluonhq.com/openjfx/22.0.1/openjfx-22.0.1_osx-x64_bin-sdk.zip"
  sha256 "87fcd7e519e537375f1a4821538a7b55be6f64e94ba9b305cd73d0f9d4e7db95"
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
