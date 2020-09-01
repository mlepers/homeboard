import consumer from "./consumer";

const scrollLastMessage = () => {
  const messages = document.getElementById('messages');
  if (messages) {
    const lastMessage = messages.lastElementChild;
    lastMessage.scrollIntoView();
  };
};

const controlLastMessageAvatar = () => {
  const messages = document.getElementById('messages');
  const lastMessage = messages.lastElementChild.lastElementChild;
  const noMessage = document.getElementById('no-message');
  if (noMessage){
    noMessage.remove();
  }
  const otherMessages = document.querySelectorAll('.message-other');
  if (otherMessages) {
    const myBeforeLast = otherMessages[otherMessages.length - 2];
    if (myBeforeLast){
      const beforeLastMessage = myBeforeLast.lastElementChild;
      const avatars = document.querySelectorAll('.message-avatar');
      if (avatars){
        const avatar = avatars[avatars.length - 2];
        if (parseInt(lastMessage.dataset.id - 1) == parseInt(beforeLastMessage.dataset.id)) {
          avatar.remove();
          myBeforeLast.insertAdjacentHTML('afterbegin', "<div class = 'message-avatar'> </div>");
        };
      };
    };
  };
}

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        const guestName = document.querySelector('#chat-title');
        if (guestName) {
          const innerGuestName = guestName.innerText;
          if (data.includes(innerGuestName)) {
            messagesContainer.insertAdjacentHTML('beforeend', data);
            scrollLastMessage();
            controlLastMessageAvatar();
          };
        }
      },
    });
  }
}

export { initChatroomCable };
export { scrollLastMessage };