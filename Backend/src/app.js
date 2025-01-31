import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import notesRoutes from './routes/note.js';
import userRoutes from './routes/user.js';
import authRoutes from './routes/auth.js';

console.log(process.env.DB_NAME);

// Crear la aplicación express
const app = express();
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

app.use('/api', notesRoutes); // api/notes
app.use('/api', userRoutes); // api/users
app.use('/api', authRoutes); // api/login, api/register

export default app;