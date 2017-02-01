const Uploads = require('../../../models/Uploads');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Uploads.findAll()));
}