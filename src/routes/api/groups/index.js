const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Groups = require('../../../models/Groups');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Groups.findAll()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(Groups.findById(req.params.id)));

    router.post('/',
        validation(validators.validatePost),
        (req, res) => res.promise(Groups.create(req.body.name, req.body.multiplier)));
    
    router.delete('/:id',
        validation(validators.validateDelete),
        (req, res) => res.promise(Groups.deleteOne(req.params.id)));
    
    router.patch('/:id',
        validation(validators.validatePatch),
        (req, res) => res.promise(Groups.update(req.params.id, req.body.updates)));
}