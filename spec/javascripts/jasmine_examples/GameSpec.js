#=require jquery
#=require game

describe("Game", function() {
  var map;
  
  beforeEach(function() {
    map = new Map();
  });

  it("offers three crucial functions", function() {
    expect(readFixtures).toBeDefined();
    expect(setFixtures).toBeDefined();
    expect(loadFixtures).toBeDefined();
  });

  it("render map canvas properly", function() {
    loadFixtures('map/form.html');
    expect(map.canvas).toEqual(document.createElement("canvas"));
    map.render();
 });
});
