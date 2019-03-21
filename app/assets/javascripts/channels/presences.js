App.presences = App.cable.subscriptions.create("PresencesChannel", {
  connected: function() {
    return this.perform('presence', {})
  },

  disconnected: function() {
  },

  received: function(data) {
    $(`#presence-user-${data}`).toggleClass('offline-dot')
    $(`#presence-user-${data}`).toggleClass('online-dot')
  }
});
