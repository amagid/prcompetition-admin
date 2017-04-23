const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const FileTypes = require('../../../models/FileTypes');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(FileTypes.search(req.body.fileType)));

    router.post('/',
        validation(validators.validatePost),
        (req, res) => res.promise(FileTypes.create(req.body.fileType, req.body.value)));
    
    router.delete('/',
        validation(validators.validateDelete),
        (req, res) => res.promise(FileTypes.deleteOne(req.params.fileType)));
    
    router.patch('/:fileType',
        validation(validators.validatePatch),
        (req, res) => res.promise(FileTypes.update(req.params.fileType, req.body.updates)));
}