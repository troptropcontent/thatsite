import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "content" ]
  toggleContent(){
    this.contentTarget.classList.toggle("show")
  }
}
