import consumer from "./consumer";

const initNotificationCable = () => {
 
     consumer.subscriptions.create({ channel: "NotificationChannel" }, {
      received(data) {
        const chatroomCards = document.querySelectorAll('card-chatroom');
        if (chatroomCards) {
          const notificationsContainer = document.querySelector(`#notification-${data.chatroom}`);
          if (notificationsContainer == null) {
            const noNotif = document.querySelector(`#chatroom-${data.chatroom}`);
            const NotificationBadgeFirst = `<div class="notification" id="notification-${data.chatroom}">1</div>`;
            noNotif.insertAdjacentHTML('afterend', NotificationBadgeFirst);  
            noNotif.remove()
          } else {
            const numberOfNotifications = parseInt(notificationsContainer.innerText);
            const newNotificationBadge = `<div class="notification" id="notification-${data.chatroom}">${numberOfNotifications +1}</div>`;
            notificationsContainer.insertAdjacentHTML('beforebegin', newNotificationBadge);  
            notificationsContainer.remove()
          }
        }
      },
    });
}

export { initNotificationCable };