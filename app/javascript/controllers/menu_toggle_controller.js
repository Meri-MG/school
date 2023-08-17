import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-toggle"
export default class extends Controller {
  static targets = ["menu", "hamburger"];

  toggleMenu() {
    this.menuTarget.classList.toggle("change");
    this.hamburgerTargets.forEach(target => {
      target.classList.toggle("change");
    });
  }
}
