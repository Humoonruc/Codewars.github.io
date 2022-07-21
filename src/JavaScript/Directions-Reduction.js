function dirReduc(arr) {

    const opposite_dir = new Map([
        ["NORTH", "SOUTH"], ["SOUTH", "NORTH"],
        ["EAST", "WEST"], ["WEST", "EAST"]]);

    const stack = [];

    for (step of arr) {
        let n = stack.length;
        if (n !== 0 && opposite_dir.get(step) === stack[n - 1]) {
            stack.pop();
        } else {
            stack.push(step);
        }
    }

    return stack;
}



console.log(dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]));



