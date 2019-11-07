const db = require('../data/db-config.js')
module.exports = {
    find,
    findById,
    update,
    remove,
    add,
    findSteps
}

//FIND
function find(){
    return db('schemes')
}

//FIND BY ID
function findById(id){
    return db('schemes')
    .where({id})
    .first()
}

//FIND STEPS
function findSteps(id) {
    return db("steps")
      .join("schemes", "steps.scheme_id", "schemes.id")
      .select(
        "steps.id",
        "steps.step_number",
        "schemes.scheme_name",
        "steps.instructions"
      )
      .orderBy("steps.step_number")
      .where({ "steps.scheme_id": id });
  }

//ADD
function add(scheme) {
    return db("schemes")
      .insert(scheme)
      .then(ids => {
        return { id: ids[0] };
      });
  }

//UPDATE
function update(changes, id){
    return db('schemes')
    .where({id})
    .update(changes)
}

//REMOVE
function remove(id){
    return db('schemes')
    .where({ id })
    .del()
} 
