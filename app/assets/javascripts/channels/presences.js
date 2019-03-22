App.presences = App.cable.subscriptions.create("PresencesChannel", {
  connected: function() {
    return this.perform('presence', {})
  },

  disconnected: function() {
  },

  received: function(data) {
    $(`#presence-user-${data}`).addClass('online-dot')
    $(`#presence-user-${data}`).removeClass('offline-dot')
    $(`#presence-user-conv-${data}`).addClass('online-dot')
  }
});