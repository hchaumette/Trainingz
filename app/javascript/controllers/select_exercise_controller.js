import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-exercise"
export default class extends Controller {
static targets = ["exercise","container"]

static values = {roundId: Number, workoutId: Number}

  connect() {
  }

  select(event){
    event.preventDefault();
    event.currentTarget.classList.toggle('selected-exercise');
    if (event.currentTarget.dataset.selected === "true") {
      event.currentTarget.dataset.selected = false;
    } else {
      event.currentTarget.dataset.selected = true;
      this.containerTarget.after(event.currentTarget);
    }

  }

  confirm() {
    this.token = document.getElementsByName("csrf-token")[0].content
    let exerciseId = ""
    this.exerciseTargets.forEach((exercise) => {
      if (exercise.dataset.selected === "true") {
        exerciseId = exerciseId + "," + exercise.dataset.exerciseId;
        console.log(exerciseId)
        exercise.children[0].children[1].children[1].value = exercise.dataset.exerciseId;


      }
    })
    const path = `/rounds/${this.roundIdValue}/workout_exercises`;
    fetch(path, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.token },
      body: exerciseId
    }).then(response => {
      window.location.href = `${window.location.href.match(/(.*)(rounds.*)/)[1]}workouts/${this.workoutIdValue}/edit`
    })
  }

  search(event){
    this.exerciseTargets.forEach((exercise)=>{
      const title = exercise.dataset.title.toUpperCase().indexOf(event.currentTarget.value.toUpperCase()) > -1
      const focus = exercise.dataset.focus.toUpperCase().indexOf(event.currentTarget.value.toUpperCase()) > -1
      if (title || focus){
        exercise.classList.remove("d-none");
      } else if (exercise.dataset.selected === "false") {
        exercise.classList.add("d-none");
      }
    })
  }
}
    // window.location.href = `${window.location.href.match(/(.*)(rounds.*)/)[1]}workouts/${this.workoutIdValue}/edit`;
