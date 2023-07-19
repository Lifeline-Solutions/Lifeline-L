import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="previews"
export default class extends Controller {
  static targets = [ "input", "preview" ]
  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  preview() {
    const input = this.inputTarget
    const preview = this.previewTarget
    const file   = input.files[0]
    const reader = new FileReader()

    reader.onloadend = function () {
        preview.src = reader.result;
    };
    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }

  }
}
