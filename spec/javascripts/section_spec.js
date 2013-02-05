describe("YB.Model.Section", function() {
  it("should be defined", function() {
    expect(YB.Models.Section).toBeDefined();
  });

  describe("Attributes", function() {
    var spread = new YB.Models.Section();

    it("should have default attributes", function() {
      expect(spread.url).toEqual("/sections");
    });
  });
});

describe("YB.Collections.sections", function() {
  it("should be defined", function() {
    expect(YB.Collections.Sections).toBeDefined();
  });

  describe("Attributes", function() {
    var sections = new YB.Collections.Sections();

    it("should have default attributes", function() {
      expect(sections.model).toEqual(YB.Models.Section);
    });
  });
});
