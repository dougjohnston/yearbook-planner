describe("YB.Model.Spread", function() {
  it("should be defined", function() {
    expect(YB.Models.Spread).toBeDefined();
  });

  describe("Attributes", function() {
    var spread = new YB.Models.Spread();

    it("should have default attributes", function() {
      expect(spread.url).toEqual("/spreads");
    });
  });
});

describe("YB.Collections.Spreads", function() {
  it("should be defined", function() {
    expect(YB.Collections.Spreads).toBeDefined();
  });

  describe("Attributes", function() {
    var spreads = new YB.Collections.Spreads();

    it("should have default attributes", function() {
      expect(spreads.model).toEqual(YB.Models.Spread);
    });
  });
});
