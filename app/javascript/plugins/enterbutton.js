const pressEnterSubmit = () => {
  const form = document.getElementById("form_message");
  const myMessage = document.getElementById("message_content");
  const sendButton = document.getElementById("paper-plane-send");
  console.log(sendButton);
  if (form && myMessage) {
    myMessage.addEventListener("keyup", (event) => {
      if (event.which == 13) {
          event.preventDefault();
          form.submit();
      }
    });
    sendButton.addEventListener("click", () => {
      form.submit();
    })
  }
}

export { pressEnterSubmit };