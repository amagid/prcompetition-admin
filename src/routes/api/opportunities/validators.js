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
    input.check('date').notEmpty().isISO8601();
    input.check('group_id').notEmpty().isInt();
    
    input.sanitize('value').toInt();
    input.sanitize('date').toDate();
    input.sanitize('group_id').toInt();
}

function validateDelete(input) {
    input.check('id').notEmpty().isInt();
    
    input.sanitize('id').toInt();
}

function validatePatch(input) {
    input.check('id').notEmpty().isInt();
    input.check('updates.name').optional();
    input.check('updates.value').optional().isInt();
    input.check('updates.date').optional().isISO8601();
    input.check('updates.group_id').optional().isInt();
    
    input.sanitize('id').toInt();
    input.sanitize('updates.value').toInt();
    input.sanitize('updates.date').toDate();
    input.sanitize('updates.group_id').toInt();
}