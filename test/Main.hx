package test;

import utest.Runner;
import utest.ui.Report;

class Main {

  static function addTests(runner : Runner) {
    runner.addCase(new test.vmort.utils.ExtensionsTest());
    runner.addCase(new test.vmort.ValOrFuncTest());
  }

  public static function main() {
    var runner = new Runner();
    addTests(runner);
    Report.create(runner);
    runner.run();
  }
}
