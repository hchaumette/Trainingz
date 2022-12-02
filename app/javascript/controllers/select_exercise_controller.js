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
    this.token = document.getElementsByName("csrf-token")[0].content
    console.log(this.roundIdValue);
    this.exerciseTargets.forEach((exercise) => {

      if (exercise.dataset.selected === "true") {
        console.log("FETCH");
        fetch(`round/${this.roundIdValue}/workout_exercises`, {
          method: "POST",
          headers: { "Accept": "application/json", "X-CSRF-Token": this.token },
          body: {"exercise_id": exercise.dataset.exerciseId}
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
        })
      }
    })

  }
}
