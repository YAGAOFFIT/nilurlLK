import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Settings from './components/Settings';
import Cabinet from './components/Cabinet';
import Login from './components/Login';
import Regest from './components/Regest';
import Download from './components/Download';

function App() {
  return (
    <div className="App">
      <Router>
        <header className="App-header">
        </header>
        <Routes>
          <Route path="/settings" element={<Settings />} />
          <Route path="/cabinet" element={<Cabinet />} />
          <Route path="/login" element={<Login />} />   
          <Route path="/regest" element={<Regest />} />               
          <Route path="/download" element={<Download />} />        
        </Routes>
      </Router>
    </div>
  );
}

export default App;
