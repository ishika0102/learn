// Import the socket.io-client library version 1.4
const io = require('socket.io-client');

// Connect to the Socket.IO server
const socket = io.connect('http://10.10.2.211:8080'); // Replace with your server's URL

// Listen for the 'connect' event
socket.on('connect', function () {
  console.log('Connected to the server');
});

// Listen for a custom event from the server
// socket.on('message', function (data) {
//         console.log('Message from server:', data.message);
//     });
socket.emit('myEvent', { data: 'Hello, server!' });
console.log('Message sent to server');
    
socket.on('message', function (data) {
        console.log('Message from server:', data.message);
});
    

// Listen for the 'disconnect' event
socket.on('disconnect', function () {
  console.log('Disconnected from the server');
});

// Emit a custom event to the server
socket.send('myEvent', { data: 'Hello, server!' });

// Log a message when attempting to send a message to the server
console.log('Sending message to server...');
