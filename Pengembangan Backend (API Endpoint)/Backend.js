const express = require('express');
const cors = require('cors');

const app = express();
const corsOptions = {
  methods: ['GET', 'POST'],
  allowedHeaders: ['Content-Type'],
};
app.use(cors(corsOptions));
app.use(express.json());

let formData = [];

function search(query) {
  const { name } = query;
  let matchesName;

  if (name) {
      matchesName = formData.filter(entry => entry.name === name);
  } else {
      matchesName = null;
  }

  return matchesName;
}

app.post('/submit-form', (req, res) => {
  const { name, message } = req.body;

  if (!name || !message) {
    return res.status(400).json({ error: 'Semua field harus diisi' });
  }

  const userEntry = {
    name,
    message,
    submittedAt: new Date()
  };

  formData.push(userEntry);

  res.status(201).json({
    message: 'Your form has been submitted',
    data: userEntry
  });
});

app.get('/form-data', (req, res) => {
  res.status(200).json(formData);
});

app.get('/search', (req, res) => {
  const results = search(req.query);
  res.status(200).json(results);
});

//Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server Running in http://localhost:${PORT}`);
});
