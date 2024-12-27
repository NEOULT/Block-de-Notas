import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import Login from './components/Login';
import App from './App';

const isAuthenticated = () => localStorage.getItem('authToken') !== null;

const AppRouter = () => {
  const [authenticated, setAuthenticated] = useState(isAuthenticated());

  useEffect(() => {
    const handleStorageChange = () => setAuthenticated(isAuthenticated());

    window.addEventListener('storage', handleStorageChange);
    
    return () => {
      window.removeEventListener('storage', handleStorageChange);
    };
  }, []);

  useEffect(() => {
    setAuthenticated(isAuthenticated());
  }, []);

  return (
    
    <Router>
      <Routes>
        <Route path="/login" element={<Login setAuthenticated={setAuthenticated} />} />
        <Route path="/" element={authenticated ? <App /> : <Navigate to="/login" replace />} />
      </Routes>
    </Router>
  );
};

export default AppRouter;
