module.exports = {
    validateGet,
    validatePost,
    validateDelete,
    validatePatch
};

function validateGet(input) {
    input.check('semester').optional().matches(/(spring)|(fall)/);
    input.check('year').optional().isInt();

    input.sanitize('year').toInt();
}

function validatePost(input) {
    input.check('name').notEmpty();
    input.check('value').notEmpty().isInt();
    input.check('date').notEmpty().isISO8601();
}

function validateDelete(input) {
}

function validatePatch(input) {
}