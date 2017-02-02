const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const UploadTypes = require('../../../models/UploadTypes');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(UploadTypes.findAll()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(UploadTypes.findById(req.params.id)));

    router.post('/',
        validation(validators.validatePost),
        (req, res) => res.promise(UploadTypes.create(req.body.name, req.body.value)));
    
    router.delete('/:id',
        validation(validators.validateDelete),
        (req, res) => res.promise(UploadTypes.deleteOne(req.params.id)));
    
    router.patch('/:id',
        validation(validators.validatePatch),
        (req, res) => res.promise(UploadTypes.update(req.params.id, req.body.updates)));
}