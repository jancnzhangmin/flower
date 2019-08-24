class UsersController < ApplicationController
  before_action :check_auth
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @upagentuser = get_up_agent(@user)
    user_id_list = []
    @customer = get_customer(@user,user_id_list)
    @customer.delete(@user.id)
    agent_id_list = []
    @agent = get_agent(@user,agent_id_list)
    directagent_id_list = []
    childrens = @user.childrens
    childrens.each do |child|
      agentlevel = child.agentlevel
      if agentlevel
        directagent_id_list.push agentlevel.id
      end
    end
    @directagent = directagent_id_list
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deposit #保证金
    @user = User.find(params[:id])
  end

  def update_deposit
    @user = User.find(params[:id])
    @user.deposit = params[:deposit]
    @user.save
    redirect_to users_path
  end

  def addtoagent
    @user = User.find(params[:id])
  end

  def postaddtoagent
    user = User.find(params[:id])
    up_id = params[:up_id].split.first
    user.up_id = up_id
    user.agentlevel_id = params[:agentlevel]
    user.agentpayment = user.agentpayment.to_f + params[:agentpayment].to_f
    user.agentpaymentrecorders.create(agentpayment:params[:agentpayment].to_f, paymenttime:Time.now, summary:params[:summary])
    user.save
    redirect_to users_path
  end

  def get_up_user_list #排除自己和自己下属的用户
    #notin_idarr = []
    #selfuser(params[:selfid],notin_idarr)
    userlist = User.where('id <> ?',params[:selfid])
    render json: '{"userlist": ' + userlist.to_json + '}',content_type: "application/javascript"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:login, :openid, :nickname, :headurl, :income, :withdraw, :ordermsg, :up_id, :agentpayment, :deposit, :receiveneworder)
  end

  def selfuser(selfid,notin_idarr)
    user = User.find(selfid)
    if user
      notin_idarr.push user.id
    end
    childrens = user.childrens
    childrens.each do |children|
      selfuser(children.id,notin_idarr)
    end
    return notin_idarr
  end

  def get_up_agent(user) #获取上级代理
    parent = user.parent
    if parent
      if parent.agentlevel
        return parent
      else
        get_up_agent(parent)
      end
    end
  end

  def get_customer(user,user_id_list) #获取客户
    agentlevel = user.agentlevel
    if !agentlevel
      user_id_list.push user.id
    end
    childrens = user.childrens
    childrens.each do |child|
      get_customer(child,user_id_list)
    end
    return user_id_list
  end

  def get_agent(user,agent_id_list) #获取自己的所有代理
    agentlevel = user.agentlevel
    if agentlevel
      agent_id_list.push agentlevel.id
    end
    childrens = user.childrens
    childrens.each do |child|
      get_agent(child,agent_id_list)
    end
    return  agent_id_list
  end


end
