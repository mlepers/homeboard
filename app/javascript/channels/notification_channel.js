import consumer from "./consumer";

const initNotificationCable = () => {
 
     consumer.subscriptions.create({ channel: "NotificationChannel" }, {
      received(data) {
      
        const notificationsContainer = document.querySelector(`#${data.notif_id}`);

        const numberOfNotifications = parseInt(notificationsContainer.innerText);

        const newNotificationBadge = `<div class="avatar-red" id="${data.notif_id}">${numberOfNotifications +1}</div>`;

        notificationsContainer.insertAdjacentHTML('beforebegin', newNotificationBadge);
        
        notificationsContainer.remove()
        
      },
    });
}

export { initNotificationCable };