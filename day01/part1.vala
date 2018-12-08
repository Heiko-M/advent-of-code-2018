/*
 * Adds up the frequency changes logged in input.txt.
 * Compile with `valac --pkg gio-2.0 part1.vala`
 * Run with `part1 input.txt`
*/

int main (string[] args) {
    int frequency = 0;

    try {
        var file = File.new_for_path (args[1]);
        if (file.query_exists ()) {
            string line;
            var stream = new DataInputStream (file.read ());
            while ((line = stream.read_line (null)) != null) {
                frequency += int.parse(line);
            }
        }
    } catch (Error e) {
        warning ("Failed to load file: %s\n", e.message);
    }

    print ("The resulting frequency is %d\n", frequency);

    return 0;
}
