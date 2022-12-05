import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-exercise"
export default class extends Controller {
static targets = ["exercise"]

static values = {roundId: Number, workoutId: Number}

  connect() {
  }

  select(event){
    event.preventDefault();
    event.currentTarget.classList.toggle('selected-exercise')

    if (event.currentTarget.dataset.selected === true) {
      event.currentTarget.dataset.selected = false
    } else {
      event.currentTarget.dataset.selected = true
    }

  }

  confirm() {
    this.token = document.getElementsByName("csrf-token")[0].content
    this.exerciseTargets.forEach((exercise) => {
      if (exercise.dataset.selected === "true") {
        exercise.children[0].children[1].children[1].value = exercise.dataset.exerciseId
        const path = `/rounds/${this.roundIdValue}/workout_exercises`;
        fetch(path, {
          method: "POST",
          headers: { "Accept": "application/json", "X-CSRF-Token": this.token },
          body: new FormData(exercise.children[0])
        })
      }
    })
    window.location.href = `${window.location.href.match(/(.*)(rounds.*)/)[1]}workouts/${this.workoutIdValue}/edit`
  }

}
    // window.location.href = `${window.location.href.match(/(.*)(rounds.*)/)[1]}workouts/${this.workoutIdValue}/edit`;
