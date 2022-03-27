import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "field", "selected", "options" ]
  static classes = [ "hidden" ]

  toggleOptions(event) {
    this.optionsTarget.classList.toggle('hidden')
  }
  selectOption(event){
    this.fieldTarget.value = event.params.id
    this.selectedTarget.innerHTML = event.currentTarget.innerHTML
    this.optionsTarget.classList.add('hidden')
  }
}
