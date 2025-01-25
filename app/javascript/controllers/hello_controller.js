import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log(aaaaaaa)
    this.element.textContent = "Hello World!"
  }
}
