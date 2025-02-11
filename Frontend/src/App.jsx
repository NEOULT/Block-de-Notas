import { useEffect, useState } from 'react';
import './App.css';
import ApplicationTittle from './components/ApplicationTittle';
import CardNote from './components/CardNote';
import CardNoteGrid from './components/CardNoteGrid';
import Header from './components/Header';
import MatrixEffect from './components/MatrixEffect';
import SearchInput from './components/SearchInput';
import styled, { keyframes } from 'styled-components';
import { deleteApiNote, getApiNotes } from './Services';
import CreateNoteModal from './components/CreateNoteModal';
import EditNoteModal from './components/EditNoteModal';
import ConfigButton from './components/ConfigButton';
import ConfigModal from './components/ConfigModal'; // Importa el modal de configuración

// Definir la animación de descenso
const slideDown = keyframes`
  from {
    transform: translateY(-100%);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
`;

const AnimatedContent = styled.div`
  animation: ${slideDown} 2s ease-out;
  position: relative;
  z-index: 1;
`;

function App() {
  const [notes, setNotes] = useState([]);
  const [CreateNotemodalOpen, setCreateNoteModalOpen] = useState(false);
  const [noteToEdit, setNoteToEdit] = useState(null);
  const [searchValue, setSearchValue] = useState('');
  const [filteredNotes, setFilteredNotes] = useState([]);
  const [configModalOpen, setConfigModalOpen] = useState(false); // Estado para el modal de configuración
  const [cardConfig, setCardConfig] = useState({
    backgroundColor: '#ffffff',
    borderColor: '#04d9b2',
    textColor: '#000000'
  });

  async function getNotes() {
    const notes = await getApiNotes();
    setNotes(notes);
  }

  useEffect(() => {
    getNotes();
  }, []);

  useEffect(() => {
    if(searchValue){
      const filteredNotes = getFilterNotes();
      setFilteredNotes(filteredNotes);
    }
  }, [searchValue]);

  useEffect(() => {
    // Cargar la configuración desde el localStorage al iniciar la aplicación
    const savedConfig = localStorage.getItem('cardConfig');
    if (savedConfig) {
      setCardConfig(JSON.parse(savedConfig));
    }
  }, []);

  function getFilterNotes() {

    const filteredNotes = notes.filter((note) => {
      return note.title.toLowerCase().includes(searchValue.toLowerCase() ||
        note.content.toLowerCase().includes(searchValue.toLowerCase()));
    });

    return filteredNotes;
  }

  async function handleOnCreate() {
    setCreateNoteModalOpen(false);
    await getNotes();
  }

  function handleOnEditNote(note) {
    setNoteToEdit(note);
  }

  async function handleOnEdit() {
    setNoteToEdit(null);
    await getNotes();
  }

  async function handleOnRemoveNote(id) {
    try {
      const confirmed = window.confirm('Are you sure you want to delete this note?');
      if (!confirmed) {
        return;
      }

      await deleteApiNote(id);
      await getNotes();
    } catch (error) {
      console.error('Error removing note:', error);
    }
  }

  const handleConfigClick = () => {
    setConfigModalOpen(true); // Abre el modal de configuración
  };

  const handleConfigSave = (config) => {
    // Guarda la configuración de las tarjetas
    setCardConfig(config);
    localStorage.setItem('cardConfig', JSON.stringify(config)); // Guardar en localStorage
    console.log('Configuración guardada', config);
  };

  return (
    <div className="AppWrapper">
      <MatrixEffect />
      <ConfigButton onClick={handleConfigClick}/>
      <ConfigModal
        isOpen={configModalOpen}
        onClose={() => setConfigModalOpen(false)}
        onSave={handleConfigSave}
      />
      <AnimatedContent>
        <header className="App-header">
          <ApplicationTittle />
          <SearchInput onSearch={(value) => setSearchValue(value)} />
        </header>
        <Header onClick={() => setCreateNoteModalOpen(true)} />
        <CardNoteGrid cardConfig={cardConfig}>
          {Array.isArray(notes) && notes.length > 0 ? (
            (filteredNotes.length > 0 && searchValue !== '' 
              ? [...filteredNotes] 
              : [...notes]).map((note) => (
              <CardNote
                key={note.id}
                title={note.title}
                description={note.content}
                onEdit={() => handleOnEditNote(note)}
                onRemove={() => handleOnRemoveNote(note.id)}
                cardConfig={cardConfig}
              />
            ))
          ) : (
            <p>No notes available</p>
          )}
        </CardNoteGrid>
        <CreateNoteModal
          isOpen={CreateNotemodalOpen}
          onClose={() => setCreateNoteModalOpen(false)}
          onCreate={handleOnCreate}
        />

        {noteToEdit !== null && (
          <EditNoteModal
            note={noteToEdit}
            isOpen
            onClose={() => setNoteToEdit(null)}
            onEdit={handleOnEdit}
          />
        )}
      </AnimatedContent>
    </div>
  );
}

export default App;