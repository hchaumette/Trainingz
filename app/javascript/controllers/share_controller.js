import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  connect(){
  }

  send(event){
    event.preventDefault();
    let eventform = event.currentTarget[2];
    const url = event.currentTarget.action ;
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain"},
      body: new FormData(event.currentTarget)
    })
      .then((response) => {
        eventform.setAttribute('disabled', 'true')
      })

    }
  }
