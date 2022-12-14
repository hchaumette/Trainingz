import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  connect(){
  }

  send(event){
    console.log('hello')
    event.preventDefault();
    let eventform = event.currentTarget;

    const url = event.currentTarget.action ;
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain"},
      body: new FormData(event.currentTarget)
    })
      .then((response) => {
        eventform.classList.add('shared-button-active');
      })

    }
  }
