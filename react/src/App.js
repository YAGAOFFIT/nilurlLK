import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Index from './components/Index';
import Settings from './components/Settings';

function App() {
  return (
    <div className="App">
      <Router>
        <header className="App-header">
          {/* ... Ваш заголовок ... */}
        </header>
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="/settings" element={<Settings />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
