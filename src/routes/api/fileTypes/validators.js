module.exports = {
    validateGetOne,
    validatePost,
    validateDelete,
    validatePatch
};

function validateGetOne(input) {
    input.check('fileType').notEmpty().isInt();

    input.sanitize('fileType').toInt();
}

function validatePost(input) {
    input.check('name').notEmpty();
    input.check('value').notEmpty().isInt();
    
    input.sanitize('value').toInt();
}

function validateDelete(input) {
    input.check('fileType').notEmpty();}

function validatePatch(input) {
    input.check('fileType').notEmpty();
    input.check('updates.fileType').optional();
    input.check('updates.value').optional().isInt();
    
    input.sanitize('updates.value').toInt();
}