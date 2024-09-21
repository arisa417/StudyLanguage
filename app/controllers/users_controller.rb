class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 

  end

  before_action :authenticate_user!
  def index
    @users=User.all
    if params[:name].present?
      @users = @users.get_by_name params[:name]
      end
      if params[:gender].present?
      @users = @users.get_by_gender params[:gender]
      end
      if params[:manabitaii].present?
        @users = @users.get_by_manabitaii params[:manabitaii]
      end
        if params[:osierareru].present?
          @users = @users.get_by_osierareru params[:osierareru]
        end
      end
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to root_path
  end

  
  def show
    @user = User.find(params[:id]) 
    
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    
    if @user.id == current_user.id
      @msg = "他のユーザーとDMしてみよう！"
    else
      @isRoom = false
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
  
      if @isRoom
        @room = Room.find(@roomId)
      else
        @room = Room.new
        @entry = Entry.new
        
        # デバッグ用の出力
        puts "ルームが見つかりませんでした。"
        puts "現在のユーザーエントリー: #{@currentUserEntry.inspect}"
        puts "対象ユーザーエントリー: #{@userEntry.inspect}"
        puts "ルームID: #{@roomId.inspect}"
        puts "データベースにルームが存在するか確認: #{Room.all.inspect}"
      end
    end
  end
  
  
  


  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

    private
    
    def user_params
      params.require(:user).permit(:name, :gender, :birth, :manabitaii, :osierareru)
    end