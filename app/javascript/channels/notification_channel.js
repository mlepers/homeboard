import consumer from "./consumer";

const initNotificationCable = () => {
 
     consumer.subscriptions.create({ channel: "NotificationChannel" }, {
      received(data) {
        const notificationsContainer = document.querySelector(`#notification-${data.chatroom}`);
        console.log(notificationsContainer);
          if (notificationsContainer == null) {
            const noNotif = document.querySelector(`#chatroom-${data.chatroom}`);
            const NotificationBadgeFirst = `<div class="text-danger" id="notification-${data.chatroom}">1</div>`;
            noNotif.insertAdjacentHTML('afterend', NotificationBadgeFirst);  
            noNotif.remove()
          } else {
            const numberOfNotifications = parseInt(notificationsContainer.innerText);
            const newNotificationBadge = `<div class="text-danger" id="notification-${data.chatroom}">${numberOfNotifications +1}</div>`;
            notificationsContainer.insertAdjacentHTML('beforebegin', newNotificationBadge);  
            notificationsContainer.remove()
          }
      },
    });
}

export { initNotificationCable };