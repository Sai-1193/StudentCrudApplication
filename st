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

