const UploadTypes = require('../../../models/UploadTypes');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(UploadTypes.findAll()));
}