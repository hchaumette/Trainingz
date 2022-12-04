import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-exercise"
export default class extends Controller {
static targets = ["exercise"]

static values = {roundId: Number}

  connect() {

  }

  select(event){
    event.preventDefault();
    console.log("selected");


    event.currentTarget.classList.toggle('selected-exercise')

    if (event.currentTarget.dataset.selected === true) {
      event.currentTarget.dataset.selected = false
    } else {
      event.currentTarget.dataset.selected = true
    }

  }

  confirm() {
    console.log("confirmed");
    this.token = document.getElementsByName("csrf-token")[0].content
    this.exerciseTargets.forEach((exercise) => {
      if (exercise.dataset.selected === "true") {
        console.log("FETCH");
        const path = `/rounds/${this.roundIdValue}/workout_exercises`;
        console.log(path);
        fetch(path, {
          method: "POST",
          headers: { "Accept": "application/json", "X-CSRF-Token": this.token },
          body: {"exercise_id": exercise.dataset.exerciseId}
        })
      }
    })
  }

}
    // window.location.href = `http://wwww.traininz.me/workouts/round/${this.roundIdValue}/workout_exercises`;
