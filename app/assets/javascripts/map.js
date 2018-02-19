function Map() {
  this.canvas = document.createElement("canvas");
  this.ctx = null;
  this.onHoverId = null;
}

Map.prototype.render = function() {
  this.canvas.width = 800;
  this.ctx = this.canvas.getContext("2d");
  this.canvas.height = 800;
  document.getElementById("board").appendChild(this.canvas);
  this.ctx.fillStyle = "black";
  this.centerX = this.canvas.width / 2;
  this.centerY = this.canvas.height / 2;
  this.board = document.getElementById("board");
}

Map.prototype.draw = function() {
  this.drawZones();
  this.drawCities();
  return "good"
}

Map.prototype.drawZones = function(zones = this.demo.zones) {
  for(i = 0; i < zones.length; i++) {
    zone = zones[i];
    this.ctx.beginPath();
    this.ctx.moveTo(...zone.paths[0])
      for(y=0; y < zone.paths.length; y++) {
        path = zone.paths[y];
        this.ctx.lineTo(...path)
      }
    this.ctx.fillStyle = zone.color;
    this.ctx.fill();
  }
}

Map.prototype.drawCities = function(cities = this.demo.cities) {
  var city = null;
  var connected_city = null;
  var parent_city = null;
  for (i = 0; i < cities.length; i++) {
    city = cities[i];
    this.ctx.beginPath();
    this.ctx.arc(city.x, city.y, 20, 2 * Math.PI, false);
    this.ctx.fillStyle = '#226765';
    if (this.onHoverId == city.id) { this.ctx.fillStyle = '#41817F'; }
    this.ctx.fill();
    this.ctx.fillStyle = '#000000';
    this.ctx.font = "18px Arial"
    this.ctx.fillText(city.name, (city.x - 20), (city.y - 24))
    for (y = 0; y < cities[i].connections.length; y++) {
      connected_city = cities[i].connections[y];
      this.ctx.beginPath();
      parent_city = cities.filter(function(c) {return c.id == connected_city.id})[0];
      this.ctx.strokeStyle = "#226765";
      this.ctx.moveTo(parent_city.x, parent_city.y);
      this.ctx.lineTo(city.x, city.y);
      this.ctx.lineWidth = 4;
      this.ctx.stroke();
      if (connected_city.price) {
        this.ctx.beginPath();
        this.ctx.arc(Math.abs(city.x + parent_city.x) / 2,
            Math.abs(city.y + parent_city.y) / 2,
            10, 2 * Math.PI, false);
        this.ctx.fillStyle = '#226765';
        this.ctx.fill();
      }
    }
  }
}

Map.prototype.mouseOverCity = function(x, y) {
  var pageX = x - this.canvas.offsetLeft;
  var pageY = y - this.canvas.offsetTop;
  for (i = 0; i < this.demo.cities.length; i++) {
    var city = map.demo.cities[i];
    if (Math.sqrt((pageX - city.x)*(pageX - city.x) + (pageY - city.y)*(pageY - city.y)) < 20) {
      return city.id;
    }
  }
  onHoverId = null;
  map.update();
}

Map.prototype.status = function() {
  return "good"
}

Map.prototype.demo = {
  zones: [{
    paths: [[10, 10], [320, 20], [320, 300], [30, 210]],
    color: "#aabbee"
  },
  {
    paths: [[320, 20], [520, 50], [550, 320], [320, 300]],
    color: "#eebbaa"
  },
  {
    paths: [[30, 210], [320, 300], [550, 320], [550, 440], [250, 490], [10, 470]],
    color: "#aaeebb"
  }],
  cities: [
    {x:60, y:55, name:"Snowdin", id: 1, connections: [{id: 2, price: 15}, {id: 4, price: 20}]},
    {x:70, y:170, name:"Ruins", id: 2, connections: [{id: 3, price: 10},{id: 9, price: 10}]},
    {x:240, y:220, name:"Waterfall", id: 3, connections: [{id: 10, price: 10},{id: 7, price: 10},{id: 2, price: 10}, {id: 4, price: 30}]},
  {x:170, y:60, name:"Hotland", id: 4, connections: [{id: 6, price: 10},{id: 3, price: 20}, {id: 2, price: 20}]},
    {x:450, y:80, name:"Amnesty Bay", id: 5, connections: [{id: 6, price: 10},{id: 8, price: 10}]},
    {x:350, y:100, name:"Blue Valley", id: 6, connections: []},
    {x:370, y:230, name:"Gotham City", id: 7, connections: [{id: 11, price: 10},{id: 8, price: 10}]},
    {x:450, y:260, name:"Cosmos", id: 8, connections: [{id: 6, price: 10}]},
    {x:70, y:300, name:"Hyrule", id: 9, connections: [{id: 10, price: 10}]},
    {x:150, y:400, name:"Wayaway", id: 10, connections: [{id: 11, price: 10},{id: 12, price: 10}]},
    {x:350, y:360, name:"Termina", id: 11, connections: [{id: 8, price: 10}]},
    {x:400, y:420, name:"Rupeeland", id: 12, connections: [{id: 11, price: 10},{id: 10, price: 10}]}
  ]
}

