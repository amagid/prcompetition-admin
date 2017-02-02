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
    input.check('value').notEmpty().isInt();
    
    input.sanitize('value').toInt();
}

function validateDelete(input) {
    input.check('id').notEmpty().isInt();
    
    input.sanitize('id').toInt();
}

function validatePatch(input) {
    input.check('id').notEmpty().isInt();
    input.check('updates.name').optional();
    input.check('updates.value').optional().isInt();

    input.sanitize('id').toInt();
    input.sanitize('updates.value').toInt();
}