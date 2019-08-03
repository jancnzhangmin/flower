class AgentusersController < ApplicationController
  before_action :check_auth
  def index
    agentlevels = Agentlevel.all
    agentuserids = []
    agentlevels.each do |agentlevel|
      agentuserids += agentlevel.users.ids
    end
    agentuserids.uniq!
    @agentusers = User.where('id in (?)',agentuserids)
  end

end
