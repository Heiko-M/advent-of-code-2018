package adventofcode;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class Util {
    public static ArrayList<String> readLogFile(String filePath) throws Exception{
        ArrayList<String> logs = new ArrayList<>();

        FileInputStream fs = new FileInputStream(filePath);
        BufferedReader br = new BufferedReader(new InputStreamReader(fs));

        String line;

        while ((line = br.readLine()) != null) {
            String[] lineSplit = line.split("]");
            logs.add(lineSplit[0].replaceAll("[^\\d]", "") + "=" + lineSplit[1].trim());
        }

        br.close();

        return logs;
    }
}
