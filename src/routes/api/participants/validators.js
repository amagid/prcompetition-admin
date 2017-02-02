module.exports = {
    validateGetOne,
    validatePost,
    validateDelete,
    validatePatch
};

function validateGetOne(input) {
    input.check('id').notEmpty().isInt();

    input.sanitize('id').toInt();
}

function validatePost(input) {
    input.check('name').notEmpty();
    input.check('caseid').notEmpty().matches(/[a-z]{1,3}[0-9]*/);
}

function validateDelete(input) {
    input.check('id').notEmpty().isInt();
    
    input.sanitize('id').toInt();
}

function validatePatch(input) {
    input.check('id').notEmpty().isInt();
    input.check('updates.name').optional();
    input.check('updates.caseid').optional().matches(/[a-z]{1,3}[0-9]*/);

    input.sanitize('id').toInt();
    input.sanitize('updates.caseid').whitelist('[a-z0-9]');
}