const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Opportunities = require('../../../models/Opportunities');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Opportunities.findAll()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(Opportunities.findById(req.params.id)));

    router.post('/',
        validation(validators.validatePost),
        (req, res) => res.promise(Opportunities.create(req.body.name, req.body.value, req.body.date, req.body.group_id)));
    
    router.delete('/:id',
        validation(validators.validateDelete),
        (req, res) => res.promise(Opportunities.deleteOne(req.params.id)));
}