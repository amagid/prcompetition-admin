const Opportunities = require('../../../models/Opportunities');

module.exports = routes;

function routes(router) {
    router.get('/', (req, res) => res.promise(Opportunities.findAll()));
}