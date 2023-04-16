const express = require('express');
const jwt = require('jsonwebtoken');

const router = express.Router();

router.post('/login', (req,res) => {
    res.send();
});

router.get('/logout', (req,res) => {
    res.send();
});

router.get('/register', (req,res) => {
    res.send('daftar account');
});

module.exports = router;