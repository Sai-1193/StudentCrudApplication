// App.tsx
import React, { useState } from 'react';
import FloatingLabelInput from './FloatingLabelInput';

const App: React.FC = () => {
  const [inputValue, setInputValue] = useState('');

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setInputValue(event.target.value);
  };

  return (
    <div className="App">
      <h1>Floating Label Input</h1>
      <FloatingLabelInput
        label="Your Name"
        value={inputValue}
        onChange={handleChange}
      />
    </div>
  );
};

export default App;
