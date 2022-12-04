import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-exercise"
export default class extends Controller {
static targets = ["exercise"]



  connect() {
    console.log(this.exerciseTargets)
    console.log(this.exerciseTargets[0].dataset.exerciseId);

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
<<<<<<< Updated upstream
    console.log("confirmed");
    this.exerciseTargets.forEach((exercise)=> {
=======
>>>>>>> Stashed changes

    this.token = document.getElementsByName("csrf-token")[0].content;
    this.exerciseTargets.forEach((exercise) => {
      if (exercise.dataset.selected === "true") {
        console.log("FETCH");
<<<<<<< Updated upstream
=======
        const path = `/rounds/${this.roundIdValue}/workout_exercises`;
        console.log(path);
        fetch(path, {
          method: "POST",
          headers: { "Accept": "application/json", "X-CSRF-Token": this.token },
          body: {"exercise_id": exercise.dataset.exerciseId}
        })
>>>>>>> Stashed changes
      }
    })
<<<<<<< Updated upstream

=======
    // window.location.href = `http://wwww.trainingz.me/round/${this.roundIdValue}/workout_exercises`;
>>>>>>> Stashed changes
  }
}
