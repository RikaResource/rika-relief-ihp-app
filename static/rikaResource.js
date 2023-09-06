// This is the javascript for the zooming in and out for the 'canvas':
function zoom(event) {
    event.preventDefault();

    scale += event.deltaY * -0.01;

    // Restrict scale
    scale = Math.min(Math.max(0.125, scale), 4);

    // Apply scale transform
    el.style.transform = `scale(${scale})`;
    console.log("Zoooming!!")
}
var scale = 1;
var el = document.getElementsByClassName("resource-canvas")[0];
var resourcePool = document.getElementById("resource-pool");
console.log("Hello resource!");
// window.addEventListener("wheel", event => console.info(event.deltaY));
window.addEventListener("wheel", event => {
    const delta = Math.sign(event.deltaY);
    console.info(delta);
    console.log(resourcePool);
    console.log(el);
    event.preventDefault();

    scale += event.deltaY * -0.001;

    // Restrict scale
    scale = Math.min(Math.max(0.125, scale), 4);

    // Apply scale transform
    el.style.transform = `scale(${scale})`;
    console.log("Zoooming!!")
});
