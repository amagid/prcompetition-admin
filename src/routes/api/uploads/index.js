const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Uploads = require('../../../models/Uploads');

module.exports = routes;

function routes(router) {
    router.get('/',
        validation(validators.validateGet),
        (req, res) => res.promise(Uploads.search(req.body.filename, req.body.extension)));

    router.post('/',
        validation(validators.validatePost),
        (req, res) => res.promise(Uploads.create(req.body)));

    router.patch('/:filename',
        validation(validators.validatePatch),
        (req, res) => res.promise(Uploads.update(req.params.filename, req.body.extension, req.body.updates)));

    router.delete('/:filename',
        validation(validators.validateDelete),
        (req, res) => res.promise(Uploads.delete(req.params.filename, req.body.extension)));
}