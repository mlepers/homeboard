import consumer from "./consumer";

const initNotificationCable = () => {
 
     consumer.subscriptions.create({ channel: "NotificationChannel" }, {
      received(data) {
        const chatroomCards = document.querySelector('.card-chatroom');
        if (chatroomCards) {
          const notificationsContainer = document.querySelector(`#notification-${data.chatroom}`);
          if (notificationsContainer == null) {
            const noNotif = document.querySelector(`#chatroom-${data.chatroom}`);
            const NotificationBadgeFirst = `<div class="notification" id="notification-${data.chatroom}">1</div>`;
            noNotif.insertAdjacentHTML('afterbegin', NotificationBadgeFirst);  
          } else {
            const numberOfNotifications = parseInt(notificationsContainer.innerText);
            const newNotificationBadge = `<div class="notification" id="notification-${data.chatroom}">${numberOfNotifications +1}</div>`;
            notificationsContainer.insertAdjacentHTML('beforebegin', newNotificationBadge);  
            notificationsContainer.remove()
          }
        }

        const menuMobile = document.querySelector(`#messages-on-mobile-menu-${data.receiver.id}`);
        if (menuMobile) {
          const messageNotification = document.querySelector(`.small-notification`);
          if (messageNotification == null) {
            menuMobile.insertAdjacentHTML('beforeend',`<div class="small-notification" ></div>`);
          } else {
            menuMobile.insertAdjacentHTML('beforeend',`<div class="small-notification" ></div>`);
            messageNotification.remove();
          }
              
        }

        const menuDesktop = document.querySelector(`#messages-on-desktop-navbar-${data.receiver.id}`);
        if (menuDesktop) {
          const messageNotificationDesktop = document.querySelector(`.small-notification-for-desktop`);
          if (messageNotificationDesktop == null) {
            menuDesktop.insertAdjacentHTML('beforeend',`<div class="small-notification-for-desktop" ></div>` );
          } else {
            menuDesktop.insertAdjacentHTML('beforeend',`<div class="small-notification-for-desktop" ></div>` );
            messageNotificationDesktop.remove();
          }
        }
        
      },
    });
}

export { initNotificationCable };