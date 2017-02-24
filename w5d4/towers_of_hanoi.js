const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.stacks = [[3,2,1],[],[]];
  }

  promptMove(callback) {
    console.log(this.stacks);
    reader.question("Where do you want to move from? ", (from) => {
      reader.question("Where do you want to move to? ", (to) => {
        return callback(from, to);
      });
    });
  }

  isValidMove(from, to) {
    if (this.stacks[from].length === 0) {
      return false;
    }
    else if (this.stacks[to].length === 0) {
      return true;
    }
    let fromLast = this.stacks[from][this.stacks[from].length - 1];
    let toLast = this.stacks[to][this.stacks[to].length - 1];
    return fromLast < toLast;
  }

  move(from, to) {
    if (this.isValidMove(from, to)) {
      this.stacks[to].push(this.stacks[from].pop());
      return true;
    }
    return false;
  }

  print() {
    console.log(JSON.stringify(this.stacks));
  }

  isWon() {
    if (this.stacks[1].length === 3 || this.stacks[2].length === 3) {
      return true;
    }
    return false;
  }

  run(completionCallback) {
    if (this.isWon) { completionCallback(); }
    this.promptMove((from, to) => {
      let moved = this.move(from, to);
      if (!moved) { console.log("Invalid move!"); }
      run(completionCallback);
    });
  }
}

let g = new Game();
g.run(() => {
  console.log("You win!");
  g.print();
});
