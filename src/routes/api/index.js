const express = require('express');

module.exports = function mountAPI(router) {
    //Generate Routers
    const groups = express.Router();
    const opportunities = express.Router();
    const participants = express.Router();
    const uploads = express.Router();
    const uploadTypes = express.Router();

    //Mount API routes onto routers
    require('./groups')(groups);
    require('./opportunities')(opportunities);
    require('./participants')(participants);
    require('./uploads')(uploads);
    require('./uploadTypes')(uploadTypes);

    //Attach routers to primary router
    router.use('/groups', groups);
    router.use('/opportunities', opportunities);
    router.use('/participants', participants);
    router.use('/uploads', uploads);
    router.use('/types', uploadTypes);
};