const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const UploadTypes = require('../../../models/UploadTypes');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(UploadTypes.findAll()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(UploadTypes.findById(req.params.id)));
}