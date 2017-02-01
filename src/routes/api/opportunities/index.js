const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Opportunities = require('../../../models/Opportunities');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Opportunities.findAll()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(Opportunities.findById(req.params.id)));
}