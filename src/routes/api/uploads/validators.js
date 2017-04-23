module.exports = {
    validateGetOne,
    validatePost,
    validatePatch,
    validateDelete
};

const extPattern = /[a-z0-9]+/;

function validateGetOne(input) {
    input.check('filename').notEmpty();
    input.check('extension').notEmpty().matches(extPattern);
}

function validatePost(input) {
    input.check('filename').notEmpty();
    input.check('extension').notEmpty().matches(extPattern);
}

function validatePatch(input) {
    input.check('filename').notEmpty();
    input.check('extension').notEmpty().matches(extPattern);
}

function validateDelete(input) {
    input.check('filename').notEmpty();
    input.check('extension').notEmpty().matches(extPattern);
}