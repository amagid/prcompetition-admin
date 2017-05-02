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

    router.post('/rescore',
        (req, res) => res.promise(Participants.recalculateAll()));

    router.post('/:caseid/rescore',
        validation(validators.validateRecalculateOne),
        (req, res) => res.promise(Participants.recalculateOne(req.params.caseid)));
        
    router.post('/:caseid',
        validation(validators.validatePatch),
        (req, res) => res.promise(Participants.updateByCaseID(req.params.caseid, req.body.updates)));
}