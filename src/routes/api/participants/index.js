const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Participants = require('../../../models/Participants');

module.exports = routes;

function routes(router) {

    router.get('/', (req, res) => res.promise(Participants.findAll()));

    router.get('/summary', (req, res) => res.promise(Participants.getSummary()));

    router.get('/:caseid',
        validation(validators.validateGetOne),
        (req, res) => res.promise(Participants.findByCaseID(req.params.caseid)));

    router.post('/',
        validation(validators.validatePost),
        (req, res) => res.promise(Participants.create(req.body)));
    
    router.delete('/:caseid',
        validation(validators.validateDelete),
        (req, res) => res.promise(Participants.deleteOne(req.params.caseid)));
    
    router.patch('/:caseid',
        validation(validators.validatePatch),
        (req, res) => res.promise(Participants.update(req.params.caseid, req.body.updates)));

    router.post('/rescore',
        (req, res) => res.Promise(Participants.recalculateAll()));

    router.post('/:caseid/recalculate',
        validation(validators.validateRecalculateOne),
        (req, res) => res.Promise(Participants.recalculateOne(req.params.caseid)));
}