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







import React, { useState } from "react";

const AppContainer: React.FC = () => {
  const [selectedApp, setSelectedApp] = useState<string>("");
  const [selectedCarId, setSelectedCarId] = useState<string>("");
  const [showDetails, setShowDetails] = useState<boolean>(false);

  const handleAppChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    const appName = event.target.value;
    setSelectedApp(appName);
    
    // Find the carId for the selected application
    const carId = appData.find(app => app.appName === appName)?.carId || "";
    setSelectedCarId(carId);
  };

  const handleView = () => {
    setShowDetails(true);
  };

  return (
    <div>
      <select onChange={handleAppChange} value={selectedApp}>
        <option value="">Select Application</option>
        {appData.map(app => (
          <option key={app.appName} value={app.appName}>
            {app.appName}
          </option>
        ))}
      </select>

      <select value={selectedCarId} disabled>
        <option value="">Select Car ID</option>
        {appData
          .filter(app => app.appName === selectedApp)
          .map(app => (
            <option key={app.carId} value={app.carId}>
              {app.carId}
            </option>
          ))}
      </select>

      <button onClick={handleView}>View</button>

      {showDetails && (
        <div>
          <h3>Details for {selectedApp}</h3>
          <p>Car ID: {selectedCarId}</p>
          {/* Additional fields related to the application can go here */}
        </div>
      )}
    </div>
  );
};

export default AppContainer;



