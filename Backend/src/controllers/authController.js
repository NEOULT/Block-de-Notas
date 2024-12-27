import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import User from '../models/user.js'; 

// Clave secreta para JWT
const JWT_SECRET = process.env.JWT_SECRET;

export const createUser = async (req, res) => {
    const { name, username, password } = req.body;
  
    if (!name || !username || !password) {
      return res.status(400).json({ success: false, message: "All fields are required" });
    }
  
    try {
      // Verifica si el usuario ya existe
      const userExists = await User.findOne({ where: { username } });
      if (userExists) {
        return res.status(400).json({ success: false, message: "User already exists" });
      }
  
      // Hashea la contraseña
      const hashedPassword = await bcrypt.hash(password, 10);
  
      // Crea el usuario
      const user = await User.create({ name, username, password: hashedPassword });
  
      // Verificar que el usuario se ha creado correctamente
      if (!user) {
        return res.status(500).json({ success: false, message: "User creation failed" });
      }
  
      // Genera un token JWT
      const token = jwt.sign({ id: user.id, username: user.username }, JWT_SECRET, { expiresIn: "1h" });
  
      res.status(200).json({ success: true, message: "User registered successfully", token });
    } catch (error) {
      console.error('Error during registration:', error);
      res.status(500).json({ success: false, message: "Internal server error", error });
    }
};

export const loginUser = async (req, res) => {
    const { username, password } = req.body;
  
    if (!username || !password) {
      return res.status(400).json({ success: false, message: "All fields are required" });
    }
  
    try {
      // Verifica si el usuario existe
      const user = await User.findOne({ where: { username } });
      if (!user) {
        return res.status(400).json({ success: false, message: "Invalid username or password" });
      }
  
      // Verifica la contraseña
      const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        return res.status(400).json({ success: false, message: "Invalid username or password" });
      }
  
      // Genera un token JWT
      const token = jwt.sign({ id: user.id, username: user.username }, JWT_SECRET, { expiresIn: "1h" });
  
      res.status(200).json({ success: true, message: "Login successful", token });
    } catch (error) {
      console.error('Error during login:', error);
      res.status(500).json({ success: false, message: "Internal server error", error });
    }
};