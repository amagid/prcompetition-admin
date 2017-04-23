const express = require('express');

module.exports = function mountAPI(router) {
    //Generate Routers
    const opportunities = express.Router();
    const participants = express.Router();
    const uploads = express.Router();
    const fileTypes = express.Router();

    //Mount API routes onto routers
    require('./opportunities')(opportunities);
    require('./participants')(participants);
    require('./uploads')(uploads);
    require('./fileTypes')(fileTypes);

    //Attach routers to primary router
    router.use('/opportunities', opportunities);
    router.use('/participants', participants);
    router.use('/uploads', uploads);
    router.use('/fileTypes', fileTypes);
};