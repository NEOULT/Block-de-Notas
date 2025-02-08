//import { token } from "morgan";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import styled, { keyframes } from 'styled-components';

// Definir la animación de desvanecimiento
const fadeOut = keyframes`
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
`;

const MatrixCanvas = styled.canvas`
  display: block;
  background: black;
  animation: ${props => props.fadeOut ? fadeOut : ''} 2s forwards;
`;

const MatrixEffect = () => {
  const navigate = useNavigate();
  const [isActive, setIsActive] = useState(true);
  const [fadeOutEffect, setFadeOutEffect] = useState(false);

  useEffect(() => {
    const canvas = document.getElementById("matrix");
    const ctx = canvas.getContext("2d");

    // Configuración del canvas
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const fontSize = 16;
    const columns = canvas.width / fontSize; // Número de columnas
    const drops = Array(Math.floor(columns)).fill(0); // Posición inicial en cada columna

    const draw = () => {
      if (!isActive) return;

      // Fondo transparente
      ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
      ctx.fillRect(0, 0, canvas.width, canvas.height);

      // Configuración del texto
      ctx.fillStyle = "#00ff00"; // Verde Matrix
      ctx.font = `${fontSize}px monospace`;

      // Dibujar los caracteres
      for (let i = 0; i < drops.length; i++) {
        const text = String.fromCharCode(0x30a0 + Math.random() * 96); // Caracteres aleatorios
        const x = i * fontSize;
        const y = drops[i] * fontSize;

        ctx.fillText(text, x, y);

        // Reiniciar la posición si el texto sale del canvas
        if (y > canvas.height && Math.random() > 0.975) {
          drops[i] = 0;
        }
        drops[i]++;
      }
    };

    const interval = setInterval(draw, 33); // Velocidad del efecto (~30fps)

    return () => clearInterval(interval); // Limpiar el intervalo al desmontar el componente
  }, [isActive]);

  const toggleEffect = () => {
    if (isActive) {
      setFadeOutEffect(true);
      setTimeout(() => {
        setIsActive(false);
        setFadeOutEffect(false); // Restablece el estado de desvanecimiento después de que la animación haya terminado
        localStorage.removeItem('authToken');
        navigate('/login', { replace: true });
      }, 2000); // Tiempo de la animación de desvanecimiento
      
    } else {
      setIsActive(true);
    }
  };

  return (
    <div>
      <MatrixCanvas id="matrix" fadeOut={fadeOutEffect} />
      <button onClick={toggleEffect} style={{ position: "fixed", top: 10, right: 10, zIndex: 1 }}>
        {isActive ? "Get out of the matrix" : "Enter The Matrix"}
      </button>
    </div>
  );
};

export default MatrixEffect;
