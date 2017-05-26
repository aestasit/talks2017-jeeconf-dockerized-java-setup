public class GracefulServer {

  static boolean running = true;

  public static void main(String[] args) throws Exception {

    Runtime.getRuntime().addShutdownHook(new Thread() {
      public void run() {
        running = false;
        try {
          Thread.sleep(2000);
        } catch (Exception e) {
        }
      }
    });

    System.out.println("Started");

    while (running) {
      Thread.sleep(1000);
    }

    System.out.println("Exited nicely");

  }
}
