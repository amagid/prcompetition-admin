const Participants = require('../../models/Participants');

module.exports = function mountAPI(router) {
    router.get('/', (req, res) => res.promise('You\'re a dipshit'));
    
    router.get('/summary', (req, res) => res.promise(Participants.getSummary()));
};