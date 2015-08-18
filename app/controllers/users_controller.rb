
def index
  # @sent_invites = current_user.sent_invites YOU CAN DELETE THIS LINE
  # @received_invites = current_user.received_invites YOU CAN DELETE THIS LINE

  @sent_invites = current_user.sent_invites.page(params[:page])
  @received_invites = current_user.received_invites.page(params[:page])
end
