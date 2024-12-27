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
        <Route path="https://matrixnotes.netlify.app/login" element={<Login setAuthenticated={setAuthenticated} />} />
        <Route path="https://matrixnotes.netlify.app/" element={authenticated ? <App /> : <Navigate to="https://matrixnotes.netlify.app/login" replace />} />
      </Routes>
    </Router>
  );
};

export default AppRouter;
