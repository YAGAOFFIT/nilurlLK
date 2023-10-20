import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Index from './components/Index';
import Settings from './components/Settings';
import Cabinet from './components/Cabinet'

function App() {
  return (
    <div className="App">
      <Router>
        <header className="App-header">
        </header>
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="/settings" element={<Settings />} />
          <Route path="/cabinet" element={<Cabinet />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
