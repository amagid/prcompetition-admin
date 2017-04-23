const validation = require('../../../middlewares/validation');
const validators = require('./validators');
const Opportunities = require('../../../models/Opportunities');

module.exports = routes;

function routes(router) {
    router.get('/',
        validation(validators.validateGet), 
        (req, res) => res.promise(Opportunities.search(req.query)));

    router.post('/:opp',
        validation(validators.validatePost),
        (req, res) => res.promise(Opportunities.create(req.params.opp, req.body)));
    
    router.delete('/:opp',
        validation(validators.validateDelete),
        (req, res) => res.promise(Opportunities.deleteOne(req.params.opp, req.body)));
    
    router.patch('/:opp',
        validation(validators.validatePatch),
        (req, res) => res.promise(Opportunities.update(req.params.opp, req.body.opportunity, req.body.updates)));
}