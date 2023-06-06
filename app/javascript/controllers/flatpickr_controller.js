import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Import the rangePlugin from the flatpickr library
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    flatpickr(this.startTimeTarget, {
              dateFormat: "Y-m-d",
              // defaultDate: ["2024-10-11", "2024-10-10"],
              disable: [
                function(date) {
                    // disable every multiple of 8
                    return !(date.getDate() % 8);
                }
              ],
              // Provide an id for the plugin to work
              plugins: [new rangePlugin({ input: "#endtime"})]
            })
    flatpickr(this.endTimeTarget, {
              dateFormat: "Y-m-d",
              // defaultDate: ["2024-10-11", "2024-10-10"],
              disable: [
                function(date) {
                    // disable every multiple of 8
                    return !(date.getDate() % 8);
                }
              ],
              // Provide an id for the plugin to work
              plugins: [new rangePlugin({ input: "#starttime"})]
             })
  }
}
