/*
 * Searches for the first frequency that is reached for the second time when
 * iteration through the list repeatedly.
 * Compile with `valac --pkg gio-2.0 --pkg gee-0.8 part2.vala`
 * Run with `part2 input.txt`
*/

int main (string[] args) {
    var frequencies = new Gee.ArrayList<int> ();
    int frequency = 0;

    while (true) {
        try {
            var file = File.new_for_path (args[1]);
            if (file.query_exists ()) {
                string line;
                var stream = new DataInputStream (file.read ());
                while ((line = stream.read_line (null)) != null) {
                    frequencies.add (frequency);
                    frequency += int.parse(line);
                    if (frequencies.contains (frequency)) {
                        print ("First frequency reached twice is %d\n", frequency);
                        return 0;
                    }
                }
            }
        } catch (Error e) {
            warning ("Failed to load file: %s\n", e.message);
        }
    }
}
