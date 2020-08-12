const express = require('express');
const app = express();

// Settings
app.set('port', process.env.PORT || 3000);

// Middlewares
app.use(express.json());
//
///
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
  res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
  next();
});
// Routes
app.use(require('./routes/dispositivos.js'));


// Starting the server
const server = app.listen(app.get('port'), () => {
  console.log(`Server on port ${app.get('port')}`);
});


//web socket
const socketio = require('socket.io');
const io = socketio(server);
io.on('connection', (socket) => {
  console.log('new conection', socket.id);
  io.sockets.emit('welcome', 'hola');

  /*
      socket.on('chat:message', (data) => {
          console.log(data);
          io.sockets.emit('chat:message', data);
      });
  */
  socket.on('transmicion:Ubicacion', (datos) => {
    console.log(datos);
    socket.broadcast.emit('Ubicacion:' + datos.Id, datos);
    socket.broadcast.emit('Ubicacion', datos);
    if (datos.guardar) {
      GuardarPunto(datos);
    }

  });


});
const mysqlConnection2 = require('./database.js');
function GuardarPunto(data) {
  const query = `INSERT INTO posiciones(
    Id_Dis, 
    Latitud, 
    Longitud, 
    Fecha) 
    VALUES(?,?, ?,NOW());
`;



  mysqlConnection2.query(query, [data.Id, data.Lat, data.lon], (err, rows, fields) => {
    if (!err) {
      console.log('punto guardado');
    } else {
      console.log(err);
    }
  });
}

