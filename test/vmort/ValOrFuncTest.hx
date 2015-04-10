package test.vmort;

import utest.Assert;
import vmort.ValOrFunc;

class ValOrFuncTest {
  public function new() {}

  public function testVal() {
    var test = ValOrFunc.fromValue("test");
    Assert.same("test", test.getValue());
  }

  public function testFunc() {
    var test = ValOrFunc.fromFunc(function() {
      return "test";
    });
    Assert.same("test", test.getValue());
  }
}
