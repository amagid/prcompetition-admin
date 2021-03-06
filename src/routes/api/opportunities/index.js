const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Opportunities = require('../../../models/Opportunities');

module.exports = routes;

function routes(router) {
    router.get('/',
        validation(validators.validateGet), 
        (req, res) => res.promise(Opportunities.search(req.query)));

    router.post('/',
        validation(validators.validatePost),
        (req, res) => res.promise(Opportunities.create(req.body)));
    
    router.delete('/:opp',
        validation(validators.validateDelete),
        (req, res) => res.promise(Opportunities.deleteOne(req.params.opp, req.body)));
    
    router.post('/:opp',
        validation(validators.validatePatch),
        (req, res) => res.promise(Opportunities.update(req.body)));

    router.post('/:opp/attendance/:caseid',
        (req, res) => res.promise(Opportunities.addAttendance(req.params.caseid, req.body)));

    router.get('/:opp/attendance',
        (req, res) => res.promise(Opportunities.getAttendance(req.query)));

    router.get('/:opp/attendance/:caseid',
        (req, res) => res.promise(Opportunities.checkAttendance(req.params.caseid, req.query)));

    router.delete('/:opp/attendance/:caseid',
        (req, res) => res.promise(Opportunities.removeAttendance(req.params.caseid, req.body)));
}