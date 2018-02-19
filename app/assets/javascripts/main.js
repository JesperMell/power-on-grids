var map = new Map()
map.render();
map.draw();

map.canvas.addEventListener('click', function(e) {
  var city_id = map.mouseOverCity(e.pageX, e.pageY);
  if (city_id) {
    App.room.action(city_id);
  }
});
