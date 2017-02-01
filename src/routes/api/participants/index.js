const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Participants = require('../../../models/Participants');

module.exports = routes;

function routes(router) {

    router.get('/', (req, res) => res.promise(Participants.findAll()));

    router.get('/summary', (req, res) => res.promise(Participants.getSummary()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(Participants.findById(req.params.id)));
}