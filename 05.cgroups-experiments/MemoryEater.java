
import java.util.UUID;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class MemoryEater {

   static final List<String> data = new ArrayList<String>();

   public static void main(String[] args) {
     int u = 0;
     while (true) {
       for (int i = 0; i < 1000; i++) {
         data.add(String.join("", Collections.nCopies(1000, UUID.randomUUID().toString())));
       }
       System.out.println("Added " + (++u) + "000 very long strings");
     }
   }

}