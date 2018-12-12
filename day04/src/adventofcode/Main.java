package adventofcode;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

public class Main {

    public static void main(String[] args) throws Exception {
        ArrayList<String> logs = new ArrayList<>();

        FileInputStream fs = new FileInputStream(args[0]);
        BufferedReader br = new BufferedReader(new InputStreamReader(fs));

        String line;

        while ((line = br.readLine()) != null) {
            String[] lineSplit = line.split("]");
            logs.add(lineSplit[0].replaceAll("[^\\d]", "") + "=" + lineSplit[1].trim());
        }

        br.close();

        Collections.sort(logs);

        HashMap<Integer, int[]> guards = new HashMap<>();

        Integer guardId = -1;
        int fallAsleepMinute = -1;
        for (String log : logs) {
            String[] logSplit = log.split("=");
            String timestamp = logSplit[0];
            String event = logSplit[1];

            if (event.startsWith("Guard #")) {
                guardId = Integer.valueOf(event.split("#")[1].split(" ", 2)[0]);
                if (! guards.containsKey(guardId)) {
                    guards.put(guardId, new int[60]);
                }
            } else {
                int minute = Integer.valueOf(timestamp.substring(timestamp.length() - 2));
                if (event.equals("falls asleep")) {
                    fallAsleepMinute = minute;
                } else if (event.equals("wakes up")) {
                    int[] guardSleepSchedule = guards.get(guardId);
                    for (int i = fallAsleepMinute; i < minute; i++) {
                        guardSleepSchedule[i]++;
                    }
                }
            }
        }

        int maxSleep = 0;
        Integer sleepiestGuard = -1;
        for (Object gId : guards.keySet().toArray()) {
            int guardSleepMins = minutesSlept(guards.get(gId));

            if (guardSleepMins > maxSleep) {
                sleepiestGuard = (Integer) gId;
                maxSleep = guardSleepMins;
            }
        }

        int sleepiestMinute = sleepiestMinute(guards.get(sleepiestGuard));
        System.out.println(String.format("The sleep peak minute of the sleepiest guard (#%d) was 00:%02d. The puzzle's answer is therefore: %d", sleepiestGuard, sleepiestMinute, sleepiestGuard * sleepiestMinute));
    }

    public static int minutesSlept(int[] sleepSchedule) {
        int sum = 0;

        for (int m : sleepSchedule) {
            sum += m;
        }

        return sum;
    }

    public static int sleepiestMinute(int[] sleepSchedule) {
        int sleepiestMinute = 0;
        int sleepPeak = 0;

        for (int i = 0; i < sleepSchedule.length; i++) {
            if (sleepSchedule[i] > sleepPeak) {
                sleepiestMinute = i;
                sleepPeak = sleepSchedule[i];
            }
        }
        return sleepiestMinute;
    }
}
