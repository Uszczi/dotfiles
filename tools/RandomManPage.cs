using System.Text.RegularExpressions;

using System;
using System.Diagnostics;
using System.IO;
using System.Linq;

class RandomManPage {
  static void Main() {

    string manPagePath = "/usr/share/man/";
    Regex manSectionRegex = new Regex(@"/man/man[124-8]/", RegexOptions.Compiled);

    if (!Directory.Exists(manPagePath)) {
      Console.WriteLine($"Man folder doesn't exist, Checked {manPagePath}");
      return;
    }

    Console.WriteLine("Searching for a random man page.");

    var allManFiles =
        Directory.GetFiles(manPagePath, "*", SearchOption.AllDirectories);
    var manFiles =
        allManFiles.Where(file => manSectionRegex.IsMatch(file)).ToList();

    Random random = new Random();
    string randomManPath = manFiles[random.Next(manFiles.Count)];

    Console.WriteLine($"Selected {randomManPath}");

    ProcessStartInfo startInfo = new ProcessStartInfo {
      FileName = "man", Arguments = randomManPath, UseShellExecute = false,
      RedirectStandardOutput = false, RedirectStandardError = false
    };

    using (Process? process = Process.Start(startInfo)) {
      if (process != null) {
        process.WaitForExit();
      }
    }

    Console.WriteLine("Ended.");
  }
}
