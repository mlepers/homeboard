import swal from 'sweetalert';

const initSweetalertCreated = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  const formCreation = document.getElementById("form_creation");
  if (swalButton) {
    swalButton.addEventListener('click', (event) => {
      event.preventDefault();
      swal(options).then(isConfirm => {
        if (isConfirm) {
          formCreation.submit();
        }
      });;
    });
  }
};

export { initSweetalertCreated };