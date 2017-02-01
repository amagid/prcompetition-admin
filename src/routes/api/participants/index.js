const Participants = require('../../../models/Participants');

module.exports = routes;

function routes(router) {

    router.get('/', (req, res) => res.promise(Participants.findAll()));

    router.get('/summary', (req, res) => res.promise(Participants.getSummary()));
}