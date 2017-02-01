const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Uploads = require('../../../models/Uploads');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Uploads.findAll()));

    router.get('/:id',
        validation(validators.validateGetOne),
        (req, res) => res.promise(Uploads.findById(req.params.id)));
}