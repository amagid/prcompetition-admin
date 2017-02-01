const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Groups = require('../../../models/Groups');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Groups.findAll()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(Groups.findById(req.params.id)));
}