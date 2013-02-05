describe("YB.Model.Page", function() {
  it("should be defined", function() {
    expect(YB.Models.Page).toBeDefined();
  });

  describe("Attributes", function() {
    var page = new YB.Models.Page();

    it("should have default attributes", function() {
      expect(page.url).toEqual("/pages");
    });
  });
});

describe("YB.Collections.Pages", function() {
  it("should be defined", function() {
    expect(YB.Collections.Pages).toBeDefined();
  });

  describe("Attributes", function() {
    var pages = new YB.Collections.Pages();

    it("should have default attributes", function() {
      expect(pages.model).toEqual(YB.Models.Page);
    });
  });
});
