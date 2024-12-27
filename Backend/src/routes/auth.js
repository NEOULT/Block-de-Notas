import { Router } from 'express';
import { createUser, loginUser } from '../controllers/authController.js';

const router = Router();

// Ruta de registro
router.post("/register", createUser);

// Ruta de login
router.post("/login", loginUser);

export default router;