const DOMNodeCollection = require("./dom_node_collection.js")

window.$1 = (selector) => {
  if (typeof selector === "string") {
    let nodeList = document.querySelectorAll(selector);
    let elements = Array.prototype.slice.call(nodeList);
    return new DOMNodeCollection(elements);
  }
  else if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }
};
