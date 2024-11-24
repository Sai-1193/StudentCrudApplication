import React, { useState } from 'react';

interface StatusCodeFieldProps {
  onChange: (statusCodes: number[]) => void;
}

const StatusCodesInput: React.FC<StatusCodeFieldProps> = ({ onChange }) => {
  const [statusCodes, setStatusCodes] = useState<number[]>([200, 400]);
  const [newCode, setNewCode] = useState<number>(0);

  const handleAddStatusCode = () => {
    if (newCode && !statusCodes.includes(newCode)) {
      const updatedCodes = [...statusCodes, newCode];
      setStatusCodes(updatedCodes);
      onChange(updatedCodes); // Pass the updated codes to the parent
      setNewCode(0); // Reset input
    }
  };

  const handleDeleteStatusCode = (code: number) => {
    const updatedCodes = statusCodes.filter((statusCode) => statusCode !== code);
    setStatusCodes(updatedCodes);
    onChange(updatedCodes); // Pass the updated codes to the parent
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setNewCode(Number(e.target.value));
  };

  return (
    <div>
      <div>
        <label>Enter Status Code:</label>
        <input
          type="number"
          value={newCode}
          onChange={handleInputChange}
          placeholder="Enter a status code"
        />
        <button onClick={handleAddStatusCode}>Add</button>
      </div>

      <div>
        <h4>Current Status Codes:</h4>
        <ul>
          {statusCodes.map((code, index) => (
            <li key={index}>
              {code}
              <button onClick={() => handleDeleteStatusCode(code)}>Delete</button>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default StatusCodesInput;


import React, { useState } from 'react';
import StatusCodesInput from './StatusCodesInput';

const ResponseValidationForm: React.FC = () => {
  const [statusCodes, setStatusCodes] = useState<number[]>([]);

  const handleStatusCodesChange = (updatedCodes: number[]) => {
    setStatusCodes(updatedCodes);
  };

  return (
    <div>
      <h2>Response Validation</h2>
      <div>
        <label>Status Codes:</label>
        <StatusCodesInput onChange={handleStatusCodesChange} />
      </div>
      <div>
        <h3>Selected Status Codes</h3>
        <pre>{JSON.stringify(statusCodes, null, 2)}</pre>
      </div>
    </div>
  );
};

export default ResponseValidationForm;






import React, { useState } from 'react';

interface SelectInputProps {
  options: string[]; // Predefined options for the dropdown
  label: string; // Label for the input
  onChange: (value: string) => void; // Function to pass the selected/entered value to parent
}

const SelectInput: React.FC<SelectInputProps> = ({ options, label, onChange }) => {
  const [inputValue, setInputValue] = useState<string>(''); // Input field value
  const [selectedValue, setSelectedValue] = useState<string>(''); // Dropdown selected value
  const [isCustomValue, setIsCustomValue] = useState<boolean>(false); // Flag to track if input is custom

  // Handle changes in the input field
  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInputValue(e.target.value);
    setIsCustomValue(true); // Set flag to true if user is typing in the input field
    onChange(e.target.value); // Pass the entered value to the parent component
  };

  // Handle changes in the dropdown selection
  const handleSelectChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const value = e.target.value;
    setSelectedValue(value);
    setIsCustomValue(false); // Set flag to false when selecting from dropdown
    onChange(value); // Pass the selected value to the parent component
  };

  return (
    <div>
      <label>{label}</label>
      <div style={{ display: 'flex', alignItems: 'center' }}>
        {/* If the user is typing, show input */}
        {isCustomValue ? (
          <input
            type="text"
            value={inputValue}
            onChange={handleInputChange}
            placeholder="Enter custom value"
            style={{ flex: 1, marginRight: '10px' }}
          />
        ) : (
          <select
            value={selectedValue}
            onChange={handleSelectChange}
            style={{ flex: 1, marginRight: '10px' }}
          >
            <option value="">Select an option...</option>
            {options.map((option, index) => (
              <option key={index} value={option}>
                {option}
              </option>
            ))}
          </select>
        )}
        {/* Add an option to allow entering custom values */}
        <button
          type="button"
          onClick={() => {
            setIsCustomValue(true); // Enable typing mode when button is clicked
            setSelectedValue(''); // Clear selected value
          }}
        >
          Enter Custom
        </button>
      </div>
    </div>
  );
};

export default SelectInput;




