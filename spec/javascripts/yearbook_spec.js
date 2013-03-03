describe("YB.Model.Yearbook", function() {
  it("should be defined", function() {
    expect(YB.Models.Yearbook).toBeDefined();
  });

  describe("Attributes", function() {
    var yearbook = new YB.Models.Yearbook();

    it("should have default attributes", function() {
      expect(yearbook.url).toEqual("/yearbooks");
    });
  });
});

describe("YB.Collections.Yearbooks", function() {
  it("should be defined", function() {
    expect(YB.Collections.Yearbooks).toBeDefined();
  });

  describe("Attributes", function() {
    var yearbooks = new YB.Collections.Yearbooks();

    it("should have default attributes", function() {
      expect(yearbooks.model).toEqual(YB.Models.Yearbook);
    });
  });
});
