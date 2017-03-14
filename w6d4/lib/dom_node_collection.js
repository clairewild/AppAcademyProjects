class DOMNodeCollection {
  constructor(htmlElements) {
    this.nodes = htmlElements;
  }

  each(cb) {
    this.nodes.forEach(cb);
  }

  html(string) {
    if (string === undefined) {
      return this.nodes[0].innerHTML;
    }
    else if (typeof string === "string") {
      this.each(node => node.innerHTML = string)
    }
  }

  empty() {
    this.html("");
  }

  append(element) {
    if (element instanceof HTMLElement) {
      element = $1(element);
      this.each(node => {
        element.each(elnode => {
          node.appendChild(elnode);
        });
      });
    }
    else if (typeof element === "string") {
      this.each(node => node.innerHTML.concat(element);)
    }
    else if (element instanceof DOMNodeCollection) {
      this.each(node => {
        element.each(elnode => {
          node.appendChild(elnode);
        });
      });
    }
  }

  attr() {

  }

  addClass() {

  }

  removeClass() {

  }

}

module.exports = DOMNodeCollection;
