// "socket.io-client": "^4.4.0"


import React, { useEffect, useState } from 'react';
import io from 'socket.io-client';

// const socket = io('http://localhost:9013', {
//     transports: ['websocket'],
// });

const socket = io('http://127.0.0.1:2233', {
        transports: ['websocket'],
});

const App = () => {
    const [messages, setMessages] = useState([]);
    const [input, setInput] = useState('');
    const sleep = (t) => new Promise((resolve) => setTimeout(resolve, t));
  

    useEffect(() => {
      // const socket = io("ws://127.0.0.1:2233", { transports: ['websocket'] });

      socket.on('message', (msg) => {
        console.log('on msg:', msg);
      });

      socket.on('connect', async () => {
          console.log('connected! id:', socket.id);

      });

      socket.on('disconnect', (e) => {
        console.log('disconnect', e);
      });

      socket.on('connect_error', (e) => {
        console.log('connect_error', e);
      });

      return () => {
          socket.disconnect();
      };
  }, []);



    const sendMessage = () => {

        const message = { content: input, timestamp: new Date() };
        console.log("this is message "+message+"\n")

        // socket.send(message)
        // socket.emit('message', message);
        // socket.emit('notice', message);
        socket.emit('/message', input);

        setInput('');
    };

    return (
        <div>
            <h1>React and WebSocket</h1>
            <div>
                <input
                    type="text"
                    value={input}
                    onChange={(e) => setInput(e.target.value)}
                />
                <button onClick={sendMessage}>Send</button>
            </div>
            <div>
                {messages.map((msg, index) => (
                    <div key={index}>
                        {msg.timestamp}: {msg.content}
                    </div>
                ))}
            </div>
        </div>
    );
};

export default App;




// import { useEffect, useRef } from "react";
// import "./App.css";

// import { io } from "socket.io-client";

// function App() {
//   const socket = useRef();

//   useEffect(() => {
//   //   socket.current = io("ws://localhost:9013",{ methods: ["GET", "POST"],
//   //     transports: ['websocket', 'polling'],
//   //     credentials: true
//   // });


//   socket.current = io("ws://localhost:9013/ws", {
//     transports: ['websocket'],
//     withCredentials: true,
//     agent: true,
//     rememberUpgrade: true
//     });

//     socket.current.on("connnection", () => {
//       console.log("connected to server");
//     });

//     socket.current.on('connect', () => {
//       console.log('Connected to server');
//       console.log('Connection URL:', socket.current.io.uri);
//     });

//     socket.current.on('disconnect', () => {
//       console.log('Disconnected from server');
//     });



//     return () => {
//       socket.current.off('connect');
//       socket.current.off('disconnect');
//       socket.current.off('message');
//   };

//     }, []);
//             // Log connection and disconnection


//   const handleClick = () => {
//     socket.current.emit("message", new Date().getTime());
//   };

//   return (
//     <div className="App">
//       <p>Socket.io app</p>

//       <button type="button" onClick={handleClick}>
//         Emit a time message
//       </button>
//     </div>
//   );
// }

// export default App;
