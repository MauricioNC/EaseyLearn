function hide(clas) {
  var x = document.getElementsByClassName(clas);
  for (let i=0;i<x.length;i++){
    if (x[i].style.display === "none") {
    x[i].style.display = "flex";
    } else {
    x[i].style.display = "none";
    }
  }
}