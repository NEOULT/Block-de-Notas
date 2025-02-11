import { useState } from 'react';
import styled from 'styled-components';
import Modal from './common/Modal';

const FormGroup = styled.div`
    margin-bottom: 15px;
`;

const Label = styled.label`
    display: block;
    margin-bottom: 5px;
    color: #04d9b2; /* Texto verde */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
`;

const Input = styled.input`
    width: 100%;
    padding: 10px;
    border: 1px solid ${props => props.error ? 'red' : '#04d9b2'}; /* Borde rojo si hay error */
    border-radius: 5px;
    background: rgba(28, 30, 34, 0.85); /* Fondo oscuro translúcido */
    color: #ffffff; /* Texto blanco */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
    outline: none;
    transition: border-color 0.3s ease;

    &:focus {
        border-color: ${props => props.error ? 'red' : '#02b894'}; /* Borde rojo si hay error */
    }
`;

const ColorInput = styled.input`
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background: rgba(28, 30, 34, 0.85); /* Fondo oscuro translúcido */
    color: #ffffff; /* Texto blanco */
    font-family: 'Courier New', Courier, monospace; /* Fuente tipo consola */
    outline: none;
    transition: border-color 0.3s ease;
`;

const Button = styled.button`
    background: #04d9b2; /* Fondo verde */
    border: none;
    border-radius: 7px;
    color: #ffffff; /* Texto blanco */
    text-transform: uppercase;
    font-size: 14px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.3s ease;
    margin-right: 10px;

    &:hover {
        background: #02b894; /* Fondo verde más oscuro al pasar el ratón */
        transform: scale(1.05); /* Aumentar ligeramente el tamaño al pasar el ratón */
    }

    &:active {
        transform: scale(0.95); /* Reducir ligeramente el tamaño al hacer clic */
    }
`;

const PreviewCard = styled.div`
    background: ${props => props.backgroundColor || 'white'};
    border: 2px solid ${props => props.borderColor || '#04d9b2'};
    color: ${props => props.textColor || 'black'};
    padding: 20px;
    border-radius: 5px;
    margin-top: 20px;
`;

const ConfigModal = ({ isOpen, onClose, onSave }) => {
  const [formData, setFormData] = useState({
    backgroundColor: '#ffffff',
    borderColor: '#04d9b2',
    textColor: '#000000'
  });

  const handleInputOnChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSave = () => {
    // Lógica para guardar la configuración
    onSave(formData);
    onClose();
  };

  if (!isOpen) return null;

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      <h2>Configuración de las Tarjetas</h2>
      <FormGroup>
        <Label htmlFor="backgroundColor">Color de Fondo</Label>
        <ColorInput
          type="color"
          id="backgroundColor"
          name="backgroundColor"
          value={formData.backgroundColor}
          onChange={handleInputOnChange}
        />
      </FormGroup>
      <FormGroup>
        <Label htmlFor="borderColor">Color del Borde</Label>
        <ColorInput
          type="color"
          id="borderColor"
          name="borderColor"
          value={formData.borderColor}
          onChange={handleInputOnChange}
        />
      </FormGroup>
      <FormGroup>
        <Label htmlFor="textColor">Color del Texto</Label>
        <ColorInput
          type="color"
          id="textColor"
          name="textColor"
          value={formData.textColor}
          onChange={handleInputOnChange}
        />
      </FormGroup>
      <div>
        <Button onClick={handleSave}>Guardar</Button>
        <Button onClick={onClose}>Cancelar</Button>
      </div>
      <PreviewCard
        backgroundColor={formData.backgroundColor}
        borderColor={formData.borderColor}
        textColor={formData.textColor}
      >
        Vista previa de la tarjeta
      </PreviewCard>
    </Modal>
  );
};

export default ConfigModal;