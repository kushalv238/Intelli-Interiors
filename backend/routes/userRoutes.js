const express = require('express');
const router = express.Router();

const userController = require('../controllers/userController');

router.route('/')
    .get(userController.getAUser)
    .post(userController.getUser)
    .patch(userController.updateUser)

    
module.exports = router;