const changeArrow = () => {
  const arrow = document.getElementById("arrow");
  if (arrow) {
    arrow.addEventListener("click", () => {
      arrow.classList.toggle("fa-angle-down");
      arrow.classList.toggle("fa-angle-up");
    })
  }
}

export { changeArrow };