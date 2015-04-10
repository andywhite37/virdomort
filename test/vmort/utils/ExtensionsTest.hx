package test.vmort.utils;

import utest.Assert;
using vmort.utils.Extensions;

class ExtensionsTest {
  public function new() {
  }

  public function testEquals() {
    Assert.isTrue(1.equals(1));
    Assert.isTrue("test".equals("test"));
    Assert.isFalse(1.equals(2));
    Assert.isFalse("test".equals("hi"));
  }

  public function testContains() {
    Assert.isTrue([1, 2, 3].contains(1));
    Assert.isTrue([2, 3, 1].contains(2));
    Assert.isTrue(["one", "three", "two"].contains("three"));

    Assert.isFalse([].contains(1));
    Assert.isFalse([].contains(null));
    Assert.isFalse([1, 2, 3].contains(4));
    Assert.isFalse(["one", "three", "two"].contains("four"));
    Assert.isFalse(["one", "three", "two"].contains("twox"));

    Assert.isTrue([{ key: "one" }, { key: "two" }].contains({ key: "two" }, function(a, b) {
      return a.key == b.key;
    }));

    Assert.isFalse([{ key: "one" }, { key: "two" }].contains({ key: "three" }, function(a, b) {
      return a.key == b.key;
    }));
  }

  public function testUnique() {
    Assert.same([1, 2, 3], [1, 1, 2, 3, 3, 3].unique());
    Assert.same([2, 3, 1], [2, 2, 2, 3, 3, 1, 1].unique());
    Assert.same(["one", "two", "three"], ["one", "one", "two", "two", "three"].unique());
    Assert.same(["two", "three", "one"], ["two", "two", "three", "one", "one"].unique());

    Assert.same([{ key: "one" }, { key: "two" }], [{ key: "one" }, { key: "one" }, { key: "two" }, { key: "two" }].unique(function(a, b) {
      return a.key == b.key;
    }));
  }

  public function testIntersection() {
    Assert.same([2, 3], [1, 2, 3].intersection([2, 3, 4]));
    Assert.same([1, 2, 3, 4], [1, 2, 3, 4, 5, 6].intersection([4, 3, 2, 1]));
  }

  public function testDifference() {
    Assert.same([1, 4], [1, 2, 3, 4].difference([2, 3]));
    Assert.same([4, 1], [4, 3, 2, 1].difference([2, 3]));
  }

  public function testDiff() {
    Assert.same({ left: [1, 2], both: [3, 4], right: [5, 6] }, [1, 2, 3, 4].diff([3, 4, 5, 6]));
    Assert.same({ left: ["one", "two"], both: ["three", "four"], right: ["five", "six"] },
        ["one", "two", "three", "four"].diff(["three", "four", "five", "six"]));

    var left = [
      { key: "one" },
      { key: "two" },
      { key: "three" },
      { key: "four" }
    ];

    var right = [
      { key: "three" },
      { key: "four" },
      { key: "five" },
      { key: "six" }
    ];

    var expected = {
      left: [
        { key: "one" },
        { key: "two" }
      ],
      both: [
        { key: "three" },
        { key: "four" }
      ],
      right: [
        { key: "five" },
        { key: "six" }
      ]
    };

    var predicate = function(a, b) {
      return a.key == b.key;
    };

    Assert.same(expected, left.diff(right, predicate));
  }

}
