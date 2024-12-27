import { useState } from "react";
import { useNavigate } from "react-router-dom";
import PropTypes from 'prop-types';

const API_URL = import.meta.env.VITE_API_URL;

const Login = ({ setAuthenticated }) => {
  const [isLogin, setIsLogin] = useState(true);
  const [formData, setFormData] = useState({
    username: "",
    password: "",
    name: "",
  });

  const [errorMessage, setErrorMessage] = useState("");
  const [successMessage, setSuccessMessage] = useState("");

  const navigate = useNavigate();

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const validateForm = () => {
    if (!isLogin) {
      if (formData.username.length < 6) {
        setErrorMessage("Username must be at least 6 characters long.");
        return false;
      }

      const passwordRegex = /^(?=.*[A-Z])(?=.*\d).{7,}$/;
      if (!passwordRegex.test(formData.password)) {
        setErrorMessage(
          "Password must be at least 7 characters long, contain at least one uppercase letter, and one number."
        );
        return false;
      }
    }

    return true;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validateForm()) {
      return;
    }

    const endpoint = isLogin
      ? `${API_URL}/login`
      : `${API_URL}/register`;

    try {
      const response = await fetch(endpoint, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(
          isLogin
            ? {
                username: formData.username,
                password: formData.password,
              }
            : {
                name: formData.name,
                username: formData.username,
                password: formData.password,
              }
        ),
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(result.message || "Something went wrong");
      }

      localStorage.setItem("authToken", result.token);

      setAuthenticated(true); // Actualizar el estado de autenticación
      navigate("/"); // Redirigir después de almacenar el token

      setSuccessMessage(isLogin ? "Login successful!" : "Registration successful!");
      setErrorMessage("");
    } catch (error) {
      setErrorMessage("No es posible en este momento, intente más tarde.");
      setSuccessMessage("");
    }
  };

  return (
    <div className="form-container">
      <div className="login-register-form">
        {isLogin ? (
          <div className="login-form">
            <h2 className="title">Welcome Back</h2>
            <form onSubmit={handleSubmit}>
              <div className="form-group">
                <input
                  type="text"
                  name="username"
                  className="form-control"
                  placeholder="Username"
                  value={formData.username}
                  onChange={handleInputChange}
                  required
                />
              </div>
              <div className="form-group">
                <input
                  type="password"
                  name="password"
                  className="form-control"
                  placeholder="Password"
                  value={formData.password}
                  onChange={handleInputChange}
                  required
                />
              </div>
              <button type="submit" className="submit-btn">
                Login
              </button>
              {errorMessage && <p className="error-message">{errorMessage}</p>}
              {successMessage && <p className="success-message">{successMessage}</p>}
              <a href="#" className="forgot-password">
                Forgot your password?
              </a>
              <p
                className="switch-form"
                onClick={() => {
                  setIsLogin(false);
                  setErrorMessage("");
                  setSuccessMessage("");
                }}
              >
                Don&apos;t have an account? Register
              </p>
            </form>
          </div>
        ) : (
          <div className="register-form">
            <h2 className="title">Create an Account</h2>
            <form onSubmit={handleSubmit}>
              <div className="form-group">
                <input
                  type="text"
                  name="name"
                  className="form-control"
                  placeholder="Full Name"
                  value={formData.name}
                  onChange={handleInputChange}
                  required
                />
              </div>
              <div className="form-group">
                <input
                  type="text"
                  name="username"
                  className="form-control"
                  placeholder="Username"
                  value={formData.username}
                  onChange={handleInputChange}
                  required
                />
              </div>
              <div className="form-group">
                <input
                  type="password"
                  name="password"
                  className="form-control"
                  placeholder="Password"
                  value={formData.password}
                  onChange={handleInputChange}
                  required
                />
              </div>
              <button type="submit" className="submit-btn">
                Register
              </button>
              {errorMessage && <p className="error-message">{errorMessage}</p>}
              {successMessage && <p className="success-message">{successMessage}</p>}
              <p
                className="switch-form"
                onClick={() => {
                  setIsLogin(true);
                  setErrorMessage("");
                  setSuccessMessage("");
                }}
              >
                Already have an account? Login
              </p>
            </form>
          </div>
        )}
      </div>
    </div>
  );
};

Login.propTypes = {
  setAuthenticated: PropTypes.func.isRequired,
};

export default Login;
