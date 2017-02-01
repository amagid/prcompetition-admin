const Groups = require('../../../models/Groups');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Groups.findAll()));
}