import consumer from "./consumer";

const initNotificationCable = () => {
 
     consumer.subscriptions.create({ channel: "NotificationChannel" }, {
      received(data) {
        const notificationsContainer = document.querySelector(`#${data.notif_id}`);
        if (notificationsContainer == null) {
          const noNotif = document.querySelector(`#number_of_notif`);
          const fisrtNotificationBadge = `<div class="avatar-red" id="${data.notif_id}">1</div>`;
          noNotif.insertAdjacentHTML('beforebegin', fisrtNotificationBadge);  
        } else {
          const numberOfNotifications = parseInt(notificationsContainer.innerText);
          const newNotificationBadge = `<div class="avatar-red" id="${data.notif_id}">${numberOfNotifications +1}</div>`;
          notificationsContainer.insertAdjacentHTML('beforebegin', newNotificationBadge);  
          notificationsContainer.remove()
        }
      },
    });
}

export { initNotificationCable };