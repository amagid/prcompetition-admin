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
    input.check('multiplier').notEmpty().isInt();
    
    input.sanitize('multiplier').toInt();
}

function validateDelete(input) {
    input.check('id').notEmpty().isInt();
    
    input.sanitize('id').toInt();
}

function validatePatch(input) {
    input.check('id').notEmpty().isInt();
    input.check('updates.name').optional();
    input.check('updates.multiplier').optional().isInt();

    input.sanitize('id').toInt();
    input.sanitize('updates.multiplier').toInt();
}