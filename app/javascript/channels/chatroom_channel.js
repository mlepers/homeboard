import consumer from "./consumer";

const scrollLastMessage = () => {
  const messages = document.getElementById('messages');
  const lastMessage = messages.lastElementChild;
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  };
};

const controlLastMessageAvatar = () => {
  const messages = document.getElementById('messages');
  const lastMessage = messages.lastElementChild.lastElementChild;
  const otherMessages = document.querySelectorAll('.message-other');
  const myBeforeLast = otherMessages[otherMessages.length - 2];
  const beforeLastMessage = myBeforeLast.lastElementChild;
  const avatars = document.querySelectorAll('.message-avatar');
  const avatar = avatars[avatars.length - 2];
  if (parseInt(lastMessage.dataset.id - 1) == parseInt(beforeLastMessage.dataset.id)) {
    avatar.remove();
    myBeforeLast.insertAdjacentHTML('afterbegin', "<div class = 'message-avatar'> </div>");
  };
}

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        const guestName = document.querySelector('#chat-title').innerText;
        if (data.includes(guestName)) {
          messagesContainer.insertAdjacentHTML('beforeend', data);
          scrollLastMessage();
          controlLastMessageAvatar();
        };
      },
    });
  }
}

export { initChatroomCable };