class LoginsController < ApplicationController
  def create
    @status = '账号或密码错误'
    admin = Admin.find_by_login(params[:login])
    if admin && admin.status == 1 && admin.authenticate(params[:password])
      if verify_rucaptcha?(admin)
        session[:login] = admin.login
        session[:name] = admin.name
        redirect_to products_path
      else
        @status = '验证码错误'
      end
    end
  end

  def logout
    session[:login] = nil
    session[:name] = nil
    redirect_to logins_path
  end
end
