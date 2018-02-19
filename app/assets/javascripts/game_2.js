function start() {
  map.render();
  map.canvas.addEventListener('click', function(event) {
    alert(event.pageX + "-" + event.pageY);
  });
  map.canvas.addEventListener('mousemove', function(event) {
    getPosition(event);
  });
}

function getPosition(e) {
  offsetLeft = map.board.offsetLeft;
  offsetTop = map.board.offsetTop;
  var pageX = e.pageX - offsetLeft;
  var pageY = e.pageY - offsetTop;
  for (i = 0; i < cities.length; i++) {
    var city = cities[i]
      if (Math.sqrt((pageX - city.x)*(pageX - city.x) + (pageY - city.y)*(pageY - city.y)) < 20) {
        onHoverId = city.id;
        map.update();
        return true;
      }
  }
  onHoverId = null;
  map.update();
}

var onHoverId = null;

var cities = [
{x:316, y:110, name:"Jesper 1", id: 1, connections: [{id: 2, price: 15}, {id: 3, price: 20}]},
{x:460, y:20, name:"Jesper 2", id: 2, connections: [{id: 1, price: 10}]},
{x:30, y:40, name:"Jesper 3", id: 3, connections: [{id: 2, price: 10}, {id: 4, price: 30}]},
{x:100, y:256, name:"Jesper 4", id: 4, connections: [{id: 3, price: 20} ,{id: 1, price:20}]}
]

var map = {
  canvas: document.createElement("canvas"),
  render: function() {
    this.canvas.width = 480;
    this.canvas.height = 480;
    this.context = this.canvas.getContext("2d");
    document.getElementById("board").appendChild(this.canvas);
    this.context.fillStyle = "black";
    this.centerX = this.canvas.width / 2;
    this.centerY = this.canvas.height / 2;
    this.board = document.getElementById("board"); 
    this.update();
  },
  update: function() {
    this.clear();
    var city = null;
    var connected_city = null;
    var parent_city = null;
    for (i = 0; i < cities.length; i++) { 
      city = cities[i];
      this.context.beginPath();
      this.context.arc(city.x, city.y, 20, 2 * Math.PI, false);
      this.context.fillStyle = '#226765';
      if (onHoverId == city.id) { this.context.fillStyle = '#41817F'; }
      this.context.fill();
      for (y = 0; y < cities[i].connections.length; y++) {
        connected_city = cities[i].connections[y];
        this.context.beginPath();
        parent_city = cities.filter(function(c) {return c.id == connected_city.id})[0];
        this.context.strokeStyle = "#226765";
        this.context.moveTo(parent_city.x, parent_city.y);
        this.context.lineTo(city.x, city.y);
        this.context.lineWidth = 5;
        this.context.stroke();
        if (connected_city.price) {
          this.context.beginPath();
          this.context.arc(Math.abs(city.x + parent_city.x) / 2,
              Math.abs(city.y + parent_city.y) / 2,
              10, 2 * Math.PI, false);
          this.context.fillStyle = '#226765';
          this.context.fill();
        }
      }
    }
  },
  clear: function() {
    this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
  }
}

document.addEventListener('DOMContentLoaded', start(), false);
