const alertAnimation = () => {
  const alert = document.querySelector('.card-service');
  if (alert) {
    document.addEventListener('click', event => {
      const element = event.target
      if (element.className === 'alert-cross') {
        element.parentElement.style.animationPlayState = 'running';
        element.parentElement.addEventListener('animationend', () => {
          element.parentElement.remove();
        })
      }
    })
  }
}

export { alertAnimation };