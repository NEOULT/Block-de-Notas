import React from 'react';
import styled from 'styled-components';

const Button = styled.button`
  position: fixed;
  top: 10px;
  left: 10px;
  z-index: 2;
  background-color: #04d9b2;
  color: white;
  border: none;
  padding: 10px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;

  &:hover {
    background-color: #03b89e;
  }
`;

const ConfigButton = ({ onClick }) => {
  return (
    <Button onClick={onClick}>
      Configuración
    </Button>
  );
};

export default ConfigButton;