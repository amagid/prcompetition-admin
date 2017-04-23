const express = require('express');
const mountAPI = require('./api');

module.exports = addRoutes;

function addRoutes(router) {
    const api = express.Router();
    mountAPI(api);
    
    router.use('/api', api);
};