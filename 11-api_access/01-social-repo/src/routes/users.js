const express = require('express');

const router = express.Router();

router.get('/users', async (req, res) => {
	// Run a query to get all users
	// Send the result back to the person
	// who made this request
});

router.get('/users/:id', async (req, res) => {});

router.post('/users', async (req, res) => {});

router.put('/users/:id', async (req, res) => {});

router.delete('/users/:id', async (req, res) => {});

module.exports = router;
